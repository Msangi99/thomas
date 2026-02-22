<?php

namespace App\Http\Controllers;

use App\Mail\SendEmail;
use App\Models\Booking;
use App\Models\Roundtrip;
use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class RedirectController extends Controller
{
    public function showBookingStatus($bookingId)
    {
        $booking = Booking::with('bus.route', 'campany.busOwnerAccount', 'campany.user')
            ->where('id', $bookingId)
            ->orwhere('transaction_ref_id', $bookingId)
            ->first();

        if (!$booking) {
            abort(404, 'Booking not found.');
        }

        return view('bookings.status', compact('booking'));
    }
    public function _redirect($transactionRefId)
    {
        $data = Booking::with('bus.route', 'campany.busOwnerAccount', 'campany.user')
            ->where('transaction_ref_id', $transactionRefId)
            ->orWhere('id', $transactionRefId)
            ->first();

        if (!$data) {
            return view('payments.failed', ['data' => null]);
        }

        // Payment provider may redirect the user before the server callback has run.
        // Show "processing" and auto-refresh instead of "failed" so we don't show
        // "Payment Failed" when payment actually succeeded.
        if ($data->payment_status != "Paid") {
            $isPendingByRef = (string) $data->transaction_ref_id === (string) $transactionRefId
                || (string) $data->id === (string) $transactionRefId;
            if ($isPendingByRef) {
                return view('payments.processing', ['data' => $data]);
            }
            return view('payments.failed', compact('data'));
        }

        // Payment is Paid - show success, send notifications
        // --- TRA INTEGRATION ---
        try {
            $tra = new \App\Services\TraVfdService();
            $tra->fiscalize($data);
            // Refresh data to get TRA tokens if updated
            $data->refresh();
        } catch (\Exception $e) {
            \Illuminate\Support\Facades\Log::error("TRA Error: " . $e->getMessage());
        }
        // -----------------------

        $settings = Setting::first();
        $sendCustomerSms = $settings ? (bool) $settings->enable_customer_sms_notifications : true;
        $sendCustomerEmail = $settings ? (bool) $settings->enable_customer_email_notifications : true;
        $sendConductorSms = $settings ? (bool) $settings->enable_conductor_sms_notifications : true;
        $sendConductorEmail = $settings ? (bool) $settings->enable_conductor_email_notifications : true;

        $customerMessage = "Dear {$data->customer_name}, Karibu {$data->campany->name}. Utasafiri na basi namba {$data->bus->bus_number} Tarehe {$data->travel_date} kutoka {$data->pickup_point} kwenda {$data->dropping_point} muda wa kuondoka ni {$data->bus->route->route_start} tafadhali report kituoni mapema kwa safari.Namba ya kiti chako ni {$data->seat} na namba yako ya safari ni {$data->booking_code}. Kwa mawasiliano piga {$data->bus->conductor}. HIGHLINK ISGC inakutakia safari njema";
        $conductorMessage = "Dear conductor, Kiti {$data->seat} katika basi namba {$data->bus->bus_number} kimeuzwa kwa {$data->customer_name} kwa safari ya kutoka {$data->pickup_point} kwenda {$data->dropping_point} tarehe {$data->travel_date} namba ya safari yake ni {$data->booking_code} wasiliana naye kwa namba {$data->customer_phone} HIGHLINK ISGC inawatakia safari njema";

        if ($sendCustomerSms && !empty($data->customer_phone)) {
            $sms = new SmsController();
            $sms->sms_send($data->customer_phone, $customerMessage);
        }

        if ($sendConductorSms && !empty($data->bus->conductor)) {
            $sms = isset($sms) ? $sms : new SmsController();
            $sms->sms_send($data->bus->conductor, $conductorMessage);
        }

        if ($sendCustomerEmail && !empty($data->customer_email)) {
            Mail::to($data->customer_email)->send(new SendEmail($customerMessage));
        }

        $conductorEmail = $data->bus && $data->bus->campany && $data->bus->campany->user
            ? $data->bus->campany->user->email
            : ($data->campany && $data->campany->user ? $data->campany->user->email : null);

        if ($sendConductorEmail && !empty($conductorEmail)) {
            Mail::to($conductorEmail)->send(new SendEmail($conductorMessage));
        }

        // After ClickPesa (or other) payment success, send customers to My Ticket with message
        if (auth()->check() && auth()->user()->role === 'customer') {
            return redirect()->route('customer.mybooking')->with('success', __('all.payment_successful') ?: 'Payment successful');
        }

        return view('payments.success', compact('data'));
    }

    // public function _round($booking1, $booking2)
    // {
    //     $bookingone = Booking::with('bus.route', 'campany.busOwnerAccount')
    //         ->orwhere('id', $booking1)
    //         ->first();
    //     $bookingtwo = Booking::with('bus.route', 'campany.busOwnerAccount')
    //         ->orwhere('id', $booking2)
    //         ->first();

    //     return ['bookingone' => $bookingone, 'bookingtwo' => $bookingtwo];
    // }

    public function showRoundTripBookingStatus($booking1Id, $booking2Id)
    {
        //$bookings = $this->_round($booking1Id, $booking2Id);

        $bookingone = $booking1Id;
        $bookingtwo = $booking2Id;

        if (!$bookingone || !$bookingtwo) {
            abort(404, 'One or both bookings not found.');
        }

        // --- TRA INTEGRATION ---
        try {
            $tra = new \App\Services\TraVfdService();
            if($bookingone instanceof Booking && $bookingone->payment_status == 'Paid') $tra->fiscalize($bookingone);
            if($bookingtwo instanceof Booking && $bookingtwo->payment_status == 'Paid') $tra->fiscalize($bookingtwo);
            
            if($bookingone instanceof Booking) $bookingone->refresh();
            if($bookingtwo instanceof Booking) $bookingtwo->refresh();

        } catch (\Exception $e) {
            \Illuminate\Support\Facades\Log::error("TRA Error (RoundTrip): " . $e->getMessage());
        }
        // -----------------------

        return view('bookings.roundtrip_status', compact('bookingone', 'bookingtwo'));
    }
}
