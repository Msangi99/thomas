@extends('test.layouts.marketing')

@section('title', 'Popular Routes — ' . __('all.higlink_premium_travel'))

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => 'Travel Across Tanzania',
        'title' => 'Popular Routes',
        'subtitle' => 'Top destinations travelled by our passengers — book in one click',
        'image' => 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?w=1200&q=80',
    ])
@endsection

@section('content')
    <section class="page-section pt-0">
        <div class="container mx-auto px-4 -mt-8 relative z-10">
            @include('test.sach')
        </div>
    </section>

    @include('test.popular_routes')

    <section class="page-section page-section--alt">
        <div class="container mx-auto px-4 text-center fade-in">
            <h2 class="section-title mb-3">Looking for <span style="color:var(--home-primary)">today's</span> buses?</h2>
            <p class="section-subtitle mb-6">See every departure leaving today and book your seat right away</p>
            <a href="{{ route('schedules.today') }}" class="home-schedules__explore">
                View Today's Schedules <i class="fas fa-clock" aria-hidden="true"></i>
            </a>
        </div>
    </section>

    @include('test.cta_band')
@endsection
