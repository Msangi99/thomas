@extends('customer.app')

@section('title', ($companyName ?? __('all.bus_name')) . ' — ' . __('all.highlink_isgc'))

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => __('all.highlink_isgc'),
        'title' => $companyName ?? __('all.bus_name'),
        'subtitle' => __('all.bus_schedules') . ' — upcoming departures',
        'image' => 'https://images.unsplash.com/photo-1570125909232-e097323dccff?w=1200&q=80',
    ])
@endsection

@section('content')
    <section class="page-section pt-0 pb-6">
        <div class="page-search-wrap">
            @include('test.sach', ['activeSearchTab' => 'bus-name'])
        </div>
    </section>

    @include('test.partials.bus_search_results', [
        'busList' => $busList,
        'departureCityName' => $departureCityName,
        'arrivalCityName' => $arrivalCityName,
        'departure_date' => $departure_date,
        'resultsContext' => 'company',
        'resultsCentered' => true,
    ])
@endsection
