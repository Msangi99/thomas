<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CurrencyController extends Controller
{
    /**
     * Convert TZS to USD
     */
    public function ConvertToUsd($tzs)
    {
        $usd = app('usdToTzs') ?? 2500;
        return $tzs / $usd; // Divide to convert TZS to USD
    }

    /**
     * Convert currency (route handler)
     */
    public function convert(Request $request)
    {
        $currency = $request->input('currency', 'Tsh');
        
        if (in_array($currency, ['Tsh', 'Usd'])) {
            session(['currency' => $currency]);
        }
        
        return redirect()->back();
    }
}
