@extends('test.layouts.marketing')

@section('title', ($departureCityName ? $departureCityName . ' ➔ ' . $arrivalCityName : 'Round Trip') . ' — ' . __('all.higlink_premium_travel'))

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => 'Round Trip',
        'title' => $departureCityName && $arrivalCityName
            ? $departureCityName . ' ➔ ' . $arrivalCityName
            : 'Round Trip Booking',
        'subtitle' => $departureCityName && $arrivalCityName
            ? __('all.departure_date') . ': ' . \Carbon\Carbon::parse($departure_date)->format('l, F j, Y') . ' · Select your outbound bus'
            : 'Book your outbound and return journey in one go.',
        'image' => 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?w=1200&q=80',
    ])
@endsection

@section('content')
    @if (session('info'))
        <section class="page-section pt-6 pb-0">
            <div class="container mx-auto px-4 max-w-4xl">
                <div class="booking-alert booking-alert--info fade-in" role="status">
                    <i class="fas fa-info-circle mr-2"></i>
                    @if (session('info') === 'proceed with returning booking')
                        Outbound leg saved. Search and select your return bus below.
                    @else
                        {{ session('info') }}
                    @endif
                </div>
            </div>
        </section>
    @endif

    @if (session('error'))
        <section class="page-section pt-6 pb-0">
            <div class="container mx-auto px-4 max-w-4xl">
                <div class="booking-alert booking-alert--error fade-in" role="alert">
                    <i class="fas fa-exclamation-circle mr-2"></i>{{ session('error') }}
                </div>
            </div>
        </section>
    @endif

    <section class="page-section pt-0 pb-6">
        <div class="page-search-wrap">
            @include('test.sach', ['activeSearchTab' => 'round-trip'])
        </div>
    </section>

    @if ($departureCityName && $arrivalCityName)
        @include('test.partials.bus_search_results', [
            'busList' => $busList,
            'departureCityName' => $departureCityName,
            'arrivalCityName' => $arrivalCityName,
            'departure_date' => $departure_date,
            'bookingMode' => 'round_trip',
        ])
    @endif
@endsection
