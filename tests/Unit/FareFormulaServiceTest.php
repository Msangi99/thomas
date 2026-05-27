<?php

namespace Tests\Unit;

use App\Models\Setting;
use App\Services\FareFormulaService;
use PHPUnit\Framework\TestCase;

class FareFormulaServiceTest extends TestCase
{
    public function test_it_uses_sheet_defaults_when_settings_missing(): void
    {
        $service = new FareFormulaService();
        $result = $service->calculateSettlement(
            12000,
            10000,
            0,
            0,
            null,
            null,
            null
        );

        $this->assertEquals(500.0, $result['government_levy_on_fare']);
        // 5% of levy-inclusive bus fare + commission adding (0 without company)
        $this->assertEquals(500.0, $result['system_commission_total']);
        // 2% of levy-inclusive + 100
        $this->assertEquals(300.0, $result['service_fees']);
        $this->assertEquals(9000.0, $result['bus_owner_share']);
    }

    public function test_it_applies_setting_and_vendor_rates(): void
    {
        $service = new FareFormulaService();
        $setting = new Setting();
        $setting->service_percentage = 4;
        $setting->service = 250;

        $result = $service->calculateSettlement(
            20000,
            15000,
            0,
            0,
            $setting,
            null,
            8
        );

        $this->assertEquals(750.0, $result['government_levy_on_fare']);
        $this->assertEquals(750.0, $result['system_commission_total']);
        $this->assertEquals(850.0, $result['service_fees']);
        $this->assertEquals(60.0, round($result['commission_to_vendor'], 2));
    }

    public function test_commission_amount_is_adding_not_override(): void
    {
        $service = new FareFormulaService();
        $setting = new Setting();
        $setting->service_percentage = 2;
        $setting->service = 100;

        $company = new \App\Models\Campany();
        $company->percentage = 5;
        $company->commission_amount = 50;

        $result = $service->calculateSettlement(
            1000,
            1000,
            0,
            0,
            $setting,
            $company,
            10
        );

        // 5% of 1000 + 50 adding = 100
        $this->assertEquals(100.0, $result['system_commission_total']);
    }

    public function test_traveller_service_fee_uses_displayed_seat_fare(): void
    {
        $service = new FareFormulaService();
        $setting = new Setting();
        $setting->service_percentage = 2;
        $setting->service = 100;

        // Seat price 1000: 2% + 100 = 120 → payable 1120 with fare
        $fee = $service->calculateTravellerServiceFee(1000.0, $setting);
        $this->assertEquals(120.0, $fee);
    }

    public function test_traveller_service_fee_scales_with_total_bus_fare(): void
    {
        $service = new FareFormulaService();
        $setting = new Setting();
        $setting->service_percentage = 2;
        $setting->service = 100;

        $fee = $service->calculateTravellerServiceFee(2000.0, $setting);
        $this->assertEquals(140.0, $fee);
    }

    public function test_settlement_service_fees_match_traveller_fee_for_multi_seat(): void
    {
        $service = new FareFormulaService();
        $setting = new Setting();
        $setting->service_percentage = 2;
        $setting->service = 100;

        // 2 seats × 1000 = 2000 total bus fare → (2000×2%)+100 = 140 at checkout and settlement
        $busFare = 2000.0;
        $travellerFee = $service->calculateTravellerServiceFee($busFare, $setting);
        $result = $service->calculateSettlement($busFare, $busFare, 0, 0, $setting, null, null, 2);

        $this->assertEquals(140.0, $travellerFee);
        $this->assertEquals($travellerFee, $result['service_fees']);
        $this->assertEquals(7.0, $result['government_levy_on_service_fee']);
        $this->assertEquals(100.0, $result['system_commission_total']);
    }
}
