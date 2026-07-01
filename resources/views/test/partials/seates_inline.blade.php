<div class="inline-booking-panel" data-inline-panel="seats">
    @include('test.partials.booking_steps', ['currentStep' => 2])

    <div class="inline-booking-panel__error booking-alert booking-alert--error hidden" role="alert"></div>

    <form method="POST"
        action="{{ route('get_seats') }}"
        class="inline-booking-form"
        data-inline-form="seats"
        data-inline-uid="{{ $inlineUid }}">
        @csrf
        <input type="hidden" name="inline" value="1">
        <input type="hidden" name="selected_seats" id="hiddenSelectedSeats_{{ $inlineUid }}" value="">
        <input type="hidden" name="total_amount" id="hiddenTotalAmount_{{ $inlineUid }}" value="0">

        <div id="seatMapGrid_{{ $inlineUid }}" class="seat-map-grid"></div>
        <div id="seatMapFallback_{{ $inlineUid }}" class="seat-map" style="display:none;"></div>

        <div class="booking-seat-footer">
            <div class="flex flex-col sm:flex-row justify-between items-center gap-4">
                <div>
                    <p class="text-sm font-medium text-gray-500">{{ __('customer/busroot.selected_seats') }}</p>
                    <p class="text-lg font-bold text-gray-900" id="selectedSeatsList_{{ $inlineUid }}">{{ __('customer/busroot.none') }}</p>
                </div>
                <div class="text-center sm:text-right">
                    <p class="text-sm font-medium text-gray-500">{{ __('customer/busroot.total_amount') }}</p>
                    <p class="booking-seat-footer__total">
                        <span id="totalAmount_{{ $inlineUid }}">0</span> {{ $currency }}
                    </p>
                </div>
            </div>

            <div class="flex flex-wrap justify-center gap-4 mt-4 text-sm text-gray-600">
                <div class="flex items-center"><span class="legend-swatch seat-available-legend"></span> {{ __('customer/busroot.available') }}</div>
                <div class="flex items-center"><span class="legend-swatch seat-selected-legend"></span> {{ __('customer/busroot.selected') }}</div>
                <div class="flex items-center"><span class="legend-swatch seat-booked-legend"></span> {{ __('customer/busroot.booked') }}</div>
            </div>

            <button type="submit" id="confirmSeatsBtn_{{ $inlineUid }}" disabled class="page-btn w-full mt-6 disabled:opacity-50 disabled:cursor-not-allowed">
                <i class="fas fa-check-circle"></i> {{ __('customer/busroot.confirm_seats') }}
            </button>
        </div>
    </form>

    <script type="application/json" class="inline-seat-config">
        {!! json_encode([
            'inlineUid' => $inlineUid,
            'seatPrice' => $price,
            'bookedSeats' => $booked_seats ?? [],
            'totalSeats' => $car->total_seats,
            'layoutRaw' => $car->seate_json ?? null,
            'maxSeats' => 5,
            'currency' => $currency,
            'usdToTzs' => $usdToTzs ?? 2500,
            'noneLabel' => __('customer/busroot.none'),
            'maxSeatsMsg' => __('customer/busroot.max_seats_limit'),
            'useUsd' => session('currency') == 'Usd',
        ]) !!}
    </script>
</div>
