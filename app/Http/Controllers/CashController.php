<?php

namespace App\Http\Controllers;

use App\Models\AdminWallet;
use App\Models\Bima;
use App\Models\Booking;
use App\Models\bus;
use App\Models\Campany;
use App\Models\PaymentFees;
use App\Models\Setting;
use App\Models\SystemBalance;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Session;
use App\Http\Controllers\PercentController;
use App\Services\BookingSettlementService;

class CashController extends Controller
{
    /**
     * Vendor roles that sell tickets and fund cash sales from the vendor cash wallet.
     */
    private static function isVendorTicketSeller(?User $user): bool
    {
        return $user && ($user->isVender() || $user->isBusCampany() || $user->isLocalBusOwner());
    }

    /**
     * @return string|null Error message if the sale must be blocked, null if OK or not applicable.
     */
    public static function vendorCashWalletBlockReason(?User $user, float $deduct): ?string
    {
        if (!self::isVendorTicketSeller($user) || $deduct <= 0) {
            return null;
        }
        $vb = $user->VenderBalances;
        if (!$vb) {
            return 'No vendor wallet is set up for your account. You cannot complete a cash sale until a wallet exists.';
        }
        if (Schema::hasColumn('vender_balances', 'sell_cash_amount')) {
            $avail = (float) ($vb->sell_cash_amount ?? 0);
            if ($avail + 0.0001 < $deduct) {
                return 'Insufficient cash wallet balance for this sale. Required: '
                    . number_format($deduct, 2) . ' TZS; available: ' . number_format($avail, 2)
                    . ' TZS. Add a deposit or move funds from your commission wallet on the Transactions page.';
            }
        } else {
            $avail = (float) ($vb->amount ?? 0);
            if ($avail + 0.0001 < $deduct) {
                return 'Insufficient wallet balance for this cash sale. Required: '
                    . number_format($deduct, 2) . ' TZS; available: ' . number_format($avail, 2) . ' TZS.';
            }
        }

        return null;
    }

    private static function redirectVendorCashBlocked(string $message): \Illuminate\Http\RedirectResponse
    {
        if (session()->get('is_round')) {
            return redirect()->route('round.trip.payment')->withErrors(['payment_error' => $message]);
        }

        $u = Auth::user();
        if ($u instanceof User && $u->isVender()) {
            return redirect()->route('vender.pay')->with('error', $message);
        }

        return redirect()->back()->with('error', $message);
    }

    public function cash($booking, $xcode)
    {
        //return ['booking' => $booking, 'code' => $xcode];
        //return $booking;
        return $this->processSuccessfulPayment($booking, $xcode);
    }

