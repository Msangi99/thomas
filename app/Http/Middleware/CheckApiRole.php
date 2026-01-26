<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class CheckApiRole
{
    /**
     * Handle an incoming request for API routes.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     * @param  string ...$roles
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function handle(Request $request, Closure $next, ...$roles): Response
    {
        $user = Auth::user();

        // Check if user has a role
        if (empty($user->role)) {
            return response()->json([
                'success' => false,
                'message' => 'No role assigned to your account.',
            ], 403);
        }

        // Normalize roles for case-insensitive comparison
        $userRole = strtolower($user->role);
        $allowedRoles = array_map('strtolower', $roles);

        // Check if user's role is in the allowed roles
        if (!in_array($userRole, $allowedRoles)) {
            return response()->json([
                'success' => false,
                'message' => 'You do not have permission to access this resource.',
            ], 403);
        }

        return $next($request);
    }
}

