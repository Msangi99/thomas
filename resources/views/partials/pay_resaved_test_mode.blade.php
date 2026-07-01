<div class="booking-alert booking-alert--info mb-4" role="status">
    <p class="font-semibold mb-1">Test mode</p>
    <p class="text-sm m-0">No real payment is charged. Confirm below to mark this reserved ticket as paid.</p>
</div>
<form action="{{ route('resaved.test.pay') }}" method="POST" class="space-y-4">
    @csrf
    <input type="hidden" name="booking_id" value="{{ $booking->id }}">
    <label class="inline-extras-form__check">
        <input id="resaved_test_terms" name="payment_term_0" type="checkbox" value="1" checked>
        <span>
            {{ __('customer/busroot.i_accept') }}
            <a href="{{ route('ticket.purchase') }}" target="_blank" rel="noopener">{{ __('customer/busroot.terms_and_conditions') }}</a>
        </span>
    </label>
    <button type="submit" class="page-btn w-full">
        <i class="fas fa-lock" aria-hidden="true"></i>
        {{ __('customer/busroot.proceed_to_pay') }}
    </button>
</form>
