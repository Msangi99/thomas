@extends('vender.app')

@section('title', __('vender/busroot.round_payment_success_title'))
@section('content')
<section class="bg-gradient-to-b from-gray-200 to-gray-600 py-8 px-4 sm:px-6 lg:px-8 rounded-3xl">
    <div class="max-w-3xl mx-auto">
        <div class="bg-white rounded-xl shadow-lg overflow-hidden">
            <div class="bg-green-600 px-6 py-4">
                <h1 class="text-xl font-bold text-white">{{ __('vender/busroot.round_payment_successful') }}</h1>
            </div>
            <div class="p-6">
                <h2 class="text-center text-green-700 text-lg font-semibold mb-2">{{ __('vender/busroot.round_trip_booking_confirmed') }}</h2>
                <p class="text-center text-gray-600 mb-6">{{ __('vender/busroot.round_payment_thank_you') }}</p>

                @if(isset($booking1) && $booking1)
                    <div class="border border-gray-200 rounded-lg p-4 mb-4 bg-gray-50">
                        <h5 class="font-bold text-gray-800 mb-2">{{ __('vender/busroot.first_leg_booking_details') }}</h5>
                        <p><strong>{{ __('vender/busroot.booking_code') }}:</strong> {{ $booking1->booking_code }}</p>
                        <p><strong>{{ __('vender/busroot.from') }}:</strong> {{ $booking1->pickup_point }}</p>
                        <p><strong>{{ __('vender/busroot.to') }}:</strong> {{ $booking1->dropping_point }}</p>
                        <p><strong>{{ __('vender/busroot.travel_date') }}:</strong> {{ $booking1->travel_date }}</p>
                        <p><strong>{{ __('vender/busroot.seats') }}:</strong> {{ $booking1->seat }}</p>
                        <p><strong>{{ __('vender/busroot.amount_paid') }}:</strong> TZS {{ number_format($booking1->amount, 2) }}</p>
                    </div>
                @endif

                @if(isset($booking2) && $booking2)
                    <div class="border border-gray-200 rounded-lg p-4 mb-4 bg-gray-50">
                        <h5 class="font-bold text-gray-800 mb-2">{{ __('vender/busroot.second_leg_booking_details') }}</h5>
                        <p><strong>{{ __('vender/busroot.booking_code') }}:</strong> {{ $booking2->booking_code }}</p>
                        <p><strong>{{ __('vender/busroot.from') }}:</strong> {{ $booking2->pickup_point }}</p>
                        <p><strong>{{ __('vender/busroot.to') }}:</strong> {{ $booking2->dropping_point }}</p>
                        <p><strong>{{ __('vender/busroot.travel_date') }}:</strong> {{ $booking2->travel_date }}</p>
                        <p><strong>{{ __('vender/busroot.seats') }}:</strong> {{ $booking2->seat }}</p>
                        <p><strong>{{ __('vender/busroot.amount_paid') }}:</strong> TZS {{ number_format($booking2->amount, 2) }}</p>
                    </div>
                @endif

                <div class="flex flex-wrap gap-3 justify-center mt-6">
                    <a href="{{ route('home') }}" class="inline-flex items-center px-4 py-2 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700">{{ __('all.return_home') }}</a>
                    <a href="{{ route('vender.history') }}" class="inline-flex items-center px-4 py-2 bg-gray-600 text-white rounded-lg hover:bg-gray-700">{{ __('all.view_my_bookings') }}</a>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
