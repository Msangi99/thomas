<?php

namespace Tests\Unit;

use App\Models\Setting;
use App\Services\FareFormulaService;
use PHPUnit\Framework\TestCase;

class FareFormulaServiceTest extends TestCase
{
    public function test_it_uses_document_defaults_when_settings_missing(): void
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
        $this->assertEquals(485.0, $result['system_commission_total']);
        $this->assertEquals(290.0, $result['service_fees']);
        $this->assertEquals(9015.0, $result['bus_owner_share']);
    }

    public function test_it_applies_hybrid_setting_overrides(): void
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
        $this->assertEquals(627.5, $result['system_commission_total']);
        $this->assertEquals(820.0, $result['service_fees']);
        $this->assertEquals(50.2, round($result['commission_to_vendor'], 1));
    }
}

