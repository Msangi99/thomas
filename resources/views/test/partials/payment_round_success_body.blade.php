<div class="payment-result-panel fade-in">
    <div class="payment-result-panel__body">
        <div class="payment-result-status payment-result-status--success">
            <div class="payment-result-status__icon" aria-hidden="true">
                <i class="fas fa-check"></i>
            </div>
            <h2 class="payment-result-status__title">{{ __('all.payment_successful') }}</h2>
            <p class="payment-result-status__subtitle">{{ __('all.round_trip_booking_confirmed') }}</p>
        </div>

        <div class="payment-result-grid">
            @if (isset($booking1) && $booking1)
                <div class="payment-result-card payment-result-leg">
                    <p class="payment-result-leg__label">
                        <i class="fas fa-arrow-right" aria-hidden="true"></i>
                        {{ __('all.outbound') }}
                    </p>
                    <dl class="payment-result-rows">
                        <div class="payment-result-row">
                            <dt>{{ __('all.booking_code') }}</dt>
                            <dd>{{ $booking1->booking_code }}</dd>
                        </div>
                        <div class="payment-result-row">
                            <dt>{{ __('all.route') }}</dt>
                            <dd>{{ $booking1->pickup_point }} → {{ $booking1->dropping_point }}</dd>
                        </div>
                        <div class="payment-result-row">
                            <dt>{{ __('all.travel_date') }}</dt>
                            <dd>{{ $booking1->travel_date }}</dd>
                        </div>
                        <div class="payment-result-row">
                            <dt>{{ __('all.seats') }}</dt>
                            <dd>{{ $booking1->seat }}</dd>
                        </div>
                        <div class="payment-result-row payment-result-row--total">
                            <dt>{{ __('all.amount') }}</dt>
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
                        {{ __('all.return_leg') }}
                    </p>
                    <dl class="payment-result-rows">
                        <div class="payment-result-row">
                            <dt>{{ __('all.booking_code') }}</dt>
                            <dd>{{ $booking2->booking_code }}</dd>
                        </div>
                        <div class="payment-result-row">
                            <dt>{{ __('all.route') }}</dt>
                            <dd>{{ $secondFrom }} → {{ $secondTo }}</dd>
                        </div>
                        <div class="payment-result-row">
                            <dt>{{ __('all.travel_date') }}</dt>
                            <dd>{{ $booking2->travel_date }}</dd>
                        </div>
                        <div class="payment-result-row">
                            <dt>{{ __('all.seats') }}</dt>
                            <dd>{{ $booking2->seat }}</dd>
                        </div>
                        <div class="payment-result-row payment-result-row--total">
                            <dt>{{ __('all.amount') }}</dt>
                            <dd>{{ $currency }} {{ convert_money($booking2->amount) }}</dd>
                        </div>
                    </dl>
                </div>
            @endif
        </div>

        @if (isset($booking1) && $booking1)
            <div class="payment-result-code">
                <p class="payment-result-code__label">{{ __('all.verification_code') }} — {{ __('all.outbound') }}</p>
                <p class="payment-result-code__value">{{ $booking1->booking_code }}</p>
            </div>
        @endif
        @if (isset($booking2) && $booking2)
            <div class="payment-result-code">
                <p class="payment-result-code__label">{{ __('all.verification_code') }} — {{ __('all.return_leg') }}</p>
                <p class="payment-result-code__value">{{ $booking2->booking_code }}</p>
            </div>
        @endif
        <p class="payment-result-code__hint text-center mt-2">{{ __('all.present_code_boarding') }}</p>

        <div class="payment-result-actions">
            <a href="{{ route('home') }}" class="page-btn">
                <i class="fas fa-home" aria-hidden="true"></i>
                {{ __('all.return_home') }}
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
                        {{ __('all.print_ticket_outbound') }}
                    </button>
                </form>
            @endif
            @if (isset($booking2) && $booking2)
                <form action="{{ route('ticket.print') }}" method="POST">
                    @csrf
                    <input type="hidden" name="data" value='{{ json_encode(["id" => $booking2->id]) }}'>
                    <button type="submit" class="page-btn page-btn--outline w-full sm:w-auto">
                        <i class="fas fa-print" aria-hidden="true"></i>
                        {{ __('all.print_ticket_return') }}
                    </button>
                </form>
            @endif
        </div>

        @php
            $customerEmail = $booking1->customer_email ?? ($booking2->customer_email ?? null);
        @endphp
        @if (!empty($customerEmail))
            <div class="payment-result-footer">
                <p>{{ __('all.confirmation_email_sent') }} {{ $customerEmail }}</p>
            </div>
        @endif
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
