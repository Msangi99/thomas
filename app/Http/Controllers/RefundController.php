<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use App\Models\Refund;
use App\Models\RefundPercentage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RefundController extends Controller
{
    /**
     * Normalize phone to digits only, 255XXXXXXXXX for comparison.
     */
    private function normalizePhone(?string $phone): string
    {
        if ($phone === null || $phone === '') {
            return '';
        }
        $digits = preg_replace('/\D/', '', $phone);
        if (strpos($digits, '0') === 0 && strlen($digits) <= 10) {
            $digits = '255' . substr($digits, 1);
        } elseif (strlen($digits) >= 9 && substr($digits, 0, 3) !== '255') {
            $digits = '255' . $digits;
        }
        return $digits;
    }

    public function get_booking(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'booking_id' => 'required|exists:bookings,id',
            'fullname'   => 'required|string|max:255',
        ], [
            'booking_id.required' => 'Booking is required.',
            'booking_id.exists'   => 'Booking not found.',
            'fullname.required'  => 'Please enter your full name.',
        ]);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        $mobile = trim((string) $request->mobile_number);
        $bank   = trim((string) $request->bank_number);

        if ($mobile === '' && $bank === '') {
            return back()->with('error', 'Please enter a valid mobile number or bank account number.')->withInput();
        }

        if ($mobile !== '' && !preg_match('/^[0-9]{9,15}$/', preg_replace('/\D/', '', $mobile))) {
            return back()->with('error', 'Mobile number must be 9–15 digits.')->withInput();
        }

        if ($bank !== '' && !preg_match('/^[0-9]{5,25}$/', preg_replace('/\D/', '', $bank))) {
            return back()->with('error', 'Bank account number must be 5–25 digits.')->withInput();
        }

        $booking = Booking::where('id', $request->booking_id)
            ->where('payment_status', 'Paid')
            ->first();

        if (!$booking) {
            return back()->with('error', 'Booking not available for refund or does not exist.');
        }

        if ($booking->travel_date < (new ConstData())->carbon(6)) {
            return back()->with('error', 'Booking not available for refund or does not exist.');
        }

        // Validate mobile or bank matches an existing number: mobile must match booking customer phone
        if ($mobile !== '') {
            $normalizedInput = $this->normalizePhone($mobile);
            $normalizedBooking = $this->normalizePhone($booking->customer_phone);
            if ($normalizedBooking !== '' && $normalizedInput !== $normalizedBooking) {
                return back()->with('error', 'Mobile number must match the phone number used for this booking (' . $booking->customer_phone . ').')->withInput();
            }
        }

        $amount = (new ConstData())->refund_logic($booking->id);
        $percentage = (float) ($booking->busFee ?? 0) - (float) $amount;

        // post request
        $data = Refund::create([
            'booking_code' => $booking->booking_code,
            'amount' => $amount, // Access busFee from the retrieved booking model
            'status' => 'Pending',
            'phone' => $mobile !== '' ? $request->mobile_number : $request->bank_number,
            'fullname' => $request->fullname,
        ]); 

        $booking->update([
            'payment_status' => 'refunded',
            //'refund_id' => $data->id,
        ]);

        RefundPercentage::create([
            'booking_code' => $booking->booking_code,
            'amount' => $percentage,
        ]);

        return back()->with('success','Refund request sent successfully');


    }
}
