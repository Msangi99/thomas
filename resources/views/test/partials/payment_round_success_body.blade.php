<div class="payment-result-panel fade-in">
    <div class="payment-result-panel__body">
        <div class="payment-result-status payment-result-status--success">
            <div class="payment-result-status__icon" aria-hidden="true">
                <i class="fas fa-check"></i>
            </div>
            <h2 class="payment-result-status__title">{{ __('all.payment_successful') ?? 'Payment Successful' }}</h2>
            <p class="payment-result-status__subtitle">{{ __('vender/busroot.round_trip_booking_confirmed') ?? 'Your round trip booking has been confirmed.' }}</p>
        </div>

        <div class="payment-result-grid">
            @if (isset($booking1) && $booking1)
                <div class="payment-result-card payment-result-leg">
                    <p class="payment-result-leg__label">
                        <i class="fas fa-arrow-right" aria-hidden="true"></i>
                        {{ __('all.outbound') ?? 'Outbound' }}
                    </p>
                    <dl class="payment-result-rows">
                        <div class="payment-result-row">
                            <dt>{{ __('all.booking_code') ?? 'Booking Code' }}</dt>
                            <dd>{{ $booking1->booking_code }}</dd>
                        </div>
                        <div class="payment-result-row">
                            <dt>{{ __('all.route') ?? 'Route' }}</dt>
                            <dd>{{ $booking1->pickup_point }} → {{ $booking1->dropping_point }}</dd>
                        </div>
                        <div class="payment-result-row">
                            <dt>{{ __('all.travel_date') ?? 'Travel Date' }}</dt>
                            <dd>{{ $booking1->travel_date }}</dd>
                        </div>
                        <div class="payment-result-row">
                            <dt>{{ __('all.seats') ?? 'Seats' }}</dt>
                            <dd>{{ $booking1->seat }}</dd>
                        </div>
                        <div class="payment-result-row payment-result-row--total">
                            <dt>{{ __('all.amount') ?? 'Amount' }}</dt>
                            <dd>{{ $currency }} {{ convert_money($booking1->amount) }}</dd>
                        </div>
                    </dl>
                </div>
            @endif

            @if (isset($booking2) && $booking2)
                @php
                    $secondFrom = $booking2->pickup_point;
                    $secondTo = $booking2->dropping_point;
                    if (isset($booking1) && $booking1) {
                        if ($booking1->pickup_point == $secondFrom && $booking1->dropping_point == $secondTo) {
                            $secondFrom = $booking1->dropping_point;
                            $secondTo = $booking1->pickup_point;
                        }
                    }
                @endphp
                <div class="payment-result-card payment-result-leg">
                    <p class="payment-result-leg__label">
                        <i class="fas fa-arrow-left" aria-hidden="true"></i>
                        {{ __('all.return') ?? 'Return' }}
                    </p>
                    <dl class="payment-result-rows">
                        <div class="payment-result-row">
                            <dt>{{ __('all.booking_code') ?? 'Booking Code' }}</dt>
                            <dd>{{ $booking2->booking_code }}</dd>
                        </div>
                        <div class="payment-result-row">
                            <dt>{{ __('all.route') ?? 'Route' }}</dt>
                            <dd>{{ $secondFrom }} → {{ $secondTo }}</dd>
                        </div>
                        <div class="payment-result-row">
                            <dt>{{ __('all.travel_date') ?? 'Travel Date' }}</dt>
                            <dd>{{ $booking2->travel_date }}</dd>
                        </div>
                        <div class="payment-result-row">
                            <dt>{{ __('all.seats') ?? 'Seats' }}</dt>
                            <dd>{{ $booking2->seat }}</dd>
                        </div>
                        <div class="payment-result-row payment-result-row--total">
                            <dt>{{ __('all.amount') ?? 'Amount' }}</dt>
                            <dd>{{ $currency }} {{ convert_money($booking2->amount) }}</dd>
                        </div>
                    </dl>
                </div>
            @endif
        </div>

        <div class="payment-result-actions">
            <a href="{{ route('home') }}" class="page-btn">
                <i class="fas fa-home" aria-hidden="true"></i>
                {{ __('all.return_home') ?? 'Return Home' }}
            </a>
            @auth
                @if (auth()->user()->isCustomer())
                    <a href="{{ route('customer.mybooking') }}" class="page-btn page-btn--outline">
                        <i class="fas fa-ticket" aria-hidden="true"></i>
                        {{ __('all.view_my_bookings') }}
                    </a>
                @elseif (auth()->user()->isVender())
                    <a href="{{ route('vender.history') }}" class="page-btn page-btn--outline">
                        <i class="fas fa-ticket" aria-hidden="true"></i>
                        {{ __('all.view_my_bookings') }}
                    </a>
                @endif
            @endauth
            @if (isset($booking1) && $booking1)
                <form action="{{ route('ticket.print') }}" method="POST">
                    @csrf
                    <input type="hidden" name="data" value='{{ json_encode(["id" => $booking1->id]) }}'>
                    <button type="submit" class="page-btn page-btn--outline w-full sm:w-auto">
                        <i class="fas fa-print" aria-hidden="true"></i>
                        {{ __('all.print_ticket') ?? 'Print' }} ({{ __('all.outbound') ?? 'Outbound' }})
                    </button>
                </form>
            @endif
            @if (isset($booking2) && $booking2)
                <form action="{{ route('ticket.print') }}" method="POST">
                    @csrf
                    <input type="hidden" name="data" value='{{ json_encode(["id" => $booking2->id]) }}'>
                    <button type="submit" class="page-btn page-btn--outline w-full sm:w-auto">
                        <i class="fas fa-print" aria-hidden="true"></i>
                        {{ __('all.print_ticket') ?? 'Print' }} ({{ __('all.return') ?? 'Return' }})
                    </button>
                </form>
            @endif
        </div>
    </div>
</div>

<script>
    (function () {
        var homeUrl = "{{ route('home') }}";
        if (window.history && window.history.pushState) {
            window.history.pushState({ ticketSuccess: true }, '', window.location.href);
            window.addEventListener('popstate', function () {
                window.location.href = homeUrl;
            });
        }
    })();
</script>
