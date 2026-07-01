@extends('test.layouts.marketing')

@section('title', $departureCityName . ($arrivalCityName ? ' ➔ ' . $arrivalCityName : '') . ' — ' . __('all.higlink_premium_travel'))

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => __('all.search_results'),
        'title' => $departureCityName . ($arrivalCityName ? ' ➔ ' . $arrivalCityName : ''),
        'subtitle' => __('all.departure_date') . ': ' . \Carbon\Carbon::parse($departure_date)->format('l, F j, Y'),
        'image' => 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?w=1200&q=80',
    ])
@endsection

@section('content')
    <section class="page-section pt-0 pb-6">
        <div class="page-search-wrap">
            @include('test.sach')
        </div>
    </section>

    @include('test.partials.bus_search_results', [
        'busList' => $busList,
        'departureCityName' => $departureCityName,
        'arrivalCityName' => $arrivalCityName,
        'departure_date' => $departure_date,
    ])
@endsection
