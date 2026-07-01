@extends('test.layouts.marketing')

@section('title', __('all.booking_verification_title') . ' — ' . __('all.highlink_isgc'))

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => __('all.booking_information'),
        'title' => __('all.booking_verification_title'),
        'subtitle' => __('all.booking_verification_subtitle'),
        'image' => 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?w=1200&q=80',
    ])
@endsection

@section('content')
<section class="page-section page-section--alt">
    <div class="container mx-auto px-4 max-w-md">
        <div class="customer-panel fade-in">
            <div class="customer-panel__body">
                @if (session('status'))
                    <div class="customer-alert customer-alert--success mb-4" role="status">{{ session('status') }}</div>
                @endif

                @if (session('email'))
                    <p class="text-sm text-gray-600 mb-4">
                        {{ __('all.email_or_phone_number') }}: <strong>{{ session('email') }}</strong>
                    </p>
                @endif

                <form method="POST" action="{{ route('booking.verification.verify') }}" class="space-y-4">
                    @csrf

                    <div>
                        <label for="verification_code" class="block text-sm font-semibold text-gray-700 mb-1.5">
                            {{ __('all.verification_code') }}
                        </label>
                        <input id="verification_code" type="text"
                            class="page-input text-center tracking-widest text-lg @error('verification_code') border-red-400 @enderror"
                            name="verification_code" value="{{ old('verification_code') }}" required
                            maxlength="6" pattern="[0-9]{6}" placeholder="123456" inputmode="numeric">
                        @error('verification_code')
                            <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                        @enderror
                    </div>

                    <button type="submit" class="page-btn w-full">
                        <i class="fas fa-check" aria-hidden="true"></i> {{ __('all.verify_and_view_bookings') }}
                    </button>
                </form>

                <div class="mt-6 pt-4 border-t border-gray-200 text-center space-y-3">
                    <form method="POST" action="{{ route('booking.verification.resend') }}">
                        @csrf
                        <button type="submit" class="text-sm font-semibold" style="color:var(--home-primary)">
                            {{ __('all.resend_verification_code') }}
                        </button>
                    </form>
                    <a href="{{ route('info') }}" class="page-btn page-btn--outline w-full">
                        {{ __('all.back_to_booking_search') }}
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function () {
    const codeInput = document.getElementById('verification_code');
    if (codeInput) {
        codeInput.focus();
        codeInput.addEventListener('input', function () {
            if (this.value.length === 6) {
                this.form.requestSubmit();
            }
        });
    }
});
</script>
@endpush
