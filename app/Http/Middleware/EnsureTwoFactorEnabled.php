<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class EnsureTwoFactorEnabled
{
    public function handle(Request $request, Closure $next)
    {
        $user = Auth::user();

        // If not logged in, redirect to login
        if (! $user) {
            return redirect()->route('login');
        }

        // Check if user requires 2FA (admin, vender, bus_owner)
        $requires2FA = in_array($user->role, ['admin', 'bus_campany', 'vender', 'local_bus_owner']);
        
        if ($requires2FA) {
            // If user does not have 2FA enabled
            if (is_null($user->two_factor_secret) || is_null($user->two_factor_recovery_codes)) {
                return redirect()->route('two-factor.setup')
                    ->with('error', 'Please enable Two-Factor Authentication before accessing this section.');
            }
            
            // If 2FA is enabled but not verified in this session, redirect to verification
            if (is_null($user->two_factor_confirmed_at)) {
                return redirect()->route('two-factor.login')
                    ->with('error', 'Please complete Two-Factor Authentication to continue.');
            }
        }

        return $next($request);
    }
}
