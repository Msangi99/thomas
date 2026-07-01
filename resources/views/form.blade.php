@extends('test.layouts.marketing')

@section('title', __('all.booking_information') . ' — ' . __('all.highlink_isgc'))

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => __('all.highlink_isgc'),
        'title' => __('all.booking_information'),
        'subtitle' => __('all.enter_email_phone_number_to_view_booking'),
        'image' => 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?w=1200&q=80',
    ])
@endsection

@section('content')
<section class="page-section page-section--alt">
    <div class="container mx-auto px-4 max-w-3xl">
        <div class="customer-panel fade-in">
            <div class="customer-panel__header">
                <h3 class="text-lg flex items-center gap-2">
                    <i class="fas fa-search" aria-hidden="true"></i>
                    {{ __('all.your_booking_details') }}
                </h3>
            </div>
            <div class="customer-panel__body">
                <p class="text-sm text-gray-600 mb-5">{{ __('all.view_manage_travel_bookings') }}</p>

                @if (session('success'))
                    <div class="customer-alert customer-alert--success mb-4" role="status">{{ session('success') }}</div>
                @endif

                @if ($errors->any())
                    <div class="customer-alert customer-alert--error mb-4" role="alert">
                        {{ $errors->first('data') ?: $errors->first() }}
                    </div>
                @endif

                @include('test.partials.guest_booking_search_form')
            </div>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mt-8">
            <article class="page-card text-center fade-in">
                <div class="page-card__icon mx-auto"><i class="fas fa-envelope"></i></div>
                <h3 class="page-card__title text-sm">{{ __('all.email_or_phone_number') }}</h3>
                <p class="page-card__text text-sm">{{ __('all.booking_lookup_hint') }}</p>
            </article>
            <article class="page-card text-center fade-in">
                <div class="page-card__icon mx-auto"><i class="fas fa-mobile-alt"></i></div>
                <h3 class="page-card__title text-sm">{{ __('customer/myticket.status') }}</h3>
                <p class="page-card__text text-sm">{{ __('all.view_manage_travel_bookings') }}</p>
            </article>
            <article class="page-card text-center fade-in">
                <div class="page-card__icon mx-auto"><i class="fas fa-print"></i></div>
                <h3 class="page-card__title text-sm">{{ __('customer/myticket.print') ?? 'Print ticket' }}</h3>
                <p class="page-card__text text-sm">{{ __('customer/busroot.resave_description') }}</p>
            </article>
        </div>
    </div>
</section>
@endsection
