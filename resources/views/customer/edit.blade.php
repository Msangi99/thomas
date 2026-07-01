@extends('customer.app')

@section('title', __('all.edit_booking'))

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => __('all.highlink_isgc'),
        'title' => __('all.edit_booking'),
        'subtitle' => $booking->booking_code ?? __('customer/myticket.my_ticket'),
    ])
@endsection

@section('content')
<section class="page-section page-section--alt">
    <div class="container mx-auto px-4 max-w-2xl">
        <div class="customer-panel fade-in">
            <div class="customer-panel__header flex flex-col sm:flex-row sm:items-center sm:justify-between gap-2">
                <h3 class="text-base sm:text-lg flex items-center gap-2">
                    <i class="fas fa-pen-to-square"></i>
                    {{ __('all.edit_booking') }}
                </h3>
                @if (!empty($booking->booking_code))
                    <span class="text-sm opacity-90 font-mono">{{ $booking->booking_code }}</span>
                @endif
            </div>

            <div class="customer-panel__body">
                @if (session('success'))
                    <div class="customer-alert customer-alert--success" role="alert">
                        {{ session('success') }}
                    </div>
                @endif
                @if (session('error'))
                    <div class="customer-alert customer-alert--error" role="alert">
                        {{ session('error') }}
                    </div>
                @endif

                @if ($booking)
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

                    <form action="{{ route('customer.update') }}" method="POST" class="space-y-5">
                        @csrf
                        <input type="hidden" name="booking_id" value="{{ $booking->id }}">

                        <div>
                            <label for="name" class="block text-sm font-semibold text-gray-700 mb-1 uppercase tracking-wide">
                                {{ __('all.name') }}
                            </label>
                            <input type="text" id="name" name="name"
                                   value="{{ old('name', $booking->customer_name) }}"
                                   class="page-input" required autocomplete="name">
                            @error('name')
                                <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                            @enderror
                        </div>

                        <div>
                            <label for="email" class="block text-sm font-semibold text-gray-700 mb-1 uppercase tracking-wide">
                                {{ __('all.email') }}
                            </label>
                            <input type="email" id="email" name="email"
                                   value="{{ old('email', $booking->customer_email) }}"
                                   class="page-input" required autocomplete="email">
                            @error('email')
                                <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                            @enderror
                        </div>

                        <div>
                            <label for="phone" class="block text-sm font-semibold text-gray-700 mb-1 uppercase tracking-wide">
                                {{ __('all.phone') }}
                            </label>
                            <input type="tel" id="phone" name="phone"
                                   value="{{ old('phone', $booking->customer_phone) }}"
                                   class="page-input" required autocomplete="tel">
                            @error('phone')
                                <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                            @enderror
                        </div>

                        <div class="flex flex-col-reverse sm:flex-row gap-3 pt-2">
                            <a href="{{ route('customer.mybooking') }}" class="page-btn page-btn--outline text-center">
                                <i class="fas fa-arrow-left"></i>
                                {{ __('all.back_button') }}
                            </a>
                            <button type="submit" class="page-btn sm:flex-1">
                                <i class="fas fa-save"></i>
                                {{ __('all.update') }}
                            </button>
                        </div>
                    </form>
                @else
                    <div class="tickets-empty">
                        <div class="tickets-empty__icon"><i class="fas fa-ticket"></i></div>
                        <h4 class="tickets-empty__title">{{ __('customer/myticket.no_booking_found') }}</h4>
                        <a href="{{ route('customer.mybooking') }}" class="page-btn mt-4">
                            {{ __('all.view_my_bookings') }}
                        </a>
                    </div>
                @endif
            </div>
        </div>
    </div>
</section>
@endsection
