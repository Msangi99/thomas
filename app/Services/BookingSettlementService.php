<?php

namespace App\Services;

use App\Models\AdminWallet;
use App\Models\Bima;
use App\Models\Booking;
use App\Models\Bus;
use App\Models\GovernmentLevy;
use App\Models\PaymentFees;
use App\Models\Setting;
use App\Models\SystemBalance;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Schema;

class BookingSettlementService
{
    public function __construct(private readonly FareFormulaService $formulaService)
    {
    }

    public function settlePaidBooking(Booking $booking, array $meta = []): array
    {
        $adminWallet = AdminWallet::find(1);
        if (!$adminWallet) {
            $adminWallet = AdminWallet::query()->first();
        }
        if (!$adminWallet) {
            $adminWallet = AdminWallet::create([
                'service_balance' => 0,
                'commision_balance' => 0,
                'balance' => 0,
                'vat' => 0,
            ]);
        }

        $bus = Bus::with(['busname', 'route', 'campany.balance'])->find($booking->bus_id);
        if (!$bus || !$bus->campany || !$bus->campany->balance) {
            throw new \RuntimeException('Bus/company data not found for settlement');
        }

        $setting = Setting::first();
        $bimaAmount = (float) ($booking->bima_amount ?? 0);
        $totalFare = (float) $booking->amount;
        $busFare = (float) $booking->busFee;
        $cancelAmount = (float) ($meta['cancel_amount'] ?? (session('cancel') ?? 0));

        if (auth()->check() && auth()->user()->role === 'customer' && auth()->user()->temp_wallets) {
            $cancelAmount += (float) auth()->user()->temp_wallets->amount;
            auth()->user()->temp_wallets->amount = 0;
            auth()->user()->temp_wallets->save();
        }

        $vendorPct = null;
        if ($booking->vender_id > 0 && $booking->vender && $booking->vender->VenderAccount) {
            $vendorPct = (float) ($booking->vender->VenderAccount->percentage ?? 0);
        }

        $result = $this->formulaService->calculateSettlement(
            $totalFare,
            $busFare,
            $bimaAmount,
            $cancelAmount,
            $setting,
            $bus->campany,
            $vendorPct
        );

        $systemBalanceAmount = (float) $result['system_commission_total'];
        $paymentFeesAmount = (float) $result['service_pool_after_vendor'];
        $vendorFee = 0.0;
        $vendorService = 0.0;

        if ($booking->vender_id > 0 && $booking->vender && $booking->vender->VenderBalances) {
            $vendorFee = (float) $result['commission_to_vendor'];
            $vendorService = (float) $result['service_fees_to_vendor'];
            $booking->vender->VenderBalances->increment('amount', $vendorFee + $vendorService);
            $systemBalanceAmount = max(0, $systemBalanceAmount - $vendorFee);
        }

        if ($bimaAmount > 0) {
            Bima::create([
                'booking_id' => $booking->id,
                'start_date' => $booking->travel_date,
                'end_date' => $booking->insuranceDate,
                'amount' => $bimaAmount,
                'bima_vat' => $bimaAmount * (18 / 118),
            ]);
            $adminWallet->increment('balance', $bimaAmount);
        }

        $bookingUpdatePayload = array_merge([
            'payment_status' => 'Paid',
            'trans_status' => $meta['trans_status'] ?? 'success',
            'fee' => $systemBalanceAmount,
            'service' => $paymentFeesAmount,
            'vender_fee' => $vendorFee,
            'vender_service' => $vendorService,
            'government_levy' => $result['government_levy_on_fare'],
            'system_service_fee' => $result['service_fees'],
            'amount' => $result['bus_owner_share'],
            'payment_method' => $meta['payment_method'] ?? null,
        ], $this->transactionMeta($meta));
        $booking->update($this->filterExistingBookingColumns($bookingUpdatePayload, $booking->id));

        SystemBalance::create([
            'campany_id' => $bus->campany->id,
            'booking_id' => $booking->booking_code,
            'balance' => $systemBalanceAmount,
        ]);
        
        // Calculate government levy on service fees (5%)
        $governmentLevyOnServiceFee = $paymentFeesAmount * 0.05;
        $serviceFeeAfterLevy = $paymentFeesAmount - $governmentLevyOnServiceFee;
        
        PaymentFees::create([
            'campany_id' => $bus->campany->id,
            'amount' => $serviceFeeAfterLevy,
            'booking_id' => $booking->booking_code,
        ]);
        
        GovernmentLevy::create([
            'campany_id' => $bus->campany->id,
            'booking_id' => $booking->booking_code,
            'amount' => $governmentLevyOnServiceFee,
        ]);

        $adminWallet->increment('balance', $systemBalanceAmount + $serviceFeeAfterLevy);
        $bus->campany->balance->increment('amount', (float) $result['bus_owner_share']);

        return [
            'booking' => $booking->fresh(),
            'bus' => $bus,
            'bus_owner_amount' => (float) $result['bus_owner_share'],
            'system_balance_amount' => $systemBalanceAmount,
            'payment_fees_amount' => $paymentFeesAmount,
            'vendor_fee_share' => $vendorFee,
            'vendor_service_share' => $vendorService,
            'government_levy' => (float) $result['government_levy_on_fare'],
        ];
    }

    private function transactionMeta(array $meta): array
    {
        $allowed = ['mfs_id', 'verification_code', 'trans_token'];
        $output = [];
        foreach ($allowed as $key) {
            if (array_key_exists($key, $meta)) {
                $output[$key] = $meta[$key];
            }
        }
        return $output;
    }

    /**
     * Keep payment settlement resilient when some environments are behind on migrations.
     * Unknown columns are skipped and logged instead of breaking successful payments.
     */
    private function filterExistingBookingColumns(array $payload, int $bookingId): array
    {
        static $bookingColumns = null;

        if ($bookingColumns === null) {
            try {
                $bookingColumns = array_flip(Schema::getColumnListing('bookings'));
            } catch (\Throwable $e) {
                Log::warning('Could not read bookings schema; applying unfiltered payload', [
                    'booking_id' => $bookingId,
                    'error' => $e->getMessage(),
                ]);
                return $payload;
            }
        }

        $filtered = array_intersect_key($payload, $bookingColumns);
        $missingColumns = array_diff(array_keys($payload), array_keys($filtered));

        if (!empty($missingColumns)) {
            Log::warning('Skipping missing booking columns during settlement', [
                'booking_id' => $bookingId,
                'missing_columns' => array_values($missingColumns),
            ]);
        }

        return $filtered;
    }
}

