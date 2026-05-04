{{-- Resaved ticket: test mode completes via TestPaymentController (same settlement as normal paid booking). --}}
@php
    $langNs = 'customer/busroot';
@endphp
<div class="bg-white rounded-xl shadow-md overflow-hidden">
    <div class="p-6">
        <div class="p-4 bg-amber-50 border border-amber-200 rounded-lg mb-4">
            <p class="text-sm font-semibold text-amber-900">Test mode</p>
            <p class="text-sm text-amber-800 mt-1">No real payment is charged. Confirm below to mark this resaved ticket as paid.</p>
        </div>
        <form action="{{ route('resaved.test.pay') }}" method="POST" class="space-y-4">
            @csrf
            <input type="hidden" name="booking_id" value="{{ $booking->id }}">
            <div class="flex items-start">
                <div class="flex items-center h-5">
                    <input id="resaved_test_terms" name="payment_term_0" type="checkbox" value="1" checked
                        class="focus:ring-blue-500 h-4 w-4 text-blue-600 border-gray-300 rounded">
                </div>
                <div class="ml-3 text-sm">
                    <label for="resaved_test_terms" class="font-medium text-gray-700">
                        {{ __($langNs . '.i_accept') }}
                        <a href="{{ route('ticket.purchase') }}" class="text-blue-600 hover:text-blue-500">{{ __($langNs . '.terms_and_conditions') }}</a>
                    </label>
                </div>
            </div>
            <button type="submit"
                class="w-full mt-2 py-3 px-6 bg-gradient-to-r from-red-600 to-red-800 hover:from-red-700 hover:to-red-900 text-white font-medium rounded-lg shadow-md transition-all duration-300 flex items-center justify-center">
                <i class="fas fa-lock mr-2"></i>
                {{ __($langNs . '.proceed_to_pay') }}
            </button>
        </form>
    </div>
</div>
