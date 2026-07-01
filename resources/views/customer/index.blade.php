@extends('customer.app')

@section('title', __('customer_sidebar.Dashboard'))

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => __('all.highlink_isgc'),
        'title' => __('all.welcome') . ', ' . auth()->user()->name,
        'subtitle' => __('all.here_are_some_things_you_can_do'),
    ])
@endsection

@section('content')
<section class="page-section page-section--alt">
    <div class="container mx-auto px-4">
        <div class="customer-stat-grid fade-in">
            <article class="customer-stat-card">
                <div class="customer-stat-card__icon customer-stat-card__icon--paid">
                    <i class="fas fa-circle-check"></i>
                </div>
                <div>
                    <p class="customer-stat-card__label">{{ __('all.paid') }}</p>
                    <p class="customer-stat-card__value">{{ $paidCount }}</p>
                </div>
            </article>
            <article class="customer-stat-card">
                <div class="customer-stat-card__icon customer-stat-card__icon--failed">
                    <i class="fas fa-circle-xmark"></i>
                </div>
                <div>
                    <p class="customer-stat-card__label">{{ __('all.failed') }}</p>
                    <p class="customer-stat-card__value">{{ $failedCount }}</p>
                </div>
            </article>
            <article class="customer-stat-card">
                <div class="customer-stat-card__icon customer-stat-card__icon--unpaid">
                    <i class="fas fa-clock"></i>
                </div>
                <div>
                    <p class="customer-stat-card__label">{{ __('all.unpaid') }}</p>
                    <p class="customer-stat-card__value">{{ $unpaidCount }}</p>
                </div>
            </article>
            <article class="customer-stat-card">
                <div class="customer-stat-card__icon customer-stat-card__icon--cancelled">
                    <i class="fas fa-ban"></i>
                </div>
                <div>
                    <p class="customer-stat-card__label">{{ __('all.cancelled') }}</p>
                    <p class="customer-stat-card__value">{{ $cancelledCount }}</p>
                </div>
            </article>
        </div>
    </div>
</section>

<section class="page-section">
    <div class="container mx-auto px-4">
        <h2 class="section-title mb-2">{{ __('all.quick_actions') }}</h2>
        <p class="section-subtitle mb-10">{{ __('all.here_are_some_things_you_can_do') }}</p>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <a href="{{ route('customer.mybooking') }}" class="page-card customer-action-card fade-in">
                <div class="page-card__icon"><i class="fas fa-ticket"></i></div>
                <h3 class="page-card__title">{{ __('all.view_my_bookings') }}</h3>
                <p class="page-card__text">{{ __('customer_sidebar.My Tickets') }}</p>
            </a>
            <a href="{{ route('customer.by_route') }}" class="page-card customer-action-card fade-in">
                <div class="page-card__icon"><i class="fas fa-bus"></i></div>
                <h3 class="page-card__title">{{ __('all.search_buses') }}</h3>
                <p class="page-card__text">{{ __('customer_sidebar.Bus Route') }}</p>
            </a>
            <a href="{{ route('customer.profile') }}" class="page-card customer-action-card fade-in">
                <div class="page-card__icon"><i class="fas fa-user"></i></div>
                <h3 class="page-card__title">{{ __('all.profile') }}</h3>
                <p class="page-card__text">{{ __('all.profile_information') }}</p>
            </a>
        </div>
    </div>
</section>
@endsection
