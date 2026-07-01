@php
    $totalPayable = round($price + $fees, 2);
    $routeLabel = ($booking->route_name->from ?? $booking->pickup_point ?? '—')
        . ' → '
        . ($booking->route_name->to ?? $booking->dropping_point ?? '—');
    $reservedUntil = $booking->resaved_until
        ? \Carbon\Carbon::parse($booking->resaved_until)
        : null;
@endphp

@extends('vender.app')

@section('title', __('customer/busroot.complete_your_payment'))

@section('content')
<div class="vendor-dash fade-in">
    <header class="vendor-dash__header mb-6">
        <div class="vendor-dash__welcome">
            <p class="vendor-dash__eyebrow">{{ __('vender/resaved_tickets.title') }}</p>
            <h1 class="vendor-dash__title">{{ __('customer/busroot.complete_your_payment') }}</h1>
            <p class="vendor-dash__subtitle">{{ __('customer/busroot.pay_reserved_subtitle') }}</p>
        </div>
    </header>

    @if ($reservedUntil)
        <div class="customer-alert customer-alert--error mb-6 flex flex-wrap items-center justify-between gap-2" role="status">
            <span>
                <i class="fas fa-clock mr-2" aria-hidden="true"></i>
                {{ __('customer/busroot.resaved_until') }}:
                <strong>{{ $reservedUntil->format('M j, Y g:i A') }}</strong>
            </span>
            <span class="text-sm font-mono" id="resaved-countdown" data-expires="{{ $reservedUntil->toIso8601String() }}"></span>
        </div>
    @endif

    @if (session('error'))
        <div class="customer-alert customer-alert--error mb-6" role="alert">{{ session('error') }}</div>
    @endif
    @if ($errors->any())
        <div class="customer-alert customer-alert--error mb-6" role="alert">
            <ul class="list-disc list-inside space-y-0.5">
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <div class="lg:col-span-2 space-y-6">
            <section class="vendor-table-card">
                <div class="vendor-table-card__head">
                    <div class="vendor-table-card__title-wrap">
                        <h3>{{ __('customer/busroot.reserved_ticket_details') }}</h3>
                        <p class="font-mono">{{ $booking->booking_code }}</p>
                    </div>
                </div>
                <div class="p-4 sm:p-6">
                    <dl class="payment-result-rows">
                        <div class="payment-result-row">
                            <dt>{{ __('vender/resaved_tickets.booking_code') }}</dt>
                            <dd>{{ $booking->booking_code }}</dd>
                        </div>
                        <div class="payment-result-row">
                            <dt>{{ __('vender/resaved_tickets.route') }}</dt>
                            <dd>{{ $routeLabel }}</dd>
                        </div>
                        <div class="payment-result-row">
                            <dt>{{ __('vender/resaved_tickets.travel_date') }}</dt>
                            <dd>{{ \Carbon\Carbon::parse($booking->travel_date)->format('l, M j, Y') }}</dd>
                        </div>
                        @if ($booking->bus?->busname?->name)
                            <div class="payment-result-row">
                                <dt>{{ __('vender/resaved_tickets.bus_number') }}</dt>
                                <dd>{{ $booking->bus->busname->name }}</dd>
                            </div>
                        @endif
                        <div class="payment-result-row">
                            <dt>{{ __('vender/resaved_tickets.seats') }}</dt>
                            <dd>{{ $booking->seat }}</dd>
                        </div>
                        <div class="payment-result-row">
                            <dt>{{ __('vender/resaved_tickets.resaved_until') }}</dt>
                            <dd>{{ $reservedUntil ? $reservedUntil->format('M j, Y g:i A') : __('all.not_available_short') }}</dd>
                        </div>
                    </dl>
                </div>
            </section>

            <section class="vendor-table-card">
                <div class="p-4 sm:p-6">
                    @if ($test_mode ?? false)
                        @include('partials.pay_resaved_test_mode', ['booking' => $booking])
                    @else
                        @include('vender.partials.pay_resaved_payment')
                    @endif
                </div>
            </section>
        </div>

        <aside class="vendor-table-card h-fit lg:sticky lg:top-24">
            <div class="vendor-table-card__head">
                <div class="vendor-table-card__title-wrap">
                    <h3>{{ __('customer/busroot.price_summary') }}</h3>
                </div>
            </div>
            <div class="p-4 sm:p-6">
                <dl class="inline-payment__lines">
                    <div class="inline-payment__line">
                        <dt>{{ __('customer/busroot.discount') }}</dt>
                        <dd>{{ $currency }} {{ number_format($dis, 2) }}</dd>
                    </div>
                    @if (($ins ?? 0) > 0)
                        <div class="inline-payment__line">
                            <dt>{{ __('customer/busroot.insurance') }}</dt>
                            <dd>{{ $currency }} {{ number_format($ins) }}</dd>
                        </div>
                    @endif
                    <div class="inline-payment__line">
                        <dt>{{ __('customer/busroot.system_charge') }}</dt>
                        <dd>{{ $currency }} {{ convert_money($fees) }}</dd>
                    </div>
                    <div class="inline-payment__line">
                        <dt>{{ __('customer/busroot.bus_fare') }}</dt>
                        <dd>{{ $currency }} {{ convert_money($price - ($ins ?? 0)) }}</dd>
                    </div>
                    <div class="inline-payment__line inline-payment__line--total">
                        <dt>{{ __('customer/busroot.total_payable') }}</dt>
                        <dd>{{ $currency }} {{ convert_money($totalPayable) }}</dd>
                    </div>
                </dl>
            </div>
        </aside>
    </div>

    <div class="mt-6">
        <a href="{{ route('vender.resaved.tickets') }}" class="page-btn page-btn--outline">
            <i class="fas fa-arrow-left" aria-hidden="true"></i>
            {{ __('all.back_button') }}
        </a>
    </div>
