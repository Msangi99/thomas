@extends('vender.app')

@section('title', (__('all.payment_failed') ?? 'Payment Failed') . ' — ' . __('all.highlink_isgc'))

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => __('all.highlink_isgc'),
        'title' => __('all.payment_failed') ?? 'Payment Failed',
        'subtitle' => __('all.payment_failed_message') ?? 'We could not process your payment.',
    ])
@endsection

@section('content')
<section class="page-section page-section--alt">
    <div class="container mx-auto px-4 max-w-4xl">
        @include('test.partials.payment_failed_body', [
            'retryUrl' => url()->previous(),
            'homeUrl' => route('vender.index'),
        ])
    </div>
</section>
@endsection
