@php
    $paymentLayout = auth()->check() && auth()->user()->isCustomer() && request()->routeIs('customer.*')
        ? 'customer.app'
        : 'test.layouts.marketing';
@endphp
@extends($paymentLayout)

@section('title', (__('all.payment_failed') ?? 'Payment Failed') . ' — ' . __('all.highlink_isgc'))

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => __('customer_sidebar.Round Trip'),
        'title' => __('all.round_trip_payment_failed_title'),
        'subtitle' => __('all.payment_failed_message'),
        'image' => 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?w=1200&q=80',
    ])
@endsection

@section('content')
<section class="page-section page-section--alt">
    <div class="container mx-auto px-4 max-w-3xl">
        @include('test.partials.payment_failed_body', [
            'retryUrl' => round_trip_route('checkout'),
            'homeUrl' => route('home'),
            'error' => $error ?? session('error'),
        ])
    </div>
</section>
@endsection
