@php
    $paymentLayout = auth()->check() && auth()->user()->isCustomer() && request()->routeIs('customer.*')
        ? 'customer.app'
        : 'test.layouts.marketing';
@endphp
@extends($paymentLayout)

@section('title', (__('all.payment_successful') ?? 'Payment Successful') . ' — ' . __('all.highlink_isgc'))

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => __('customer_sidebar.Round Trip') ?? 'Round Trip',
        'title' => __('vender/busroot.round_payment_success_title') ?? 'Round Trip Confirmed',
        'subtitle' => __('vender/busroot.round_trip_booking_confirmed') ?? 'Both legs of your journey are booked.',
        'image' => 'https://images.unsplash.com/photo-1570125909232-e097323dccff?w=1200&q=80',
    ])
@endsection

@section('content')
<section class="page-section page-section--alt">
    <div class="container mx-auto px-4 max-w-4xl">
        @include('test.partials.payment_round_success_body')
    </div>
</section>
@endsection
