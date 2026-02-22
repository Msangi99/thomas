<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use App\Http\Controllers\PDOController;
use App\Http\Controllers\TigosecureController;
use App\Http\Controllers\ClickPesaController;

class ResaveController extends Controller
{
    /**
     * Redirect back to pay-resaved page with error message.
     */
    private function backWithError($bookingId, $message, $key = 'payment_error')
    {
        return redirect()->route('customer.pay.resaved', ['id' => $bookingId])
            ->withErrors([$key => $message])
            ->withInput();
    }

    public function byMix(Request $request)
    {
        $request->validate(['booking_id' => 'required']);

        $booking = Booking::where('id', $request->booking_id)
            ->where('payment_status', 'resaved')
            ->first();

        if (!$booking) {
            return redirect()->route('customer.mybooking')
                ->withErrors(['payment_error' => 'Booking not found or not eligible for payment.']);
        }

        $postedData = [
            'account' => $booking->customer_phone ?? $booking->phone ?? '',
            'countryCode' => '255',
            'country' => 'TZA',
            'firstName' => $booking->customer_name ?? $booking->first_name ?? 'Customer',
            'lastName' => $booking->last_name ?? '',
            'email' => $booking->customer_email ?? $booking->email ?? '',
            'amount' => $booking->amount,
            'currency' => 'TZS',
        ];

        try {
            $tigoSecureController = new TigosecureController();
            return $tigoSecureController->payment($postedData);
        } catch (\Exception $e) {
            Log::error('Resaved Mix payment failed: ' . $e->getMessage(), [
                'booking_id' => $booking->id,
                'trace' => $e->getTraceAsString(),
            ]);
            return $this->backWithError($booking->id, 'Mix payment failed: ' . $e->getMessage());
        }
    }

    public function byPdo(Request $request)
    {
        $request->validate(['booking_id' => 'required']);

        $booking = Booking::where('id', $request->booking_id)
            ->where('payment_status', 'resaved')
            ->first();

        if (!$booking) {
            return redirect()->route('customer.mybooking')
                ->withErrors(['payment_error' => 'Booking not found or not eligible for payment.']);
        }

        try {
            $pdoController = new PDOController();
            return $pdoController->initiatePayment(
                $booking->amount,
                $booking->first_name ?? $booking->customer_name ?? 'Customer',
                $booking->last_name ?? '',
                $booking->phone ?? $booking->customer_phone ?? '',
                $booking->email ?? $booking->customer_email ?? '',
                $booking->booking_code
            );
        } catch (\Exception $e) {
            Log::error('Resaved DPO payment failed: ' . $e->getMessage(), [
                'booking_id' => $booking->id,
                'trace' => $e->getTraceAsString(),
            ]);
            return $this->backWithError($booking->id, 'DPO payment failed: ' . $e->getMessage());
        }
    }

    /**
     * Pay resaved ticket via ClickPesa.
     */
    public function byClickPesa(Request $request)
    {
        $request->validate(['booking_id' => 'required|exists:bookings,id']);

        $booking = Booking::where('id', $request->booking_id)
            ->where('user_id', $request->user()->id)
            ->where('payment_status', 'resaved')
            ->firstOrFail();

        $setting = Setting::first();
        $price = $booking->amount;
        $fees = $setting ? ($setting->service + ($setting->service_percentage / 100 * ($booking->amount * 100 / 118))) : 0;
        $total = round($price + $fees);

        $name = $booking->customer_name ?? 'Customer';
        $phone = $booking->customer_phone ?? '';
        $email = $booking->customer_email ?? '';

        Session::put('booking', $booking);

        try {
            $clickpesa = new ClickPesaController();
            return $clickpesa->initiatePayment(
                $total,
                $name,
                $name,
                $phone,
                $email,
                $booking->booking_code
            );
        } catch (\Throwable $e) {
            Log::error('Resaved ClickPesa payment failed: ' . $e->getMessage(), [
                'booking_id' => $booking->id,
                'trace' => $e->getTraceAsString(),
                'file' => $e->getFile(),
                'line' => $e->getLine(),
            ]);
            return $this->backWithError(
                $booking->id,
                'ClickPesa error: ' . (strlen($e->getMessage()) > 200 ? substr($e->getMessage(), 0, 200) . '…' : $e->getMessage())
            );
        }
    }
}
