<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class EnsureVendorEnabled
{
    /**
     * Block disabled vendors from using ticket, roundtrip, and parcel pages.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $user = $request->user();

        if (!$user) {
            return redirect()->route('login');
        }

        if ($user->isVender() && !$user->isActive()) {
            return redirect()->route('login')
                ->with('error', 'Your vendor account has been disabled. Please contact the administrator.');
        }

        return $next($request);
    }
}
