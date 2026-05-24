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

    public function test_traveller_service_fee_uses_levy_exclusive_base(): void
    {
        $service = new FareFormulaService();
        $setting = new Setting();
        $setting->service_percentage = 2;
        $setting->service = 100;

        // Sheet B38: type fare 1000 levy-inclusive → 950 levy-exclusive; 2% + 100 = 119
        $fee = $service->calculateTravellerServiceFee(1000.0, $setting);
        $this->assertEquals(119.0, $fee);
    }

    public function test_traveller_service_fee_matches_sheet_example_two_thousand_total(): void
    {
        $service = new FareFormulaService();
        $setting = new Setting();
        $setting->service_percentage = 2;
        $setting->service = 100;

        // Sheet B13=2000 levy-inclusive → B14=1900; B38 = (1900*2%)+100 = 138
        $fee = $service->calculateTravellerServiceFee(2000.0, $setting);
        $this->assertEquals(138.0, $fee);
    }

    public function test_admin_service_fees_match_sheet_b16_with_two_seats(): void
    {
        $service = new FareFormulaService();
        $setting = new Setting();
        $setting->service_percentage = 2;
        $setting->service = 100;

        // Sheet B13=2000, B7=2 seats → B16 = (2000*2%)*2+100 = 180
        $result = $service->calculateSettlement(2000, 2000, 0, 0, $setting, null, null, 2);

        $this->assertEquals(180.0, $result['service_fees']);
        $this->assertEquals(9.0, $result['government_levy_on_service_fee']);
        $this->assertEquals(200.0, $result['system_commission_total']);
    }
}