    private function processSuccessfulPayment($booking, $transToken)
    {
        // Retrieve booking using CompanyRef (which should be booking_code)
        $booking1 = session()->get('booking1');
        $booking2 = session()->get('booking2');
        if (!is_null($booking1) && !is_null($booking2)) {
            $round = new RoundpaymentController();
            $code1 = $booking1->booking_code ?? 'N/A';
            $code2 = $booking2->booking_code ?? 'N/A';
            $data1 = $round->roundtrip($transToken, $transToken, null, $code1);
            $data2 = $round->roundtrip($transToken, $transToken, null, $code2);

            if (is_array($data1) && isset($data1['errorMessage'])) {
                $go = new \App\Http\Controllers\RoundTripController();
                return $go->paymentFailed($data1['errorMessage'] ?? 'Booking not found');
            }
            if (is_array($data2) && isset($data2['errorMessage'])) {
                $go = new \App\Http\Controllers\RoundTripController();
                return $go->paymentFailed($data2['errorMessage'] ?? 'Booking not found');
            }

            $red = new RedirectController();
            return $red->showRoundTripBookingStatus($data1, $data2);
        }
        $code = $booking->booking_code;
        $booking = Booking::where('booking_code', $code)->first();

        if (!$booking) {
            Log::error('Booking not found', ['transaction_ref_id' => $transToken]);
            return [
                'errorMessage' => 'Booking not found',
                'transactionToken' => $transToken
            ];
        }

        // Check for duplicate processing
        if ($booking->payment_status !== 'Unpaid') {
            Log::warning('Booking already processed', ['transaction_ref_id' => $transToken]);
            return view('dpo.success', [
                'message' => 'Payment already processed',
                'booking' => $booking
            ]);
        }

        $user = Auth::user();
        if ($user instanceof User) {
            $deductRequired = (float) round((float) $booking->amount);
            $block = self::vendorCashWalletBlockReason($user, $deductRequired);
            if ($block !== null) {
                Log::warning('Vendor cash sale blocked — insufficient cash wallet', [
                    'user_id' => $user->id,
                    'booking_code' => $booking->booking_code,
                    'required' => $deductRequired,
                ]);

                return self::redirectVendorCashBlocked($block);
            }
        }

        // Begin transaction
        DB::beginTransaction();

        try {
            $bimaAmount = $booking->bima_amount ?? 0;

            $user = auth()->user();
            $deduct = round($booking->amount);
            $vb = $user->VenderBalances;
            if ($vb && Schema::hasColumn('vender_balances', 'sell_cash_amount')) {
                $vb->decrement('sell_cash_amount', $deduct);
            } else {
                $user->VenderBalances()->decrement('amount', $deduct);
            }

            $settlementService = app(BookingSettlementService::class);
            $settled = $settlementService->settlePaidBooking($booking, [
                'trans_status' => 'success',
                'trans_token' => $transToken,
                'payment_method' => 'cash',
                'cancel_amount' => Session::get('cancel', 0),
            ]);
            $booking = $settled['booking'];
            $bus = $settled['bus'];
            $busOwnerAmount = $settled['bus_owner_amount'];
            $systemBalanceAmount = $settled['system_balance_amount'];
            $paymentFeesAmount = $settled['payment_fees_amount'];

            DB::commit();

            // --- TRA INTEGRATION ---
            try {
                Log::info('TRA Fiscalization Starting (Cash Payment)', [
                    'booking_id' => $booking->id,
                    'booking_code' => $booking->booking_code,
                    'payment_method' => 'cash',
                    'amount' => $booking->amount,
                ]);
                
                $tra = new \App\Services\TraVfdService();
                $fiscalized = $tra->fiscalize($booking->refresh());
                
                if ($fiscalized) {
                    Log::info('TRA Fiscalization Successful (Cash Payment)', [
                        'booking_id' => $booking->id,
                        'booking_code' => $booking->booking_code,
                        'tra_status' => $booking->tra_status,
                        'tra_vnum' => $booking->tra_vnum ?? 'N/A',
                    ]);
                } else {
                    Log::warning('TRA Fiscalization Returned False (Cash Payment)', [
                        'booking_id' => $booking->id,
                        'booking_code' => $booking->booking_code,
                        'tra_status' => $booking->tra_status ?? 'N/A',
                        'tra_error' => $booking->tra_error ?? 'N/A',
                    ]);
                }
            } catch (\Exception $e) {
                Log::error("TRA Fiscalization Failed (Cash Payment): " . $e->getMessage(), [
                    'booking_id' => $booking->id,
                    'booking_code' => $booking->booking_code,
                    'error' => $e->getMessage(),
                    'trace' => $e->getTraceAsString(),
                ]);
            }
            // -----------------------

            Log::info('DPO Payment processed successfully', [
                'booking_id' => $booking->id,
                'company_id' => $bus->campany->id,
                'company_balance_increment' => $busOwnerAmount,
                'system_balance' => $systemBalanceAmount,
                'payment_fees' => $paymentFeesAmount,
                'vendor_fee_share' => $booking->vender_fee ?? 0,
                'vendor_service_share' => $booking->vender_service ?? 0,
                'bima_amount' => $bimaAmount,
            ]);

            /*return view('dpo.success', [
                'message' => 'Payment processed successfully',
                'booking' => $booking->fresh() // Get updated booking
            ]);*/

            Session::forget('booking');
            Session::forget('cancel');
            $key = new FunctionsController();
            $key->delete_key($booking);

            /* if (auth()->check()) {
                if (auth()->user()->role == 'customer') {
                    return redirect()->route('customer.mybooking')->with('success', 'Payment processed successfully');
                } elseif(auth()->user()->role == 'vender') {
                    return redirect()->route('vender.index')->with('success', 'Payment processed successfully');
                }else{
                    return redirect()->route('home')->with('success', 'Payment processed successfully');
                }
            }else{
                return redirect()->route('home')->with('success', 'Payment processed successfully');
            } */

            $url = new RedirectController();
            return $url->_redirect($booking->id);
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Failed to update records in DPO payment', [
                'error' => $e->getMessage(),
                'booking_id' => $booking->id,
                'transaction_token' => $transToken
            ]);

            $url = new RedirectController();
            return $url->_redirect($booking->id);

            /*return [
                'error' => $e->getMessage(),
                'booking_id' => $booking->id,
                'transaction_token' => $transToken
            ];*/
        }
    }
}
