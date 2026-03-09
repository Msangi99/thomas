<?php

namespace App\Http\Controllers;

use App\Jobs\UpdateUsersJob;
use App\Mail\UpdateUsersMail;
use App\Models\Booking;
use App\Models\Bus;
use App\Models\Route;
use App\Models\Schedule;
use App\Models\Setting;
use Illuminate\Http\Request;
use Mail;

class ScheduleController extends Controller
{
    public function edit($id)
    {
        $user = auth()->user();
        $companyId = $user->campany_id ?? $user->campany?->id ?? null;
        if (!$companyId) {
            abort(403, __('You do not have a company assigned. Only bus owners with a company can edit schedules.'));
        }

        $schedule = Schedule::with(['bus.busname', 'route'])->findOrFail($id);
        if ($schedule->bus->campany_id != $companyId) {
            abort(403, __('You can only edit schedules for your company buses.'));
        }

        $buses = Bus::with('busname', 'campany')
            ->where('campany_id', $companyId)
            ->get();
        $routes = Route::all();

        $layout = $user->role === 'vender' ? 'vender.app' : 'admin.app';
        $backRoute = $user->role === 'vender' ? 'vender.bus_route' : 'schedules';
        $updateRoute = $user->role === 'vender' ? 'vender.update_schedule' : 'update_schedule';
        return view('controller.schedule_edit', compact('schedule', 'buses', 'routes', 'layout', 'backRoute', 'updateRoute'));
    }

    public function update(Request $request, $id)
    {
        $schedule = Schedule::findOrFail($id);

        // Validate request data
        $validated = $request->validate([
            'bus_id' => ['required', 'exists:buses,id'],  
            'start' => ['required'],
            'end' => ['required'],
            'schedule_date' => ['required', 'date'], // Add schedule_date validation
        ]);

        // Ensure the bus belongs to the user's company
        $user = auth()->user();
        $companyId = $user->campany_id ?? $user->campany?->id ?? null;
        if (!$companyId) {
            abort(403, __('You do not have a company assigned.'));
        }
        $bus = Bus::findOrFail($validated['bus_id']);
        if ($bus->campany_id != $companyId) {
            abort(403, 'Unauthorized action.');
        }

        if ($request->bus_id != $schedule->bus_id) {
            $schedule->update($validated);

            // Get bookings related to the schedule
            $bookings = Booking::with('bus','campany','route.schedule') 
                ->where('payment_status', 'Paid')
                ->where('travel_date', $schedule->schedule_date)
                ->get();
            /////////////////notify user////////////////////

            if(count($bookings) > 0) {
                // Check if email notifications are enabled
                $settings = Setting::first();
                $sendEmail = $settings ? (bool) ($settings->enable_customer_email_notifications ?? true) : true;

                if ($sendEmail) {
                    foreach($bookings as $booking) {
                        //UpdateUsersJob::dispatch($booking);
                        if (!empty($booking->customer_email)) {
                            try {
                                Mail::to($booking->customer_email)->send(new UpdateUsersMail($booking)); // pass $schedule
                            } catch (\Exception $e) {
                                \Illuminate\Support\Facades\Log::error("Failed to send schedule update email: " . $e->getMessage(), [
                                    'booking_id' => $booking->id ?? null,
                                    'customer_email' => $booking->customer_email,
                                ]);
                            }
                        }
                    }
                }
            }
            
            //////////////////////////////////////////////////

            return back()->with('success', 'Schedule updated successfully.');
        }

        return back()->with('success', 'Schedule updated successfully.');
    }
}