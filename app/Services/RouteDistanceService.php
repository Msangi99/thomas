<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class RouteDistanceService
{
    /**
     * Resolve route distance for booking checkout.
     * Recalculates when the value is missing or the inline placeholder (1 km).
     */
    public static function resolveForBooking($submitted, ?string $pickup, ?string $drop, ?float $routeDefault = null): float
    {
        $submitted = ($submitted !== null && $submitted !== '') ? (float) $submitted : 0.0;

        if ($submitted > 1) {
            return $submitted;
        }

        if ($pickup && $drop) {
            $computed = self::betweenPlaceNames($pickup, $drop);
            if ($computed !== null && $computed >= 1) {
                return $computed;
            }
        }

        if ($routeDefault !== null && $routeDefault >= 1) {
            return (float) $routeDefault;
        }

        return max($submitted, 1);
    }

    public static function betweenPlaceNames(string $from, string $to): ?float
    {
        $fromCoords = self::geocode($from);
        if (!$fromCoords) {
            return null;
        }

        usleep(1100000);

        $toCoords = self::geocode($to);
        if (!$toCoords) {
            return null;
        }

        return self::routeDistanceKm(
            $fromCoords['lat'],
            $fromCoords['lon'],
            $toCoords['lat'],
            $toCoords['lon']
        );
    }

    private static function geocode(string $place): ?array
    {
        $query = trim($place);
        if ($query === '') {
            return null;
        }

        if (preg_match('/^-?\d+\.\d+\s*,\s*-?\d+\.\d+$/', $query)) {
            $parts = array_map('trim', explode(',', $query));

            return ['lat' => (float) $parts[0], 'lon' => (float) $parts[1]];
        }

        $searchQuery = str_contains(strtolower($query), 'tanzania')
            ? $query
            : $query . ', Tanzania';

        try {
            $response = Http::withHeaders([
                'Accept' => 'application/json',
                'User-Agent' => 'HighlinkBooking/1.0',
            ])->timeout(12)->get('https://nominatim.openstreetmap.org/search', [
                'format' => 'json',
                'q' => $searchQuery,
                'limit' => 1,
            ]);

            if (!$response->successful()) {
                return null;
            }

            $data = $response->json();
            if (empty($data[0]['lat']) || empty($data[0]['lon'])) {
                return null;
            }

            return [
                'lat' => (float) $data[0]['lat'],
                'lon' => (float) $data[0]['lon'],
            ];
        } catch (\Throwable $e) {
            Log::warning('RouteDistanceService geocode failed', [
                'place' => $place,
                'error' => $e->getMessage(),
            ]);

            return null;
        }
    }

    public static function routeDistanceKm(float $lat1, float $lon1, float $lat2, float $lon2): float
    {
        try {
            $url = sprintf(
                'https://router.project-osrm.org/route/v1/driving/%f,%f;%f,%f?overview=false',
                $lon1,
                $lat1,
                $lon2,
                $lat2
            );

            $response = Http::timeout(12)->get($url);
            if ($response->successful()) {
                $data = $response->json();
                if (($data['code'] ?? '') === 'Ok' && !empty($data['routes'][0]['distance'])) {
                    return round($data['routes'][0]['distance'] / 1000, 2);
                }
            }
        } catch (\Throwable $e) {
            Log::warning('RouteDistanceService OSRM failed', ['error' => $e->getMessage()]);
        }

        return self::haversineKm($lat1, $lon1, $lat2, $lon2);
    }

    public static function haversineKm(float $lat1, float $lon1, float $lat2, float $lon2): float
    {
        $earthRadius = 6371;
        $dLat = deg2rad($lat2 - $lat1);
        $dLon = deg2rad($lon2 - $lon1);
        $a = sin($dLat / 2) * sin($dLat / 2)
            + cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * sin($dLon / 2) * sin($dLon / 2);
        $c = 2 * atan2(sqrt($a), sqrt(1 - $a));

        return round($earthRadius * $c, 2);
    }
}
