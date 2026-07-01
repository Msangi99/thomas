@extends('vender.app')

@section('title', __('vender/busroot.round_payment_success_title'))

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => __('all.round_trip'),
        'title' => __('all.round_trip_payment_success_title'),
        'subtitle' => __('all.round_trip_booking_confirmed'),
    ])
@endsection

@section('content')
<section class="page-section page-section--alt">
    <div class="container mx-auto px-4 max-w-4xl">
        @include('test.partials.payment_round_success_body')
    </div>
</section>
@endsection
