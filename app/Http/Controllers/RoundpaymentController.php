<?php

namespace App\Http\Controllers;

use App\Models\AdminWallet;
use App\Models\Bima;
use App\Models\bus;
use App\Models\Booking;
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

class RoundpaymentController extends Controller
{
    public function roundtrip($transToken = null, $companyRef = null, $verifyResponse = null, $code = null)
    {
        // Retrieve booking using CompanyRef (which should be booking_code)
        //$code = session('booking')->booking_code;
        $booking = Booking::where('booking_code', $code)->first();

        if (!$booking) {
            Log::error('Booking not found', [
                'booking_code' => $code,
                'company_ref' => $companyRef,
            ]);
            return [
                'errorMessage' => 'Booking not found',
                'transactionToken' => $transToken
            ];
        }

        // Check for duplicate processing - return booking so callers get consistent type (Booking)
        if ($booking->payment_status !== 'Unpaid') {
            Log::warning('Booking already processed', [
                'booking_code' => $code,
                'company_ref' => $companyRef,
            ]);
            return $booking;
        }

        // Begin transaction
        DB::beginTransaction();

        try {
            $settlementService = app(BookingSettlementService::class);
            $settled = $settlementService->settlePaidBooking($booking, [
                'trans_status' => 'success',
                'trans_token' => $transToken,
                'payment_method' => 'dpo',
                'cancel_amount' => Session::get('cancel', 0),
            ]);
            $booking = $settled['booking'];
            $bus = $settled['bus'];
            $busOwnerAmount = $settled['bus_owner_amount'];
            $systemBalanceAmount = $settled['system_balance_amount'];
            $paymentFeesAmount = $settled['payment_fees_amount'];
            $bimaAmount = $booking->bima_amount ?? 0;

            DB::commit();

            // --- TRA INTEGRATION ---
            try {
                Log::info('TRA Fiscalization Starting (DPO Round Trip Payment)', [
                    'booking_id' => $booking->id,
                    'booking_code' => $booking->booking_code,
                    'payment_method' => 'dpo',
                    'amount' => $booking->amount,
                    'transaction_token' => $transToken,
                ]);
                
                $tra = new \App\Services\TraVfdService();
                $fiscalized = $tra->fiscalize($booking->refresh());
                
                if ($fiscalized) {
                    Log::info('TRA Fiscalization Successful (DPO Round Trip Payment)', [
                        'booking_id' => $booking->id,
                        'booking_code' => $booking->booking_code,
                        'tra_status' => $booking->tra_status,
                        'tra_vnum' => $booking->tra_vnum ?? 'N/A',
                    ]);
                } else {
                    Log::warning('TRA Fiscalization Returned False (DPO Round Trip Payment)', [
                        'booking_id' => $booking->id,
                        'booking_code' => $booking->booking_code,
                        'tra_status' => $booking->tra_status ?? 'N/A',
                        'tra_error' => $booking->tra_error ?? 'N/A',
                    ]);
                }
            } catch (\Exception $e) {
                Log::error("TRA Fiscalization Failed (DPO Round Trip Payment): " . $e->getMessage(), [
                    'booking_id' => $booking->id,
                    'booking_code' => $booking->booking_code,
                    'transaction_token' => $transToken,
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
            /*
            
            if (auth()->check()) {
                if (auth()->user()->role == 'customer') {
                    return redirect()->route('customer.mybooking')->with('success', 'Payment processed successfully');
                } elseif(auth()->user()->role == 'vender') {
                    return redirect()->route('vender.index')->with('success', 'Payment processed successfully');
                }else{
                    return redirect()->route('home')->with('success', 'Payment processed successfully');
                }
            }else{
                return redirect()->route('home')->with('success', 'Payment processed successfully');
            }   
                */

            $url = new RedirectController();

            // Return the processed booking for success handling
            return $booking;

        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Failed to update records in DPO payment', [
                'error' => $e->getMessage(),
                'booking_id' => $booking->id,
                'transaction_token' => $transToken
            ]);

            // Redirect to the round trip failed page
            $go = new RoundTripController();
            return $go->paymentFailed($e->getMessage());
        }
    }
}
