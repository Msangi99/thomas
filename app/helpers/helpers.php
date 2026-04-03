<?php

if (!function_exists('convert_to_usd')) {
    function convert_money($tzs)
    {
        $currency = session('currency');
        $usd = app('usdToTzs') ?? 2500;

        if($currency == 'Usd'){
             return  number_format($tzs / $usd, 2);
        }else{
            return number_format($tzs, 2);
        }
    } 

    function convert_to_tzs($money)
    {
        $usd = app('usdToTzs') ?? 2500;

        return  number_format($money * $usd, 2);
    }
}

if (!function_exists('normalize_tanzania_phone_to_canonical')) {
    /**
     * Strip formatting and return Tanzania mobile as 255 + 9 digits, or null if not a recognizable TZ mobile.
     * Treats 225… (typo for 255), 0…, 6/7…, +255…, and 255… as equivalent.
     */
    function normalize_tanzania_phone_to_canonical(?string $input): ?string
    {
        if ($input === null || $input === '') {
            return null;
        }
        $digits = preg_replace('/\D/', '', $input);
        if ($digits === '') {
            return null;
        }
        while (str_starts_with($digits, '00') && strlen($digits) > 2) {
            $digits = substr($digits, 2);
        }

        if (strlen($digits) === 12 && str_starts_with($digits, '225')) {
            $rest = substr($digits, 3);
            if (str_starts_with($rest, '6') || str_starts_with($rest, '7')) {
                $digits = '255' . $rest;
            }
        }

        if (strlen($digits) === 12 && str_starts_with($digits, '255')) {
            return $digits;
        }

        if (strlen($digits) === 10 && str_starts_with($digits, '0')) {
            return '255' . substr($digits, 1);
        }

        if (strlen($digits) === 9 && (str_starts_with($digits, '6') || str_starts_with($digits, '7'))) {
            return '255' . $digits;
        }

        return null;
    }
}

if (!function_exists('tanzania_phone_booking_lookup_variants')) {
    /**
     * Possible customer_phone values in DB for the same canonical 255XXXXXXXXX number.
     */
    function tanzania_phone_booking_lookup_variants(string $canonical): array
    {
        if (strlen($canonical) !== 12 || !str_starts_with($canonical, '255')) {
            return array_values(array_unique(array_filter([$canonical])));
        }
        $subscriber = substr($canonical, 3);

        return array_values(array_unique(array_filter([
            $canonical,
            '+' . $canonical,
            '0' . $subscriber,
            $subscriber,
        ])));
    }
}

if (!function_exists('normalize_tanzania_phone_for_booking')) {
    /**
     * Normalize contact / payment phone for booking flow: digits only, 255XXXXXXXXX when possible.
     * Uses strict TZ rules first (+255, 225 typo, 0…, 6/7…), then legacy prepend-255 fallback.
     */
    function normalize_tanzania_phone_for_booking(?string $input): string
    {
        if ($input === null) {
            return '';
        }
        $trimmed = trim($input);
        if ($trimmed === '') {
            return '';
        }
        $canonical = normalize_tanzania_phone_to_canonical($trimmed);
        if ($canonical !== null) {
            return $canonical;
        }
        $digits = preg_replace('/\D/', '', $trimmed);
        while (str_starts_with($digits, '00') && strlen($digits) > 2) {
            $digits = substr($digits, 2);
        }
        if ($digits === '') {
            return '';
        }
        if (str_starts_with($digits, '0')) {
            return '255' . substr($digits, 1);
        }
        if (substr($digits, 0, 3) !== '255') {
            return '255' . $digits;
        }

        return $digits;
    }
}