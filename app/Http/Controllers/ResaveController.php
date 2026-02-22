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

    /**
     * Normalize phone for ClickPesa/DPO/Mix: digits only, 255XXXXXXXXX (Tanzania).
     * Returns normalized string or null if invalid/empty.
     */
    private function normalizePaymentPhone(?string $value): ?string
    {
        if ($value === null || trim($value) === '') {
            return null;
        }
        $digits = preg_replace('/[^0-9]/', '', $value);
        if ($digits === '') {
            return null;
        }
        if (strpos($digits, '0') === 0) {
            $digits = '255' . substr($digits, 1);
        } elseif (substr($digits, 0, 3) !== '255') {
            $digits = '255' . $digits;
        }
        // Tanzania: 255 + 9 digits (e.g. 255712345678)
        if (strlen($digits) === 12 && substr($digits, 0, 3) === '255') {
            return $digits;
        }
        return null;
    }

    /**
     * Resolve payment phone from request or booking; normalize and validate.
     * Returns [normalized_phone, error_message]. error_message is null on success.
     */
    private function resolvePaymentPhone(Request $request, Booking $booking, string $formField = 'payment_phone', string $mixField = 'payment_contact'): array
    {
        $raw = $request->input($formField) ?: $request->input($mixField);
        $raw = $raw ? trim($raw) : null;
        if ($raw === null || $raw === '') {
            $raw = $booking->customer_phone ?? $booking->phone ?? null;
        }
        $normalized = $this->normalizePaymentPhone($raw ?? '');
        if ($normalized === null) {
            return [null, __('customer/busroot.invalid_payment_phone')];
        }
        return [$normalized, null];
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

        [$phone, $phoneError] = $this->resolvePaymentPhone($request, $booking, 'payment_phone', 'payment_contact');
        if ($phoneError !== null) {
            return $this->backWithError($booking->id, $phoneError);
        }

        $postedData = [
            'account' => $phone,
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

        [$phone, $phoneError] = $this->resolvePaymentPhone($request, $booking, 'payment_phone');
        if ($phoneError !== null) {
            return $this->backWithError($booking->id, $phoneError);
        }

        try {
            $pdoController = new PDOController();
            return $pdoController->initiatePayment(
                $booking->amount,
                $booking->first_name ?? $booking->customer_name ?? 'Customer',
                $booking->last_name ?? '',
                $phone,
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
        $email = $booking->customer_email ?? '';

        [$phone, $phoneError] = $this->resolvePaymentPhone($request, $booking, 'payment_phone');
        if ($phoneError !== null) {
            return $this->backWithError($booking->id, $phoneError);
        }

        Session::put('booking', $booking);

        // Unique order reference per attempt (ClickPesa rejects duplicate order references)
        $orderReference = $booking->booking_code . '-' . time();

        try {
            $clickpesa = new ClickPesaController();
            return $clickpesa->initiatePayment(
                $total,
                $name,
                $name,
                $phone,
                $email,
                $orderReference
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
