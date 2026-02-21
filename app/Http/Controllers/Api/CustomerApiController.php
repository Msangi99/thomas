<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Coaster;
use App\Models\SpecialHireOrder;
use App\Models\SpecialHirePricing;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Validator;

class CustomerApiController extends Controller
{
    /**
     * Customer registration.
     */
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'phone' => 'required|string|max:20',
            'password' => 'required|string|min:6|confirmed',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'password' => Hash::make($request->password),
            'role' => 'customer',
        ]);

        $token = $user->createToken('customer-token')->plainTextToken;

        return response()->json([
            'success' => true,
            'message' => 'Registration successful',
            'data' => [
                'user' => [
                    'id' => $user->id,
                    'name' => $user->name,
                    'email' => $user->email,
                    'phone' => $user->phone,
                    'role' => $user->role,
                ],
                'token' => $token,
            ],
        ], 201);
    }

    /**
     * Customer login.
     */
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        if (!Auth::attempt($request->only('email', 'password'))) {
            return response()->json([
                'success' => false,
                'message' => 'Invalid credentials',
            ], 401);
        }

        $user = Auth::user();

        // Check if user is a customer
        if ($user->role !== 'customer') {
            Auth::logout();
            return response()->json([
                'success' => false,
                'message' => 'Unauthorized. Customer access only.',
            ], 403);
        }

        $token = $user->createToken('customer-token')->plainTextToken;

        return response()->json([
            'success' => true,
            'message' => 'Login successful',
            'data' => [
                'user' => [
                    'id' => $user->id,
                    'name' => $user->name,
                    'email' => $user->email,
                    'phone' => $user->phone,
                    'role' => $user->role,
                ],
                'token' => $token,
            ],
        ]);
    }

    /**
     * Get customer profile.
     */
    public function profile()
    {
        $user = Auth::user();

        return response()->json([
            'success' => true,
            'data' => [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'phone' => $user->phone,
                'role' => $user->role,
            ],
        ]);
    }

    /**
     * Update customer profile.
     */
    public function updateProfile(Request $request)
    {
        $user = Auth::user();

        $validator = Validator::make($request->all(), [
            'name' => 'nullable|string|max:255',
            'phone' => 'nullable|string|max:20',
            'password' => 'nullable|string|min:6|confirmed',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = [];
        if ($request->has('name')) {
            $data['name'] = $request->name;
        }
        if ($request->has('phone')) {
            // Write to whichever column exists (phone or contact)
            if (Schema::hasColumn('users', 'phone')) {
                $data['phone'] = $request->phone;
            }
            if (Schema::hasColumn('users', 'contact')) {
                $data['contact'] = $request->phone;
            }
        }
        if ($request->has('password')) {
            $data['password'] = Hash::make($request->password);
        }

        $user->update($data);

        return response()->json([
            'success' => true,
            'message' => 'Profile updated successfully',
            'data' => [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'phone' => $user->phone,
            ],
        ]);
    }

    /**
     * Get all coasters with availability status (for map view).
     */
    public function getCoasters(Request $request)
    {
        $query = Coaster::with(['pricing', 'driver'])
            ->whereNotNull('latitude')
            ->whereNotNull('longitude');

        // If date and time provided, check availability
        if ($request->has('date') && $request->has('time')) {
            $date = $request->date;
            $time = $request->time;

            $query->with(['orders' => function ($q) use ($date, $time) {
                $q->where('hire_date', $date)
                    ->where('hire_time', '<=', $time)
                    ->whereIn('order_status', ['confirmed', 'in_progress']);
            }]);
        }

        $coasters = $query->get()->map(function ($coaster) use ($request) {
            $isAvailable = true;
            $availabilityStatus = 'available'; // green

            // Check if coaster has active orders at requested time
            if ($request->has('date') && $request->has('time')) {
                if ($coaster->orders->count() > 0) {
                    $isAvailable = false;
                    $availabilityStatus = 'busy'; // red
                }
            } else {
                // Check current status
                if ($coaster->status === 'on_hire' || $coaster->status === 'maintenance') {
                    $isAvailable = false;
                    $availabilityStatus = 'busy'; // red
                }
            }

            $data = [
                'id' => $coaster->id,
                'name' => $coaster->name,
                'plate_number' => $coaster->plate_number,
                'capacity' => $coaster->capacity,
                'model' => $coaster->model,
                'color' => $coaster->color,
                'features' => $coaster->features,
                'image_url' => $coaster->image_url,
                'latitude' => $coaster->latitude,
                'longitude' => $coaster->longitude,
                'is_available' => $isAvailable,
                'availability_status' => $availabilityStatus,
                'status' => $coaster->status,
                'pricing' => $coaster->pricing,
            ];

            // Add driver information if available
            if ($coaster->driver) {
                $data['driver'] = [
                    'id' => $coaster->driver->id,
                    'name' => $coaster->driver->name,
                    'phone' => $coaster->driver->phone ?? $coaster->driver_contact,
                    'email' => $coaster->driver->email,
                ];
            } else if ($coaster->driver_name) {
                // Fallback to legacy driver fields if no driver account
                $data['driver'] = [
                    'name' => $coaster->driver_name,
                    'phone' => $coaster->driver_contact,
                ];
            }

            return $data;
        });

        return response()->json([
            'success' => true,
            'data' => $coasters,
        ]);
    }

    /**
     * Get single coaster details.
     */
    public function getCoaster($id)
    {
        $coaster = Coaster::with(['pricing', 'driver'])->find($id);

        if (!$coaster) {
            return response()->json([
                'success' => false,
                'message' => 'Coaster not found',
            ], 404);
        }

        $data = [
            'id' => $coaster->id,
            'name' => $coaster->name,
            'plate_number' => $coaster->plate_number,
            'capacity' => $coaster->capacity,
            'model' => $coaster->model,
            'color' => $coaster->color,
            'features' => $coaster->features,
            'image_url' => $coaster->image_url,
            'status' => $coaster->status,
            'pricing' => $coaster->pricing,
        ];

        // Add driver information if available
        if ($coaster->driver) {
            $data['driver'] = [
                'id' => $coaster->driver->id,
                'name' => $coaster->driver->name,
                'phone' => $coaster->driver->phone ?? $coaster->driver_contact,
                'email' => $coaster->driver->email,
            ];
        } else if ($coaster->driver_name) {
            // Fallback to legacy driver fields if no driver account
            $data['driver'] = [
                'name' => $coaster->driver_name,
                'phone' => $coaster->driver_contact,
            ];
        }

        return response()->json([
            'success' => true,
            'data' => $data,
        ]);
    }

    /**
     * Calculate price for a trip.
     */
    public function calculatePrice(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'coaster_id' => 'required|exists:coasters,id',
            'pickup_latitude' => 'nullable|numeric',
            'pickup_longitude' => 'nullable|numeric',
            'dropoff_latitude' => 'nullable|numeric',
            'dropoff_longitude' => 'nullable|numeric',
            'distance_km' => 'nullable|numeric|min:0',
            'hire_date' => 'required|date',
            'hire_time' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        $coaster = Coaster::with('pricing')->find($request->coaster_id);

        if (!$coaster->pricing) {
            return response()->json([
                'success' => false,
                'message' => 'Pricing not set for this coaster',
            ], 400);
        }

        // Calculate distance
        $distanceKm = $request->distance_km;
        if ($request->pickup_latitude && $request->dropoff_latitude) {
            $distanceKm = SpecialHirePricing::calculateDistance(
                $request->pickup_latitude,
                $request->pickup_longitude,
                $request->dropoff_latitude,
                $request->dropoff_longitude
            );
        }

        if (!$distanceKm) {
            return response()->json([
                'success' => false,
                'message' => 'Distance is required. Provide either coordinates or distance_km.',
            ], 400);
        }

        // Calculate price
        $priceData = $coaster->pricing->calculatePrice(
            $distanceKm,
            $request->hire_date,
            $request->hire_time
        );

        return response()->json([
            'success' => true,
            'data' => $priceData,
        ]);
    }

    /**
     * Create booking request.
     */
    public function createBooking(Request $request)
    {
        $user = Auth::user();

        $validator = Validator::make($request->all(), [
            'coaster_id' => 'required|exists:coasters,id',
            'pickup_location' => 'required|string|max:255',
            'pickup_latitude' => 'nullable|numeric',
            'pickup_longitude' => 'nullable|numeric',
            'dropoff_location' => 'required|string|max:255',
            'dropoff_latitude' => 'nullable|numeric',
            'dropoff_longitude' => 'nullable|numeric',
            'hire_date' => 'required|date|after_or_equal:today',
            'hire_time' => 'required',
            'return_date' => 'nullable|date|after_or_equal:hire_date',
            'return_time' => 'nullable',
            'passengers_count' => 'required|integer|min:1',
            'purpose' => 'nullable|string|max:255',
            'notes' => 'nullable|string',
            'phone' => 'nullable|string|max:20',
            'contact' => 'nullable|string|max:20',
            'total_amount' => 'required|numeric|min:0',
            'distance_km' => 'required|numeric|min:0',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        // Ensure we have a customer phone (DB column is non-nullable)
        $customerPhone = $request->phone
            ?: $request->contact
            ?: ($user->phone ?? null)
            ?: ($user->contact ?? null);
        if (!$customerPhone) {
            return response()->json([
                'success' => false,
                'message' => 'Phone number is required. Update your profile or include phone in the booking request.',
            ], 422);
        }

        // Find coaster with pricing
        $coaster = Coaster::with('pricing')->find($request->coaster_id);

        if (!$coaster) {
            return response()->json([
                'success' => false,
                'message' => 'Coaster not found',
            ], 404);
        }

        if (!$coaster->pricing) {
            return response()->json([
                'success' => false,
                'message' => 'Pricing not set for this coaster',
            ], 400);
        }

        // Use the amount and distance provided by the customer app
        // The customer app calculates: distance × price_per_km + surcharges
        $distanceKm = $request->distance_km;
        $totalAmount = $request->total_amount;
        
        // Calculate price breakdown for record-keeping
        $priceData = $coaster->pricing->calculatePrice(
            $distanceKm,
            $request->hire_date,
            $request->hire_time
        );

        // Create order
        $breakdown = $priceData['breakdown'] ?? $priceData;

        $order = SpecialHireOrder::create([
            'user_id' => $coaster->user_id, // Admin/Owner
            'customer_user_id' => $user->id, // Customer
            'coaster_id' => $coaster->id,
            'customer_name' => $user->name,
            'customer_phone' => $customerPhone,
            'customer_email' => $user->email,
            'pickup_location' => $request->pickup_location,
            'pickup_latitude' => $request->pickup_latitude,
            'pickup_longitude' => $request->pickup_longitude,
            'dropoff_location' => $request->dropoff_location,
            'dropoff_latitude' => $request->dropoff_latitude,
            'dropoff_longitude' => $request->dropoff_longitude,
            'hire_date' => $request->hire_date,
            'hire_time' => $request->hire_time,
            'return_date' => $request->return_date,
            'return_time' => $request->return_time,
            'passengers_count' => $request->passengers_count,
            'purpose' => $request->purpose,
            'notes' => $request->notes,
            'distance_km' => $distanceKm,
            'base_price' => 0, // No base price
            'price_per_km' => $coaster->pricing->price_per_km,
            'km_amount' => $breakdown['km_amount'],
            'surcharge_percent' => $breakdown['surcharge_percent'],
            'surcharge_amount' => $breakdown['surcharge_amount'],
            'total_amount' => $totalAmount, // Use amount from customer app
            'order_status' => 'pending',
            'payment_status' => 'pending',
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Booking request created successfully',
            'data' => $order->load('coaster'),
        ], 201);
    }

    /**
     * Get customer's bookings.
     */
    public function getBookings(Request $request)
    {
        $user = Auth::user();

        $query = SpecialHireOrder::where('customer_user_id', $user->id)
            ->with('coaster');

        // Filter by status
        if ($request->has('status')) {
            $query->where('order_status', $request->status);
        }

        $orders = $query->orderBy('hire_date', 'desc')
            ->orderBy('hire_time', 'desc')
            ->paginate($request->get('per_page', 15));

        return response()->json([
            'success' => true,
            'data' => $orders,
        ]);
    }

    /**
     * Get single booking details.
     */
    public function getBooking($id)
    {
        $user = Auth::user();

        $order = SpecialHireOrder::where('customer_user_id', $user->id)
            ->with('coaster')
            ->find($id);

        if (!$order) {
            return response()->json([
                'success' => false,
                'message' => 'Booking not found',
            ], 404);
        }

        return response()->json([
            'success' => true,
            'data' => $order,
        ]);
    }

    /**
     * Cancel booking.
     */
    public function cancelBooking($id)
    {
        $user = Auth::user();

        $order = SpecialHireOrder::where('customer_user_id', $user->id)->find($id);

        if (!$order) {
            return response()->json([
                'success' => false,
                'message' => 'Booking not found',
            ], 404);
        }

        if ($order->order_status === 'completed') {
            return response()->json([
                'success' => false,
                'message' => 'Cannot cancel completed booking',
            ], 400);
        }

        if ($order->order_status === 'cancelled') {
            return response()->json([
                'success' => false,
                'message' => 'Booking already cancelled',
            ], 400);
        }

        $order->update([
            'order_status' => 'cancelled',
        ]);

        // Update coaster status if it was in progress
        if ($order->coaster->status === 'on_hire') {
            $order->coaster->update(['status' => 'available']);
        }

        return response()->json([
            'success' => true,
            'message' => 'Booking cancelled successfully',
            'data' => $order->fresh('coaster'),
        ]);
    }

    /**
     * Track booking (get coaster location).
     */
    public function trackBooking($id)
    {
        $user = Auth::user();

        $order = SpecialHireOrder::where('customer_user_id', $user->id)
            ->with('coaster')
            ->find($id);

        if (!$order) {
            return response()->json([
                'success' => false,
                'message' => 'Booking not found',
            ], 404);
        }

        return response()->json([
            'success' => true,
            'data' => [
                'order_id' => $order->id,
                'order_code' => $order->order_code,
                'order_status' => $order->order_status,
                'coaster' => [
                    'id' => $order->coaster->id,
                    'name' => $order->coaster->name,
                    'plate_number' => $order->coaster->plate_number,
                    'latitude' => $order->coaster->latitude,
                    'longitude' => $order->coaster->longitude,
                    'last_location_update' => $order->coaster->last_location_update,
                ],
            ],
        ]);
    }

    /**
     * Logout customer.
     */
    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'success' => true,
            'message' => 'Logged out successfully',
        ]);
    }
}


