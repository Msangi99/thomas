{{--
  Test mode: single checkout path (no gateway tabs). Posts same verify route as Mixx tab with payment_method=mixx;
  backend ignores gateways when Settings → Test Mode is on.

  Expects: $verifyAction (URL string), $amount (numeric)
  Optional: $langNs (default customer/busroot), $formIdSuffix (unique when multiple on page)
--}}
@php
    $langNs = $langNs ?? 'customer/busroot';
    $suffix = $formIdSuffix ?? '';
    $formId = 'test-mode-checkout-form' . $suffix;
    $termsId = 'test_mode_payment_terms' . $suffix;
@endphp
<div class="bg-white rounded-xl shadow-md overflow-hidden">
    <div class="p-6">
        <div class="p-4 bg-amber-50 border border-amber-200 rounded-lg mb-4">
            <p class="text-sm font-semibold text-amber-900">Test mode</p>
            <p class="text-sm text-amber-800 mt-1">No real payment is charged. Use the summary on the right, then pay below to complete your booking.</p>
        </div>
        <form id="{{ $formId }}" action="{{ $verifyAction }}" method="POST" class="space-y-4">
            @csrf
            <input type="hidden" name="payment_method" value="mixx">
            <input type="hidden" name="amount" value="{{ $amount }}">
            <div class="flex items-start">
                <div class="flex items-center h-5">
                    <input id="{{ $termsId }}" name="payment_term_0" type="checkbox" value="1" checked
                        class="focus:ring-blue-500 h-4 w-4 text-blue-600 border-gray-300 rounded">
                </div>
                <div class="ml-3 text-sm">
                    <label for="{{ $termsId }}" class="font-medium text-gray-700">
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

<script>
(function () {
    var form = document.getElementById(@json($formId));
    if (!form || form.dataset.testModeBound === '1') return;
    form.dataset.testModeBound = '1';
    var needPhoneMsg = @json(__($langNs . '.enter_mobile_number'));
    form.addEventListener('submit', function (event) {
        event.preventDefault();
        var codeEl = document.getElementById('countrycode');
        var phoneEl = document.getElementById('contactNumber');
        if (!phoneEl) {
            form.submit();
            return;
        }
        var code = codeEl ? codeEl.value : '';
        var phone = typeof normalizePhoneTo255 === 'function'
            ? normalizePhoneTo255(phoneEl.value)
            : phoneEl.value;
        var emailEl = document.getElementById('contactEmail');
        var email = emailEl ? emailEl.value.trim() : '';

        if (!phone) {
            alert(needPhoneMsg);
            return;
        }

        function appendHidden(name, value) {
            var input = document.createElement('input');
            input.type = 'hidden';
            input.name = name;
            input.value = value;
            form.appendChild(input);
        }
        appendHidden('countrycode', code);
        appendHidden('contactNumber', phone);
        appendHidden('contactEmail', email);

        form.submit();
    });
})();
</script>
