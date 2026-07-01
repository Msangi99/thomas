@extends('vender.app')

@section('title', __('vender/busroot.deposit_failed'))

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => __('all.highlink_isgc'),
        'title' => __('vender/busroot.deposit_failed'),
        'subtitle' => __('vender/busroot.deposit_issue_message'),
    ])
@endsection

@section('content')
<section class="page-section page-section--alt">
    <div class="container mx-auto px-4 max-w-2xl">
        <div class="vendor-panel fade-in">
            <div class="vendor-panel__body text-center">
                <div class="payment-result-status payment-result-status--error mb-6">
                    <div class="payment-result-status__icon" aria-hidden="true">
                        <i class="fas fa-times"></i>
                    </div>
                    <h2 class="payment-result-status__title">{{ __('vender/busroot.deposit_failed') }}</h2>
                    <p class="payment-result-status__subtitle">{{ session('error', __('vender/busroot.deposit_processing_error')) }}</p>
                </div>
                <p class="text-gray-600 mb-6">{{ __('vender/busroot.deposit_issue_message') }}</p>
                <div class="flex flex-wrap gap-3 justify-center">
                    <a href="{{ route('vender.wallet.deposit') }}" class="page-btn">
                        <i class="fas fa-rotate-left" aria-hidden="true"></i> {{ __('vender/busroot.try_again') }}
                    </a>
                    <a href="{{ route('vender.index') }}" class="page-btn page-btn--outline">
                        <i class="fas fa-gauge-high" aria-hidden="true"></i> {{ __('vender/busroot.go_to_dashboard') }}
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
