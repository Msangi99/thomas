@extends('vender.app')

@section('title', __('vender/busroot.round_payment_failed_title'))

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => __('all.round_trip'),
        'title' => __('all.payment_failed'),
        'subtitle' => __('vender/busroot.round_payment_try_again_or_support'),
    ])
@endsection

@section('content')
<section class="page-section page-section--alt">
    <div class="container mx-auto px-4 max-w-4xl">
        @include('test.partials.payment_failed_body', [
            'retryUrl' => route('round.trip.checkout'),
            'homeUrl' => route('vender.index'),
            'error' => $error ?? session('error'),
        ])
    </div>
</section>
@endsection
