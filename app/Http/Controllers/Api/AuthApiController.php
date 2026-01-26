<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthApiController extends Controller
{
    /**
     * Login user and create token.
     */
    public function login(Request $request)
    {
        // Handle GET request - return API info
        if ($request->isMethod('get')) {
            return response()->json([
                'success' => true,
                'message' => 'Login API endpoint',
                'method' => 'POST',
                'required_fields' => [
                    'email' => 'string|required|email',
                    'password' => 'string|required|min:8',
                ],
                'example' => [
                    'email' => 'user@example.com',
                    'password' => 'your_password',
                ],
            ]);
        }

        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string|min:8',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'No account found with this email address.',
            ], 401);
        }

        // Check if account is locked
        if ($user->locked_until && $user->locked_until > now()) {
            $minutes = ceil($user->locked_until->diffInMinutes(now()));
            return response()->json([
                'success' => false,
                'message' => "Account temporarily locked. Try again in {$minutes} minutes.",
            ], 423);
        }

        // Check if account is active
        if (!$user->isActive()) {
            return response()->json([
                'success' => false,
                'message' => 'Account is inactive. Please contact support.',
            ], 403);
        }

        // Verify password
        if (!Hash::check($request->password, $user->password)) {
            // Increment failed attempts
            $user->increment('failed_attempts');

            if ($user->failed_attempts >= 5) {
                $user->locked_until = now()->addMinutes(5);
                $user->save();
                return response()->json([
                    'success' => false,
                    'message' => 'Too many failed attempts. Account locked for 5 minutes.',
                ], 423);
            }

            $remainingAttempts = 5 - $user->failed_attempts;
            return response()->json([
                'success' => false,
                'message' => "Invalid password. {$remainingAttempts} attempts remaining.",
            ], 401);
        }

        // Reset failed attempts on successful login
        $user->failed_attempts = 0;
        $user->locked_until = null;
        $user->save();

        // Create token
        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'success' => true,
            'message' => 'Login successful',
            'data' => [
                'user' => [
                    'id' => $user->id,
                    'name' => $user->name,
                    'email' => $user->email,
                    'role' => $user->role,
                    'contact' => $user->contact,
                ],
                'token' => $token,
                'token_type' => 'Bearer',
            ],
        ]);
    }

    /**
     * Register new user.
     */
    public function register(Request $request)
    {
        // Handle GET request - return API info
        if ($request->isMethod('get')) {
            return response()->json([
                'success' => true,
                'message' => 'Register API endpoint',
                'method' => 'POST',
                'required_fields' => [
                    'name' => 'string|required|max:255',
                    'email' => 'string|required|email|unique',
                    'password' => 'string|required|min:8',
                    'password_confirmation' => 'string|required|same:password',
                    'role' => 'string|required|in:bus_campany,vender,customer,special_hire',
                    'contact' => 'string|optional|max:20',
                ],
                'available_roles' => ['bus_campany', 'vender', 'customer', 'special_hire'],
                'example' => [
                    'name' => 'John Doe',
                    'email' => 'john@example.com',
                    'password' => 'password123',
                    'password_confirmation' => 'password123',
                    'role' => 'special_hire',
                    'contact' => '+255712345678',
                ],
            ]);
        }

        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8|confirmed',
            'role' => 'required|in:bus_campany,vender,customer,special_hire',
            'contact' => 'nullable|string|max:20',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validation error',
                'errors' => $validator->errors(),
            ], 422);
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role' => $request->role,
            'contact' => $request->contact,
            'status' => 'accept',
        ]);

        // Create token
        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'success' => true,
            'message' => 'Registration successful',
            'data' => [
                'user' => [
                    'id' => $user->id,
                    'name' => $user->name,
                    'email' => $user->email,
                    'role' => $user->role,
                    'contact' => $user->contact,
                ],
                'token' => $token,
                'token_type' => 'Bearer',
            ],
        ], 201);
    }

    /**
     * Get authenticated user.
     */
    public function user(Request $request)
    {
        $user = $request->user();

        return response()->json([
            'success' => true,
            'data' => [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'role' => $user->role,
                'contact' => $user->contact,
                'created_at' => $user->created_at,
            ],
        ]);
    }

    /**
     * Logout user (revoke token).
     */
    public function logout(Request $request)
    {
        // Revoke current token
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'success' => true,
            'message' => 'Logged out successfully',
        ]);
    }

    /**
     * Logout from all devices (revoke all tokens).
     */
    public function logoutAll(Request $request)
    {
        // Revoke all tokens
        $request->user()->tokens()->delete();

        return response()->json([
            'success' => true,
            'message' => 'Logged out from all devices successfully',
        ]);
    }

    /**
     * Refresh token.
     */
    public function refresh(Request $request)
    {
        $user = $request->user();

        // Revoke current token
        $request->user()->currentAccessToken()->delete();

        // Create new token
        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'success' => true,
            'message' => 'Token refreshed successfully',
            'data' => [
                'token' => $token,
                'token_type' => 'Bearer',
            ],
        ]);
    }
}

