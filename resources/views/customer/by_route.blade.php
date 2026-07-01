@extends('customer.app')

@section('title', __('customer_sidebar.Bus Route'))

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => __('all.highlink_isgc'),
        'title' => __('all.search_buses'),
        'subtitle' => __('all.search_bus_schedules'),
    ])
@endsection

@section('content')
    <section class="page-section pt-0 pb-6">
        <div class="page-search-wrap">
            @include('test.sach')
        </div>
    </section>
@endsection
