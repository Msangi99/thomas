@php
    $paymentLayout = auth()->check() && auth()->user()->isCustomer() && request()->routeIs('customer.*')
        ? 'customer.app'
        : 'test.layouts.marketing';
    $retryUrl = url()->previous();
    if ($retryUrl === url()->current()) {
        $retryUrl = route('routes');
    }
@endphp
@extends($paymentLayout)

@section('title', (__('all.payment_failed') ?? 'Payment Failed') . ' — ' . __('all.highlink_isgc'))

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => __('all.highlink_isgc'),
        'title' => __('all.payment_failed') ?? 'Payment Failed',
        'subtitle' => __('all.payment_failed_message') ?? 'Your payment could not be completed.',
        'image' => 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?w=1200&q=80',
    ])
@endsection

@section('content')
<section class="page-section page-section--alt">
    <div class="container mx-auto px-4 max-w-3xl">
        @include('test.partials.payment_failed_body', [
            'retryUrl' => $retryUrl,
            'homeUrl' => route('home'),
        ])
    </div>
</section>
@endsection