</div>
@endsection

@push('scripts')
<script>
    @include('partials.tz_phone_normalize_js')

    (function () {
        const root = document.querySelector('[data-resaved-payment]');
        if (!root) return;

        root.querySelectorAll('[data-resaved-pay-tab]').forEach(function (btn) {
            btn.addEventListener('click', function () {
                const key = btn.dataset.resavedPayTab;
                root.querySelectorAll('[data-resaved-pay-tab]').forEach(function (b) {
                    const active = b === btn;
                    b.classList.toggle('inline-payment__tab--active', active);
                    b.setAttribute('aria-selected', active ? 'true' : 'false');
                });
                root.querySelectorAll('[data-resaved-pay-pane]').forEach(function (pane) {
                    const active = pane.dataset.resavedPayPane === key;
                    pane.classList.toggle('inline-payment__pane--active', active);
                    if (active) {
                        pane.removeAttribute('hidden');
                    } else {
                        pane.setAttribute('hidden', '');
                    }
                });
            });
        });

        root.querySelectorAll('.resaved-pay-form').forEach(function (form) {
            form.addEventListener('submit', function (e) {
                const visible = form.querySelector('.resaved-phone-input');
                const hidden = form.querySelector('.resaved-phone-hidden');
                if (!visible || !hidden) return;

                const raw = visible.value ? visible.value.trim() : '';
                if (!raw) {
                    hidden.value = '';
                    return;
                }

                const normalized = typeof normalizePhoneTo255 === 'function'
                    ? normalizePhoneTo255(raw)
                    : raw.replace(/\D/g, '');

                if (!normalized) {
                    e.preventDefault();
                    alert(@json(__('customer/busroot.invalid_payment_phone')));
                    visible.focus();
                    return;
                }

                hidden.value = normalized;
            });
        });

        const resavedCountdownI18n = {
            expired: @json(__('all.reservation_expired')),
            left: @json(__('all.countdown_left')),
        };

        const countdownEl = document.getElementById('resaved-countdown');
        if (countdownEl && countdownEl.dataset.expires) {
            const expires = new Date(countdownEl.dataset.expires).getTime();
            function tick() {
                const diff = expires - Date.now();
                if (diff <= 0) {
                    countdownEl.textContent = resavedCountdownI18n.expired;
                    return;
                }
                const h = Math.floor(diff / 3600000);
                const m = Math.floor((diff % 3600000) / 60000);
                const s = Math.floor((diff % 60000) / 1000);
                countdownEl.textContent = (h > 0 ? h + 'h ' : '') + m + 'm ' + s + 's ' + resavedCountdownI18n.left;
            }
            tick();
            setInterval(tick, 1000);
        }
    })();
</script>
@endpush
