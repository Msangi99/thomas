@extends('test.layouts.marketing')

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => 'Highlink ISGC',
        'title' => __('all.about_highlink_company'),
        'subtitle' => __('all.delivering_solutions_since_2015'),
        'image' => 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?w=1200&q=80',
    ])
@endsection

@section('content')
<section class="page-section page-section--alt">
    <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <article class="page-card fade-in">
                <div class="page-card__icon"><i class="fas fa-book-open"></i></div>
                <h2 class="page-card__title">{{ __('all.our_story') }}</h2>
                <p class="page-card__text">{{ __('all.our_story_description') }}</p>
            </article>
            <article class="page-card fade-in">
                <div class="page-card__icon"><i class="fas fa-eye"></i></div>
                <h2 class="page-card__title">{{ __('all.our_vision') }}</h2>
                <p class="page-card__text">{{ __('all.our_vision_description') }}</p>
            </article>
            <article class="page-card fade-in">
                <div class="page-card__icon"><i class="fas fa-bullseye"></i></div>
                <h2 class="page-card__title">{{ __('all.our_mission') }}</h2>
                <p class="page-card__text">{{ __('all.our_mission_description') }}</p>
            </article>
            <article class="page-card fade-in">
                <div class="page-card__icon"><i class="fas fa-handshake"></i></div>
                <h2 class="page-card__title">{{ __('all.our_philosophy') }}</h2>
                <p class="page-card__text">{{ __('all.our_philosophy_description') }}</p>
            </article>
            <article class="page-card fade-in md:col-span-2">
                <div class="page-card__icon"><i class="fas fa-bus"></i></div>
                <h2 class="page-card__title">{{ __('all.our_capacity') }}</h2>
                <p class="page-card__text">{{ __('all.our_capacity_description') }}</p>
            </article>
        </div>
    </div>
</section>

<section class="page-section">
    <div class="container mx-auto px-4 max-w-3xl">
        <div class="page-card text-center fade-in">
            <h2 class="section-title mb-4">{{ __('all.contact_us') }}</h2>
            <div class="space-y-2 text-gray-600 text-sm">
                <p>{{ __('all.highlink_company_full_name') }}</p>
                <p>{{ __('all.address_line_1') }}</p>
                <p>{{ __('all.address_line_2') }}</p>
                <p>
                    {{ __('all.email') }}
                    <a href="mailto:support@hisgc.co.tz" class="font-semibold" style="color:var(--home-primary)">support@hisgc.co.tz</a>
                </p>
                <p>
                    {{ __('all.phone') }}
                    <a href="tel:+255755879793" class="font-semibold" style="color:var(--home-primary)">+255 755 879 793</a>
                </p>
            </div>
            <a href="{{ route('contact') }}" class="page-btn mt-6">Get In Touch</a>
        </div>
    </div>
</section>

@include('test.cta_band')
@endsection
