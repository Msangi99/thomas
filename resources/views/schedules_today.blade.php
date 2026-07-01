@extends('test.layouts.marketing')

@section('title', "Today's Schedules — " . __('all.higlink_premium_travel'))

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => 'Live Departures',
        'title' => "Today's Schedules",
        'subtitle' => 'All buses leaving today — pick your route and book in minutes',
        'image' => 'https://images.unsplash.com/photo-1570125909232-e097323dccff?w=1200&q=80',
    ])
@endsection

@section('content')
    <section class="page-section pt-0">
        <div class="container mx-auto px-4 -mt-8 relative z-10">
            @include('test.sach')
        </div>
    </section>

    @include('test.today_schedules', [
        'showSectionHeader' => true,
        'showExploreLink' => false,
        'sectionClass' => 'home-schedules--page',
    ])

    <section class="page-section page-section--alt">
        <div class="container mx-auto px-4 text-center fade-in">
            <h2 class="section-title mb-3">Need a different <span style="color:var(--home-primary)">route</span>?</h2>
            <p class="section-subtitle mb-6">Explore our most booked destinations across Tanzania</p>
            <a href="{{ route('routes') }}" class="home-schedules__explore">
                View Popular Routes <i class="fas fa-map-marked-alt" aria-hidden="true"></i>
            </a>
        </div>
    </section>

    @include('test.cta_band')
@endsection
