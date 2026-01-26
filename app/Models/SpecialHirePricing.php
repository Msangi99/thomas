<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class SpecialHirePricing extends Model
{
    use HasFactory;

    protected $table = 'special_hire_pricing';

    protected $fillable = [
        'coaster_id',
        'base_price',
        'price_per_km',
        'min_km',
        'weekend_surcharge_percent',
        'night_surcharge_percent',
    ];

    protected $casts = [
        'base_price' => 'decimal:2',
        'price_per_km' => 'decimal:2',
        'weekend_surcharge_percent' => 'decimal:2',
        'night_surcharge_percent' => 'decimal:2',
    ];

    /**
     * Get the coaster that owns this pricing.
     */
    public function coaster()
    {
        return $this->belongsTo(Coaster::class);
    }

    /**
     * Calculate price based on distance and schedule.
     * Price is calculated as: (distance × price_per_km) + surcharges
     * No base price is included - amount comes from customer app calculation.
     */
    public function calculatePrice($distanceKm, $hireDate, $hireTime)
    {
        // Ensure minimum KM
        $billableKm = max($distanceKm, $this->min_km);

        // Calculate amount based only on distance × price per km
        $kmAmount = $billableKm * $this->price_per_km;

        // Check for surcharges
        $surchargePercent = 0;
        $surchargeLabels = [];

        // Weekend surcharge (Saturday & Sunday)
        $day = Carbon::parse($hireDate)->dayOfWeek;
        if ($day == Carbon::SATURDAY || $day == Carbon::SUNDAY) {
            $surchargePercent += $this->weekend_surcharge_percent;
            $surchargeLabels[] = 'Weekend';
        }

        // Night surcharge (6PM - 6AM)
        $hour = Carbon::parse($hireTime)->hour;
        if ($hour >= 18 || $hour < 6) {
            $surchargePercent += $this->night_surcharge_percent;
            $surchargeLabels[] = 'Night';
        }

        // Calculate totals - surcharge is applied to km_amount only (no base price)
        $surchargeAmount = ($kmAmount * $surchargePercent) / 100;
        $totalAmount = $kmAmount + $surchargeAmount;

        return [
            'distance_km' => $distanceKm,
            'billable_km' => $billableKm,
            'breakdown' => [
                'base_price' => 0, // No base price - kept for backward compatibility
                'price_per_km' => round($this->price_per_km, 2),
                'km_amount' => round($kmAmount, 2),
                'surcharge_percent' => round($surchargePercent, 2),
                'surcharge_labels' => $surchargeLabels,
                'surcharge_amount' => round($surchargeAmount, 2),
            ],
            // Keep flat keys for backward compatibility with existing consumers
            'base_price' => 0, // No base price - kept for backward compatibility
            'price_per_km' => round($this->price_per_km, 2),
            'km_amount' => round($kmAmount, 2),
            'surcharge_percent' => round($surchargePercent, 2),
            'surcharge_labels' => $surchargeLabels,
            'surcharge_amount' => round($surchargeAmount, 2),
            'total_amount' => round($totalAmount, 2),
        ];
    }

    /**
     * Calculate distance between two GPS coordinates using Haversine formula.
     */
    public static function calculateDistance($lat1, $lon1, $lat2, $lon2)
    {
        $earthRadius = 6371; // km

        $dLat = deg2rad($lat2 - $lat1);
        $dLon = deg2rad($lon2 - $lon1);

        $a = sin($dLat / 2) * sin($dLat / 2) +
            cos(deg2rad($lat1)) * cos(deg2rad($lat2)) *
            sin($dLon / 2) * sin($dLon / 2);

        $c = 2 * atan2(sqrt($a), sqrt(1 - $a));

        return round($earthRadius * $c, 2); // Distance in KM
    }
}

