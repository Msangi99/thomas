<?php

namespace App\Http\Middleware;

use App\Models\Booking;
use Carbon\Carbon;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class Reserved
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        // Delete all schedules where schedule_date is before today
        //Schedule::where('schedule_date', '<', now()->startOfDay())->delete();

        $bookings = Booking::where('payment_status', 'Reserved')
            ->orWhere('payment_status', 'resaved')
            ->get();

        foreach ($bookings as $booking) {
            // Check if booking should be deleted 6 hours before trip
            if ($booking->travel_date && $booking->schedule) {
                try {
                    $travelDateTime = Carbon::parse($booking->travel_date . ' ' . ($booking->schedule->start ?? '00:00:00'));
                    $sixHoursBefore = $travelDateTime->copy()->subHours(6);
                    $now = Carbon::now();

                    // If it's 6 hours before trip and not paid, delete it
                    if ($now >= $sixHoursBefore && $booking->payment_status !== 'Paid') {
                        $booking->delete();
                        continue;
                    }
                } catch (\Exception $e) {
                    // If date parsing fails, continue with old logic
                }
            }

            // Old logic: delete if created more than 1 day ago
            $mda = Carbon::parse($booking->created_at)->addDays(1);
            $now = Carbon::now();

            if($now > $mda && $booking->payment_status !== 'Paid') {
                $booking->delete();
            }
        }
        return $next($request);
    }
}
