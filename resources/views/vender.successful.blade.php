@extends('vender.app')

@section('title', (__('all.payment_successful') ?? 'Payment Successful') . ' — ' . __('all.highlink_isgc'))

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => __('all.highlink_isgc'),
        'title' => __('all.payment_successful') ?? 'Payment Successful',
        'subtitle' => __('all.thank_you_booking') ?? 'Your ticket has been confirmed.',
    ])
@endsection

@section('content')
<section class="page-section page-section--alt">
    <div class="container mx-auto px-4 max-w-4xl">
        @include('test.partials.payment_success_one_way')
    </div>
</section>
@endsection
