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
                        <p><strong>{{ __('vender/busroot.amount_paid') }}:</strong> {{ $currency }} {{ convert_money($booking1->amount + ($booking1->fee ?? 0)) }}</p>
                        <p class="mt-2">
                            <strong>{{ __('vender/busroot.company') }}:</strong> {{ $booking1->campany->name ?? __('vender/history.na') }}
                            <span class="mx-2">|</span>
                            <strong>{{ __('vender/busroot.bus_number') }}:</strong> {{ $booking1->bus->bus_number ?? __('vender/history.na') }}
                        </p>
                    </div>
                @endif

                @if(isset($booking2) && $booking2)
                    @php
                        // Second leg: use booking2 pickup_point/dropping_point, then schedule from/to, then bus route, then reverse of first leg
                        $secondFrom = $booking2->pickup_point ?? optional($booking2->schedule)->from ?? optional(optional($booking2->bus)->route)->from ?? (isset($booking1) && $booking1 ? $booking1->dropping_point : __('vender/history.na'));
                        $secondTo   = $booking2->dropping_point ?? optional($booking2->schedule)->to ?? optional(optional($booking2->bus)->route)->to ?? (isset($booking1) && $booking1 ? $booking1->pickup_point : __('vender/history.na'));
                    @endphp
                    <div class="border border-gray-200 rounded-lg p-4 mb-4 bg-gray-50">
                        <h5 class="font-bold text-gray-800 mb-2">{{ __('vender/busroot.second_leg_booking_details') }}</h5>
                        <p><strong>{{ __('vender/busroot.booking_code') }}:</strong> {{ $booking2->booking_code }}</p>
                        <p><strong>{{ __('vender/busroot.from') }}:</strong> {{ $secondFrom }}</p>
                        <p><strong>{{ __('vender/busroot.to') }}:</strong> {{ $secondTo }}</p>
                        <p><strong>{{ __('vender/busroot.travel_date') }}:</strong> {{ $booking2->travel_date }}</p>
                        <p><strong>{{ __('vender/busroot.seats') }}:</strong> {{ $booking2->seat }}</p>
                        <p><strong>{{ __('vender/busroot.amount_paid') }}:</strong> {{ $currency }} {{ convert_money($booking2->amount + ($booking2->fee ?? 0)) }}</p>
                        <p class="mt-2">
                            <strong>{{ __('vender/busroot.company') }}:</strong> {{ $booking2->campany->name ?? __('vender/history.na') }}
                            <span class="mx-2">|</span>
                            <strong>{{ __('vender/busroot.bus_number') }}:</strong> {{ $booking2->bus->bus_number ?? __('vender/history.na') }}
                        </p>
                    </div>
                @endif

                <div class="flex flex-wrap gap-3 justify-center mt-6">
                    <a href="{{ route('home') }}" class="inline-flex items-center px-4 py-2 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700">{{ __('all.return_home') }}</a>
                    <a href="{{ route('vender.history') }}" class="inline-flex items-center px-4 py-2 bg-gray-600 text-white rounded-lg hover:bg-gray-700">{{ __('all.view_my_bookings') }}</a>
                    
                    @if(isset($booking1) && $booking1)
                        <form action="{{ route('ticket.print') }}" method="POST" class="inline">
                            @csrf
                            <input type="hidden" name="data" value='{{ json_encode(["id" => $booking1->id]) }}'>
                            <button type="submit" class="inline-flex items-center px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700">
                                <svg class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 17h2a2 2 0 002-2v-4a2 2 0 00-2-2H5a2 2 0 00-2 2v4a2 2 0 002 2h2m2 4h6a2 2 0 002-2v-4a2 2 0 00-2-2H9a2 2 0 00-2 2v4a2 2 0 002 2zm8-12V5a2 2 0 00-2-2H9a2 2 0 00-2 2v4h10z" />
                                </svg>
                                {{ __('vender/history.print_ticket') }} ({{ __('vender/busroot.first_leg_booking_details') }})
                            </button>
                        </form>
                    @endif
                    
                    @if(isset($booking2) && $booking2)
                        <form action="{{ route('ticket.print') }}" method="POST" class="inline">
                            @csrf
                            <input type="hidden" name="data" value='{{ json_encode(["id" => $booking2->id]) }}'>
                            <button type="submit" class="inline-flex items-center px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700">
                                <svg class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 17h2a2 2 0 002-2v-4a2 2 0 00-2-2H5a2 2 0 00-2 2v4a2 2 0 002 2h2m2 4h6a2 2 0 002-2v-4a2 2 0 00-2-2H9a2 2 0 00-2 2v4a2 2 0 002 2zm8-12V5a2 2 0 00-2-2H9a2 2 0 00-2 2v4h10z" />
                                </svg>
                                {{ __('vender/history.print_ticket') }} ({{ __('vender/busroot.second_leg_booking_details') }})
                            </button>
                        </form>
                    @endif
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
