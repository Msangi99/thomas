<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\View;

class Currency
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $currencyValue = session('currency'); // Assign the session value to a variable
        
        // Handle currency conversion - check for both 'Usd' and 'USD' for compatibility
        if(isset($currencyValue) && (strtolower($currencyValue) == 'usd' || $currencyValue == 'Usd'))
        {
            $currency = 'USD';
        }else{
            $currency = 'TSH'; // Default to TSH
        }

        View::share('currency', $currency);
        app()->instance('currency', $currency);

        return $next($request);
    }
}
