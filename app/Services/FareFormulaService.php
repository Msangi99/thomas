<?php

namespace App\Services;

use App\Models\Setting;

/**
 * Bus fare, service fee, and settlement math aligned with "New Formular Update (Thomas).xlsx" (Sheet1).
 *
 * - System commission: (bus fare levy-inclusive × system commission %) + system commission adding figure.
 *   The adding figure is {@see \App\Models\Campany::$commission_amount} (admin: company row "Amount" next to "%").
 * - Service fees (settlement / ADMIN): (bus fare levy-inclusive × service fee %) + service adding (settings).
 * - Traveller surcharge (end-user total): those service fees + government levy on that service fee (sheet "TICKET PURCHASED DIRECTLY BY END USER").
 * - Rates may be stored as decimals (0.05 = 5%) or whole percents (5 = 5%).
 */
class FareFormulaService
{
    private const DEFAULT_COMMISSION_PERCENT = 5.0;

    private const DEFAULT_SERVICE_PERCENT = 2.0;

    private const DEFAULT_SERVICE_ADDING = 100.0;

    private const DEFAULT_VENDOR_PERCENT = 10.0;

    private const DEFAULT_GOVERNMENT_LEVY_PERCENT = 5.0;

    private const SAFIRI_DOMESTIC_PER_DAY = 100.0;

    private const SAFIRI_FOREIGN_PER_DAY = 200.0;

    public function resolveRates(?Setting $setting, $company = null, ?float $vendorPercentage = null): array
    {
        $servicePercent = $this->fallbackPositive($setting?->service_percentage, self::DEFAULT_SERVICE_PERCENT);
        $servicePercent = $this->normalizePercentValue((float) $servicePercent);
        $serviceAdding = $this->fallbackPositive($setting?->service, self::DEFAULT_SERVICE_ADDING);

        $commissionPercent = self::DEFAULT_COMMISSION_PERCENT;
        if ($company && (float) ($company->percentage ?? 0) > 0) {
            $commissionPercent = min(100.0, $this->normalizePercentValue((float) $company->percentage));
        }

        // System commission adding figure: admin "Amount" on company row (not a full override of commission).
        $commissionAdding = $company ? (float) ($company->commission_amount ?? 0) : 0.0;

        $vendorPercent = $this->fallbackPositive($vendorPercentage, self::DEFAULT_VENDOR_PERCENT);
        $vendorPercent = min(100.0, $this->normalizePercentValue($vendorPercent));

        return [
            'commission_percent' => $commissionPercent,
            'commission_adding' => $commissionAdding,
            'service_percent' => $servicePercent,
            'service_adding' => $serviceAdding,
            'vendor_percent' => $vendorPercent,
            'government_levy_percent' => self::DEFAULT_GOVERNMENT_LEVY_PERCENT,
        ];
    }

    /**
     * Total traveller-paid surcharge on top of levy-inclusive type fare (matches Sheet1 direct end-user column).
     *
     * ADMIN service fees on levy-inclusive fare, plus government levy on that service fee amount.
     * Example (defaults): fare 1,000 → service fees 120 + levy on service fee 6 → returns 126 (total pay 1,126).
     */
    public function calculateTravellerServiceFee(float $typeFare, ?Setting $setting): float
    {
        $rates = $this->resolveRates($setting);
        $govPct = $rates['government_levy_percent'];

        $serviceFees = ($typeFare * ($rates['service_percent'] / 100)) + $rates['service_adding'];
        $governmentLevyOnServiceFee = $serviceFees * ($govPct / 100);

        return $serviceFees + $governmentLevyOnServiceFee;
    }

