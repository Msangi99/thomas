<?php

namespace App\Services;

use App\Models\Setting;

class FareFormulaService
{
    private const DEFAULT_COMMISSION_PERCENT = 3.0;
    private const DEFAULT_COMMISSION_ADDING = 200.0;
    private const DEFAULT_SERVICE_PERCENT = 2.0;
    private const DEFAULT_SERVICE_ADDING = 100.0;
    private const DEFAULT_VENDOR_PERCENT = 10.0;
    private const DEFAULT_GOVERNMENT_LEVY_PERCENT = 5.0;
    private const SAFIRI_DOMESTIC_PER_DAY = 100.0;
    private const SAFIRI_FOREIGN_PER_DAY = 200.0;

    public function resolveRates(?Setting $setting, $company = null, ?float $vendorPercentage = null): array
    {
        $servicePercent = $this->fallbackPositive($setting?->service_percentage, self::DEFAULT_SERVICE_PERCENT);
        $serviceAdding = $this->fallbackPositive($setting?->service, self::DEFAULT_SERVICE_ADDING);

        $commissionPercent = self::DEFAULT_COMMISSION_PERCENT;
        if ($company && (float) ($company->percentage ?? 0) > 0) {
            $commissionPercent = min(100, (float) $company->percentage);
        }

        $vendorPercent = $this->fallbackPositive($vendorPercentage, self::DEFAULT_VENDOR_PERCENT);
        $vendorPercent = min(100, $vendorPercent);

        return [
            'commission_percent' => $commissionPercent,
            'commission_adding' => self::DEFAULT_COMMISSION_ADDING,
            'service_percent' => $servicePercent,
            'service_adding' => $serviceAdding,
            'vendor_percent' => $vendorPercent,
            'government_levy_percent' => self::DEFAULT_GOVERNMENT_LEVY_PERCENT,
        ];
    }

    public function calculateTravellerServiceFee(float $typeFare, ?Setting $setting): float
    {
        $rates = $this->resolveRates($setting);
        return (($typeFare * 100 / 118) * ($rates['service_percent'] / 100)) + $rates['service_adding'];
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
        $systemCommissionTotal = ($levyExclusiveFare * ($rates['commission_percent'] / 100)) + $rates['commission_adding'];
        if ($company && (float) ($company->commission_amount ?? 0) > 0) {
            $systemCommissionTotal = (float) $company->commission_amount;
        }

        $serviceFees = ($levyExclusiveFare * ($rates['service_percent'] / 100)) + $rates['service_adding'];
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
}

