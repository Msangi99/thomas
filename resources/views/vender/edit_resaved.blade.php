@extends('vender.app')

@section('title', __('all.edit_booking'))

@section('content')
<div class="vendor-dash fade-in">
    <header class="vendor-dash__header mb-6">
        <div class="vendor-dash__welcome">
            <p class="vendor-dash__eyebrow">{{ __('vender/resaved_tickets.title') }}</p>
            <h1 class="vendor-dash__title">{{ __('all.edit_booking') }}</h1>
            <p class="vendor-dash__subtitle font-mono">{{ $booking->booking_code ?? '' }}</p>
        </div>
    </header>

    <section class="vendor-table-card max-w-2xl">
        <div class="p-4 sm:p-6">
            @if (session('success'))
                <div class="customer-alert customer-alert--success mb-4" role="alert">{{ session('success') }}</div>
            @endif
            @if (session('error'))
                <div class="customer-alert customer-alert--error mb-4" role="alert">{{ session('error') }}</div>
            @endif

            <div class="edit-booking-meta mb-6">
                @if (!empty($booking->pickup_point) || !empty($booking->dropping_point))
                    <p class="edit-booking-meta__route">
                        <i class="fas fa-route" aria-hidden="true"></i>
                        {{ $booking->pickup_point ?? '—' }}
                        <span class="edit-booking-meta__arrow">→</span>
                        {{ $booking->dropping_point ?? '—' }}
                    </p>
                @endif
                @if (!empty($booking->travel_date))
                    <p class="edit-booking-meta__date">
                        <i class="fas fa-calendar-day" aria-hidden="true"></i>
                        {{ $booking->travel_date }}
                    </p>
                @endif
            </div>

            <form action="{{ route('vender.update.resaved') }}" method="POST" class="space-y-5">
                @csrf
                <input type="hidden" name="booking_id" value="{{ $booking->id }}">

                <div class="booking-field">
                    <label class="booking-field__label" for="name">{{ __('vender/resaved_tickets.customer_name') }}</label>
                    <input type="text" id="name" name="name" class="page-input" required
                        value="{{ old('name', $booking->customer_name) }}">
                </div>

                <div class="booking-field">
                    <label class="booking-field__label" for="phone">{{ __('customer/busroot.mobile_number') }}</label>
                    <input type="tel" id="phone" name="phone" class="page-input" required maxlength="13"
                        value="{{ old('phone', $booking->customer_phone) }}">
                </div>

                <div class="booking-field">
                    <label class="booking-field__label" for="email">{{ __('customer/busroot.email_address') }}</label>
                    <input type="email" id="email" name="email" class="page-input"
                        value="{{ old('email', $booking->customer_email) }}">
                </div>

                <div class="flex flex-wrap gap-3 pt-2">
                    <button type="submit" class="page-btn">
                        <i class="fas fa-save" aria-hidden="true"></i> {{ __('all.update') }}
                    </button>
                    <a href="{{ route('vender.resaved.tickets') }}" class="page-btn page-btn--outline">
                        {{ __('all.back_button') }}
                    </a>
                </div>
            </form>
        </div>
    </section>
</div>
@endsection