    public function calculateTravellerTotal(array $input, ?Setting $setting): array
    {
        $busFare = (float) ($input['bus_fare'] ?? 0);
        $domesticDays = max(0, (int) ($input['safiri_domestic_days'] ?? 0));
        $foreignDays = max(0, (int) ($input['safiri_foreign_days'] ?? 0));
        $mpesa = max(0, (float) ($input['mpesa_tariff'] ?? 0));
        $mixx = max(0, (float) ($input['mixx_tariff'] ?? 0));
        $airtel = max(0, (float) ($input['airtel_tariff'] ?? 0));

        $serviceFee = $this->calculateTravellerServiceFee($busFare, $setting);
        $domestic = self::SAFIRI_DOMESTIC_PER_DAY * $domesticDays;
        $foreign = self::SAFIRI_FOREIGN_PER_DAY * $foreignDays;

        return [
            'bus_fare' => $busFare,
            'service_fee' => $serviceFee,
            'safiri_domestic' => $domestic,
            'safiri_foreign' => $foreign,
            'mpesa_tariff' => $mpesa,
            'mixx_tariff' => $mixx,
            'airtel_tariff' => $airtel,
            'total_to_pay' => $busFare + $serviceFee + $domestic + $foreign + $mpesa + $mixx + $airtel,
        ];
    }

    public function calculateSettlement(
        float $totalFareLevyInclusive,
        float $busFareLevyInclusive,
        float $bimaAmount,
        float $cancelAmount,
        ?Setting $setting,
        $company = null,
        ?float $vendorPercentage = null
    ): array {
        $rates = $this->resolveRates($setting, $company, $vendorPercentage);
        $governmentLevyOnFare = $busFareLevyInclusive * ($rates['government_levy_percent'] / 100);
        $levyExclusiveFare = $busFareLevyInclusive - $governmentLevyOnFare;

        // Sheet ADMIN: system commission & service fees use levy-inclusive bus fare as % base.
        $systemCommissionTotal = ($busFareLevyInclusive * ($rates['commission_percent'] / 100))
            + $rates['commission_adding'];

        $serviceFees = ($busFareLevyInclusive * ($rates['service_percent'] / 100)) + $rates['service_adding'];
        $governmentLevyOnServiceFee = $serviceFees * ($rates['government_levy_percent'] / 100);
        $totalGovernmentLevies = $governmentLevyOnFare + $governmentLevyOnServiceFee;

        $commissionToVendor = $systemCommissionTotal * ($rates['vendor_percent'] / 100);
        $serviceFeesToVendor = $serviceFees * ($rates['vendor_percent'] / 100);
        $systemCommissionRemainder = $systemCommissionTotal - $commissionToVendor;

        $busOwnerShare = $busFareLevyInclusive - $systemCommissionTotal - $governmentLevyOnFare + $cancelAmount;
        $busFareRemainder = $busFareLevyInclusive - ($systemCommissionTotal + $governmentLevyOnFare);
        $amountOnBusOwnerFormula = $rates['commission_adding'];

        $rawServicePool = max(0, $totalFareLevyInclusive - $busFareLevyInclusive - $bimaAmount);
        $servicePoolAfterVendor = max(0, $rawServicePool - $serviceFeesToVendor);

        return [
            'rates' => $rates,
            'total_fare_levy_inclusive' => $totalFareLevyInclusive,
            'total_fare_levy_exclusive' => $levyExclusiveFare,
            'government_levy_on_fare' => $governmentLevyOnFare,
            'service_fees' => $serviceFees,
            'government_levy_on_service_fee' => $governmentLevyOnServiceFee,
            'total_government_levies' => $totalGovernmentLevies,
            'system_commission_total' => $systemCommissionTotal,
            'commission_to_vendor' => $commissionToVendor,
            'service_fees_to_vendor' => $serviceFeesToVendor,
            'system_commission_remainder' => $systemCommissionRemainder,
            'bus_fare_remainder' => $busFareRemainder,
            'amount_on_bus_owner_formula' => $amountOnBusOwnerFormula,
            'bus_owner_share' => $busOwnerShare,
            'service_pool_after_vendor' => $servicePoolAfterVendor,
            'highlink_share_user_ticket' => $systemCommissionTotal + $serviceFees,
            'highlink_share_vendor_ticket' => $systemCommissionRemainder + $servicePoolAfterVendor,
            'bima_amount' => $bimaAmount,
        ];
    }

    private function fallbackPositive($value, float $fallback): float
    {
        $number = (float) $value;
        return $number > 0 ? $number : $fallback;
    }

    /** Values in (0, 1] are treated as fractions (0.05 → 5%). */
    private function normalizePercentValue(float $value): float
    {
        if ($value <= 0) {
            return 0.0;
        }
        return $value > 0 && $value <= 1 ? $value * 100.0 : $value;
    }
}
