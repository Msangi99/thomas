@php
    $paymentLayout = auth()->check() && auth()->user()->isCustomer() && request()->routeIs('customer.*')
        ? 'customer.app'
        : 'test.layouts.marketing';
@endphp
@extends($paymentLayout)

@section('title', 'Payment Processing — ' . __('all.highlink_isgc'))

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => __('all.highlink_isgc'),
        'title' => 'Payment Processing',
        'subtitle' => 'Your payment is being confirmed. This usually takes a few seconds.',
        'image' => 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?w=1200&q=80',
    ])
@endsection

@section('content')
<section class="page-section page-section--alt">
    <div class="container mx-auto px-4 max-w-2xl">
        <div class="payment-result-panel fade-in">
            <div class="payment-result-panel__body">
                <div class="payment-result-status payment-result-status--processing">
                    <div class="payment-result-status__icon" aria-hidden="true">
                        <i class="fas fa-spinner fa-spin"></i>
                    </div>
                    <h2 class="payment-result-status__title">Confirming your payment</h2>
                    <p class="payment-result-status__subtitle">Please wait while we verify your transaction. This page will refresh automatically.</p>
                </div>
                <div class="payment-result-footer">
                    <p>If it does not refresh, <a href="{{ url()->current() }}">click here to check again</a>.</p>
                </div>
            </div>
        </div>
    </div>
</section>
<meta http-equiv="refresh" content="3;url={{ url()->current() }}">
@endsection
