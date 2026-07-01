@extends('vender.app')

@section('title', __('vender/busroot.deposit_successful'))

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => __('all.highlink_isgc'),
        'title' => __('vender/busroot.deposit_successful'),
        'subtitle' => __('vender/busroot.deposit_processed_successfully'),
    ])
@endsection

@section('content')
<section class="page-section page-section--alt">
    <div class="container mx-auto px-4 max-w-2xl">
        <div class="vendor-panel fade-in">
            <div class="vendor-panel__body text-center">
                <div class="payment-result-status payment-result-status--success mb-6">
                    <div class="payment-result-status__icon" aria-hidden="true">
                        <i class="fas fa-check"></i>
                    </div>
                    <h2 class="payment-result-status__title">{{ __('vender/busroot.deposit_successful') }}</h2>
                    <p class="payment-result-status__subtitle">{{ session('success', __('vender/busroot.deposit_processed_successfully')) }}</p>
                </div>
                <p class="text-gray-600 mb-6">{{ __('vender/busroot.deposit_thank_you_message') }}</p>
                <a href="{{ route('vender.index') }}" class="page-btn">
                    <i class="fas fa-gauge-high" aria-hidden="true"></i> {{ __('vender/busroot.go_to_dashboard') }}
                </a>
            </div>
        </div>
    </div>
</section>
@endsection
