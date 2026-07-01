@php
    $retryUrl = $retryUrl ?? url()->previous();
    $homeUrl = $homeUrl ?? route('home');
    $errorMessage = $error ?? session('error') ?? null;
@endphp

<div class="payment-result-panel fade-in">
    <div class="payment-result-panel__body">
        <div class="payment-result-status payment-result-status--error">
            <div class="payment-result-status__icon" aria-hidden="true">
                <i class="fas fa-times"></i>
            </div>
            <h2 class="payment-result-status__title">{{ __('all.payment_failed') ?? 'Payment Failed' }}</h2>
            <p class="payment-result-status__subtitle">{{ __('all.payment_failed_message') ?? 'We could not process your payment. No money has been deducted.' }}</p>
        </div>

        @if ($errorMessage)
            <div class="customer-alert customer-alert--error mb-6" role="alert">
                <i class="fas fa-exclamation-circle mr-2"></i>{{ $errorMessage }}
            </div>
        @endif

        <div class="payment-result-card mb-6">
            <h3 class="payment-result-card__title">
                <i class="fas fa-circle-info" aria-hidden="true"></i>
                {{ __('all.what_went_wrong') ?? 'What might have gone wrong?' }}
            </h3>
            <ul class="payment-result-error-list">
                <li><i class="fas fa-times-circle"></i><span>{{ __('all.payment_fail_reason_funds') ?? 'Insufficient funds or incorrect payment details' }}</span></li>
                <li><i class="fas fa-times-circle"></i><span>{{ __('all.payment_fail_reason_network') ?? 'Network or connectivity issues' }}</span></li>
                <li><i class="fas fa-times-circle"></i><span>{{ __('all.payment_fail_reason_auth') ?? 'Payment authorization failed or was cancelled' }}</span></li>
            </ul>

            @isset($data)
                <div class="customer-alert customer-alert--info mt-4" role="status">
                    <strong>{{ __('all.transaction_id') ?? 'Transaction Reference' }}:</strong>
                    {{ $data->transaction_ref_id ?? 'N/A' }}
                </div>
            @endisset
        </div>

        <div class="payment-result-actions">
            <a href="{{ $retryUrl }}" class="page-btn">
                <i class="fas fa-rotate-left" aria-hidden="true"></i>
                {{ __('all.retry_payment') ?? 'Retry Payment' }}
            </a>
            <a href="{{ $homeUrl }}" class="page-btn page-btn--outline">
                <i class="fas fa-home" aria-hidden="true"></i>
                {{ __('all.return_home') ?? 'Return Home' }}
            </a>
        </div>

        <div class="payment-result-footer mt-4">
            <p>{{ __('all.need_help') ?? 'Need help?' }}
                <a href="tel:+255755879793">+255 755 879 793</a>
                ·
                <a href="mailto:support@hisgc.co.tz">support@hisgc.co.tz</a>
            </p>
        </div>
    </div>
</div>
