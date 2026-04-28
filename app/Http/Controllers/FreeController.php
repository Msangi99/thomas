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
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use App\Http\Controllers\PercentController;
use App\Services\BookingSettlementService;

class FreeController extends Controller
{
    public function cash($booking, $xcode)
    {
        //return ['booking' => $booking, 'code' => $xcode];
        //return $booking;
        return $this->processSuccessfulPayment($booking, $xcode);
    }

    private function processSuccessfulPayment($booking, $transToken)
    {
        // Retrieve booking using CompanyRef (which should be booking_code)
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

        // Begin transaction
        DB::beginTransaction();

        try {
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
            $bimaAmount = $booking->bima_amount ?? 0;

            DB::commit();

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
