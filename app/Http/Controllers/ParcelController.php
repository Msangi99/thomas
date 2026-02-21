<?php

namespace App\Http\Controllers;

use App\Models\Parcel;
use App\Models\bus;
use Illuminate\Http\Request;
use Carbon\Carbon;

class ParcelController extends Controller
{
    public function index(Request $request)
    {
        $venderId = auth()->id();
        $parcels = Parcel::with('bus.campany')
            ->where('vender_id', $venderId)
            ->latest()
            ->paginate(10);

        return view('vender.parcels.index', compact('parcels'));
    }

    public function searchBus(Request $request)
    {
        $query = $request->get('query');
        
        $busQuery = bus::with(['campany', 'schedule', 'route'])
            ->whereHas('campany', function($q) {
                $q->where('status', 1);
            });

        if ($query) {
            $busQuery->where(function($q) use ($query) {
                $q->where('bus_number', 'LIKE', "%{$query}%")
                  ->orWhereHas('campany', function($cq) use ($query) {
                      $cq->where('name', 'LIKE', "%{$query}%");
                  });
            });
        }

        $buses = $busQuery->get();
            
        return view('vender.parcels.find_bus', compact('buses'));
    }

    public function create($bus_id)
    {
        $bus = bus::with('campany')->findOrFail($bus_id);
        return view('vender.parcels.create', compact('bus'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'bus_id' => 'required|exists:buses,id',
            'parcel_number' => 'required|string|unique:parcels,parcel_number',
            'parcel_type' => 'required|string',
            'description' => 'nullable|string',
            'amount_paid' => 'required|numeric|min:0',
            'weight' => 'nullable|numeric|min:0',
            'height' => 'nullable|numeric|min:0',
            'width' => 'nullable|numeric|min:0',
        ]);

        Parcel::create([
            'bus_id' => $request->bus_id,
            'parcel_number' => $request->parcel_number,
            'parcel_type' => $request->parcel_type,
            'description' => $request->description,
            'amount_paid' => $request->amount_paid,
            'weight' => $request->weight,
            'height' => $request->height,
            'width' => $request->width,
            'status' => 'pending',
            'vender_id' => auth()->id(),
        ]);

        return redirect()->route('vender.parcels.index')->with('success', 'Parcel added successfully and assigned to the bus.');
    }

    public function updateStatus(Request $request, $id)
    {
        $parcel = Parcel::findOrFail($id);
        
        // Ensure proper authorization - only bus owner company should initiate this for now based on requirement
        // Assuming this route is protected by bus-company middleware or similar check
        
        $request->validate([
            'status' => 'required|in:pending,completed,cancelled',
        ]);

        $parcel->update(['status' => $request->status]);

        return back()->with('success', 'Parcel status updated successfully.');
    }

    public function toggleAcceptance(Request $request)
    {
        $bus = Bus::findOrFail($request->bus_id);
        
        // Authorization check needed here ideally to ensure user owns the bus
        if ($bus->campany_id !== auth()->user()->campany->id) {
             return back()->with('error', 'Unauthorized action.');
        }

        $bus->accept_parcels = !$bus->accept_parcels;
        $bus->save();

        return back()->with('success', 'Parcel acceptance status updated.');
    }
}
