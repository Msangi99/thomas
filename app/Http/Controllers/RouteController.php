<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use App\Models\bus;
use App\Models\Campany;
use Carbon\Carbon;
use Illuminate\Http\Request;

class RouteController extends Controller
{
    public function bus_name(Request $request)
    {
        if (auth()->user()?->isCustomer() && ! request()->routeIs('customer.busname')) {
            return redirect()->route('customer.busname', $request->query());
        }

        $validated = $request->validate([
            'bus_id' => 'required|exists:campanies,id',
            'departure_date' => 'nullable|date',
        ]);

        $company = Campany::findOrFail($validated['bus_id']);
        $companyName = $company->name ?? 'Bus Company';
        $selectedDate = isset($validated['departure_date'])
            ? Carbon::parse($validated['departure_date'])->toDateString()
            : Carbon::today()->toDateString();

        $buses = bus::with([
            'busname' => function ($query) {
                $query->where('status', 1);
            },
            'route',
            'schedules' => function ($query) use ($selectedDate) {
                $query->whereDate('schedule_date', $selectedDate)
                    ->with('route')
                    ->orderBy('schedule_date')
                    ->orderBy('start');
            },
        ])
            ->where('campany_id', $validated['bus_id'])
            ->whereHas('busname', function ($query) {
                $query->where('status', 1);
            })
            ->whereHas('schedules', function ($query) use ($selectedDate) {
                $query->whereDate('schedule_date', $selectedDate);
            })
            ->get();

        $busList = collect();

        foreach ($buses as $bus) {
            foreach ($bus->schedules as $schedule) {
                $travelDate = Carbon::parse($schedule->schedule_date)->toDateString();
                $totalSeats = $bus->total_seats ?? $bus->busname->total_seats ?? 0;

                $bookedSeats = Booking::where('bus_id', $bus->id)
                    ->where('travel_date', $travelDate)
                    ->where('payment_status', 'Paid')
                    ->get()
                    ->flatMap(function ($booking) {
                        return array_filter(array_map('trim', explode(',', $booking->seat ?? '')));
                    })
                    ->unique()
                    ->count();

                $busList->push((object) [
                    'id' => $bus->id,
                    'bus_type' => $bus->bus_type,
                    'busname' => $bus->busname,
                    'schedule' => $schedule,
                    'route' => $schedule->route ?? $bus->route,
                    'remain_seats' => max(0, $totalSeats - $bookedSeats),
                ]);
            }
        }

        $busList = $busList
            ->sortBy(fn ($row) => ($row->schedule->schedule_date ?? '') . ' ' . ($row->schedule->start ?? ''))
            ->values();

        $departureCityName = $companyName;
        $arrivalCityName = '';
        $departure_date = $selectedDate;

        $view = match (booking_channel()) {
            'customer' => 'customer.bus_name',
            'vender' => 'vender.bus_name',
            default => 'bus_name',
        };

        return view($view, compact('busList', 'departureCityName', 'arrivalCityName', 'departure_date', 'companyName'));
    }
}
