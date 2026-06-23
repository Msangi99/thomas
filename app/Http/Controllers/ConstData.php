<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use Carbon\Carbon;

class ConstData extends Controller
{
    /**
     * Cancel refund tiers (hours before departure):
     * >= 72h: 100% | 48–72h: 80% | 24–48h: 50% | < 24h: 0%
     */
    public function cancel_logic($booking_id): float
    {
        $booking = Booking::find($booking_id);
        if (!$booking) {
            return 0;
        }

        $travel = $this->travelAt($booking);

        if ($travel->gt($this->thresholdFromNow(72))) {
            return (float) $booking->busFee;
        }

        if ($travel->gt($this->thresholdFromNow(48))) {
            return (float) $booking->busFee * 0.8;
        }

        if ($travel->gt($this->thresholdFromNow(24))) {
            return (float) $booking->busFee * 0.5;
        }

        return 0;
    }

    /**
     * Refund tiers (hours before departure):
     * >= 48h: 100% | 24–48h: 80% | 6–24h: 50% | <= 6h: 0% (not eligible)
     */
    public function refund_logic($booking_id): float
    {
        $booking = Booking::find($booking_id);
        if (!$booking) {
            return 0;
        }

        if (!$this->isRefundAllowed($booking)) {
            return 0;
        }

        $travel = $this->travelAt($booking);

        if ($travel->gt($this->thresholdFromNow(48))) {
            return (float) $booking->busFee;
        }

        if ($travel->gt($this->thresholdFromNow(24))) {
            return (float) $booking->busFee * 0.8;
        }

        return (float) $booking->busFee * 0.5;
    }

    /**
     * Datetime string for now + $hours (used for legacy string comparisons).
     */
    public function carbon($hours)
    {
        return $this->thresholdFromNow((int) $hours)->format('Y-m-d H:i:s');
    }

    public function isRefundAllowed(Booking $booking): bool
    {
        return $this->travelAt($booking)->gt($this->thresholdFromNow(6));
    }

    public function isCancelAllowed(Booking $booking): bool
    {
        return $this->travelAt($booking)->gt($this->thresholdFromNow(24));
    }

    private function travelAt(Booking $booking): Carbon
    {
        return Carbon::parse($booking->travel_date);
    }

    private function thresholdFromNow(int $hours): Carbon
    {
        return Carbon::now()->addHours($hours);
    }
}
