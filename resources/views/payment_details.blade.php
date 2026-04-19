@extends('test.ap')

@section('content')
    <section class="bg-gradient-to-b from-gray-50 to-gray-100 py-8 px-4 sm:px-6 lg:px-8">
        <div class="max-w-6xl mx-auto">
            <!-- Header Section -->
            <section class="bg-gradient-to-b from-gray-50 to-gray-100 py-8 px-4 sm:px-6 lg:px-8">
                <div class="max-w-6xl mx-auto">
                    <!-- Header Section -->
                    <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6 gap-4">
                        <div>
                            <h2 class="text-2xl font-bold text-gray-900">{{ __('all.complete_your_payment') }}</h2>
                        </div>
                        <div class="text-sm text-white bg-red-600 px-4 py-2 rounded-lg shadow-sm flex items-center">
                            <i class="fas fa-clock mr-2"></i>
                            <span>{{ __('all.your_session_expires_in') }} <span id="minutes">06</span> {{ __('all.mins') }}
                                <span id="seconds">40</span> {{ __('all.secs') }}</span>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
                        <!-- Left Column - Payment Content -->
                        <div class="lg:col-span-2 space-y-6">
                            <!-- Contact Details Card -->
                            <div class="bg-white rounded-xl shadow-md overflow-hidden">
                                <div class="p-6">
                                    <h3 class="text-lg font-semibold text-gray-800 mb-2">{{ __('all.contact_details') }}
                                    </h3>
                                    <p class="text-sm text-gray-600 mb-4">{{ __('all.fill_traveler_details') }}</p>

                                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                        <!-- Country Code -->
                                        <div>
                                            <label for="countrycode"
                                                class="block text-sm font-medium text-gray-700 mb-1">{{ __('all.country_code') }}</label>
                                            <select id="countrycode" onchange="setPhoneMaxLength()"
                                                class="w-full px-4 text-gray-600 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                                                <option value="">{{ __('all.select_country_code') }}</option>
                                                <option value="+255" selected>{{ __('all.tz_code') }}</option>
                                            </select>
                                        </div>

                                        <!-- Mobile Number -->
                                        <div>
                                            <label for="contactNumber"
                                                class="block text-sm font-medium text-gray-700 mb-1">{{ __('all.mobile_number') }}</label>
                                            <input type="text" id="contactNumber" maxlength="12" onkeyup="CheckMobLen(this)"
                                                class="w-full text-black px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 onlydigits"
                                                placeholder="{{ __('all.enter_mobile_number') }}" required>
                                        </div>

                                        <!-- Email -->
                                        <div class="md:col-span-2">
                                            <label for="contactEmail"
                                                class="block text-sm font-medium text-gray-700 mb-1">{{ __('all.email_address') }}</label>
                                            <input type="email" id="contactEmail" maxlength="50" autocomplete="off"
                                                class="w-full text-black px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                                                placeholder="{{ __('all.enter_email_address') }}">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Payment Options Card -->
                            <div class="bg-white rounded-xl shadow-md overflow-hidden">
                                <div class="p-6">
                                    <h3 class="text-lg font-semibold text-gray-800 mb-4">{{ __('all.payment_options') }}
                                    </h3>

                                    <div class="flex flex-col md:flex-row gap-6">
                                        <!-- Payment Methods Sidebar -->
                                        <div class="md:w-1/3">
                                            <div class="space-y-2" role="tablist"
                                                aria-label="{{ __('all.payment_methods') }}">
                                                <button type="button"
                                                    class="w-full text-left px-4 py-3 rounded-lg bg-blue-100 text-blue-700 font-medium"
                                                    id="tab1-btn" data-bs-toggle="tab" data-bs-target="#tab1" role="tab"
                                                    aria-controls="tab1" aria-selected="true">
                                                    <i class="fas fa-mobile-alt mr-2"></i> {{ __('all.mixx_by_yas') }}
                                                </button>
                                                <button type="button"
                                            class="w-full text-left px-4 py-3 rounded-lg bg-white hover:bg-gray-100 text-blue-700"
                                                    id="tab2-btn" data-bs-toggle="tab" data-bs-target="#tab2" role="tab"
                                                    aria-controls="tab2">
                                                    <i class="fas fa-credit-card mr-2"></i> {{ __('all.dpo_payment') }}
                                                </button>
                                                <button type="button"
                                            class="w-full text-left px-4 py-3 rounded-lg bg-white hover:bg-gray-100 text-blue-700"
                                                    id="tab3-btn" data-bs-toggle="tab" data-bs-target="#tab3" role="tab"
                                                    aria-controls="tab3">
                                                    <i class="fas fa-wallet mr-2"></i> {{ __('all.clickpesa_payment') }}
                                                </button>
                                                <button type="button"
                                            class="w-full text-left px-4 py-3 rounded-lg bg-white hover:bg-gray-100 text-blue-700"
                                                    id="tab4-btn" data-bs-toggle="tab" data-bs-target="#tab4" role="tab"
                                                    aria-controls="tab4">
                                                    <i class="fas fa-sim-card mr-2"></i> Airtel Money
                                                </button>
                                            </div>
                                        </div>

                                        <!-- Payment Method Content -->
                                        <div class="md:w-2/3">
                                            <div class="tab-content">
                                                <!-- Mixx By Yas Payment -->
                                                <div id="tab1" class="tab-pane active" role="tabpanel"
                                                    aria-labelledby="tab1-btn">
                                                    <form id="tigo" action="{{ route('verify') }}" method="POST">
                                                        @csrf
                                                        <input type="hidden" name="payment_method" value="mixx">
                                                        <div class="space-y-4">
                                                            <div class="p-4 bg-blue-50 rounded-lg">
                                                                <p class="text-sm text-gray-700 mb-1">
                                                                    {{ __('all.session_expiry_warning') }}</p>
                                                            </div>

                                                            <p class="text-gray-700">{{ __('all.enter_yas_mobile_number') }}
                                                            </p>

                                                            <div>
                                                                <label for="paymentContact"
                                                                    class="block text-sm font-medium text-gray-700 mb-1">{{ __('all.mobile_number') }}</label>
                                                                <input type="text" name="payment_contact"
                                                                    id="paymentContact" maxlength="10"
                                                                    class="text-black w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 onlydigits"
                                                                    placeholder="{{ __('all.connected_mobile_number') }}"
                                                                    required>
                                                            </div>

                                                            <input type="hidden" name="amount" id="mixx_amount" value="{{ round($price + $fees, 2) }}">

                                                            <!-- Mixx by Yas Tariff -->
                                                            <div>
                                                                <label class="block text-sm font-medium text-gray-700 mb-1">Mixx by Yas Tariff (TZS)</label>
                                                                <input type="number" id="mixx_tariff" name="tariff_amount" value="0" min="0"
                                                                    class="text-black w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                                                                    placeholder="Enter Mixx by Yas tariff (optional)"
                                                                    oninput="updateTariff(this,'mixx_amount')">
                                                            </div>

                                                            <div class="flex items-start">
                                                                <div class="flex items-center h-5">
                                                                    <input id="payment_term_0" name="payment_term_0"
                                                                        type="checkbox" value="1" checked
                                                                        class="focus:ring-blue-500 h-4 w-4 text-blue-600 border-gray-300 rounded">
                                                                </div>
                                                                <div class="ml-3 text-sm">
                                                                    <label for="payment_term_0"
                                                                        class="font-medium text-gray-700">{{ __('all.i_accept') }}
                                                                        <a href="{{ route('ticket.purchase') }}"
                                                                            class="text-blue-600 hover:text-blue-500">{{ __('all.terms_and_conditions') }}</a></label>
                                                                </div>
                                                            </div>

                                                            <button type="submit"
                                                                class="w-full mt-4 py-3 px-6 bg-gradient-to-r from-red-600 to-red-800 hover:from-red-700 hover:to-red-900 text-white font-medium rounded-lg shadow-md transition-all duration-300 flex items-center justify-center">
                                                                <i class="fas fa-lock mr-2"></i>
                                                                {{ __('all.proceed_to_pay') }}
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>

                                                <!-- DPO Payment -->
                                                <div id="tab2" class="tab-pane" role="tabpanel" aria-labelledby="tab2-btn">
                                                    <form id="dpo" action="{{ route('verify') }}" method="POST">
                                                        @csrf
                                                        <input type="hidden" name="payment_method" value="dpo">
                                                        <div class="space-y-4">
                                                            <div class="p-4 bg-blue-50 rounded-lg">
                                                                <p class="text-sm text-gray-700 mb-1">
                                                                    {{ __('all.session_expiry_warning') }}</p>
                                                            </div>

                                                            <div>
                                                                <label for="dpo_amount_display"
                                                                    class="block text-sm font-medium text-gray-700 mb-1">{{ __('all.amount') }}</label>
                                                                <input type="text" id="dpo_amount_display"
                                                                    value="{{ convert_money($price + $fees) }}" readonly
                                                                    class="text-black w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                                                                    required>
                                                                <input type="hidden" name="amount" id="dpo_amount"
                                                                    value="{{ round($price + $fees, 2) }}">
                                                            </div>

                                                            <!-- <div>
                                                        <label for="first_name" class="block text-sm font-medium text-gray-700 mb-1">{{ __('all.first_name') }}</label>
                                                        <input type="text" name="first_name" id="first_name"
                                                            class="text-black w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                                                            placeholder="{{ __('all.enter_first_name') }}" required>
                                                    </div>

                                                    <div>
                                                        <label for="last_name" class="block text-sm font-medium text-gray-700 mb-1">{{ __('all.last_name') }}</label>
                                                        <input type="text" name="last_name" id="last_name"
                                                            class="text-black w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                                                            placeholder="{{ __('all.enter_last_name') }}" required>
                                                    </div>

                                                    <div>
                                                        <label for="phone" class="block text-sm font-medium text-gray-700 mb-1">{{ __('all.mobile_number') }}</label>
                                                        <input type="text" name="customer_number" id="phone" maxlength="12"
                                                            class="text-black w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 onlydigits"
                                                            placeholder="{{ __('all.enter_mobile_number') }}" required>
                                                    </div>

                                                    <div>
                                                        <label for="email" class="block text-sm font-medium text-gray-700 mb-1">{{ __('all.email_address') }}</label>
                                                        <input type="email" name="customer_email" id="email"
                                                            class="text-black w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                                                            placeholder="{{ __('all.enter_email_address') }}">
                                                    </div> -->

                                                            <div class="flex items-start">
                                                                <div class="flex items-center h-5">
                                                                    <input id="dpo_terms" name="dpo_terms" type="checkbox"
                                                                        value="1" checked
                                                                        class="focus:ring-blue-500 h-4 w-4 text-blue-600 border-gray-300 rounded">
                                                                </div>
                                                                <div class="ml-3 text-sm">
                                                                    <label for="dpo_terms"
                                                                        class="font-medium text-gray-700">{{ __('all.i_accept') }}
                                                                        <a href="{{ route('ticket.purchase') }}"
                                                                            class="text-blue-600 hover:text-blue-500">{{ __('all.terms_and_conditions') }}</a></label>
                                                                </div>
                                                            </div>

                                                            <button type="submit"
                                                                class="w-full mt-4 py-3 px-6 bg-gradient-to-r from-red-600 to-red-800 hover:from-red-700 hover:to-red-900 text-white font-medium rounded-lg shadow-md transition-all duration-300 flex items-center justify-center">
                                                                <i class="fas fa-lock mr-2"></i>
                                                                {{ __('all.proceed_to_pay') }}
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>

                                                <!-- ClickPesa Payment -->
                                                <div id="tab3" class="tab-pane" role="tabpanel" aria-labelledby="tab3-btn">
                                                    <form id="clickpesa" action="{{ route('verify') }}" method="POST">
                                                        @csrf
                                                        <input type="hidden" name="payment_method" value="clickpesa">
                                                        <div class="space-y-4">
                                                            <div class="p-4 bg-blue-50 rounded-lg">
                                                                <p class="text-sm text-gray-700 mb-1">
                                                                    {{ __('all.session_expiry_warning') }}</p>
                                                            </div>

                                                            <!-- M-Pesa Tariff -->
                                                            <div>
                                                                <label class="block text-sm font-medium text-gray-700 mb-1">M-Pesa Tariff (TZS)</label>
                                                                <input type="number" id="mpesa_tariff" name="tariff_amount" value="0" min="0"
                                                                    class="text-black w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                                                                    placeholder="Enter M-Pesa tariff (optional)"
                                                                    oninput="updateTariff(this,'clickpesa_amount')">
                                                            </div>

                                                            <div>
                                                                <label for="clickpesa_amount_display"
                                                                    class="block text-sm font-medium text-gray-700 mb-1">{{ __('all.amount') }}</label>
                                                                <input type="text" id="clickpesa_amount_display"
                                                                    value="{{ convert_money($price + $fees) }}" readonly
                                                                    class="text-black w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                                                                    required>
                                                                <input type="hidden" name="amount" id="clickpesa_amount"
                                                                    value="{{ round($price + $fees, 2) }}">
                                                            </div>

                                                            <div class="flex items-start">
                                                                <div class="flex items-center h-5">
                                                                    <input id="clickpesa_terms" name="clickpesa_terms"
                                                                        type="checkbox" value="1" checked
                                                                        class="focus:ring-blue-500 h-4 w-4 text-blue-600 border-gray-300 rounded">
                                                                </div>
                                                                <div class="ml-3 text-sm">
                                                                    <label for="clickpesa_terms"
                                                                        class="font-medium text-gray-700">{{ __('all.i_accept') }}
                                                                        <a href="{{ route('ticket.purchase') }}"
                                                                            class="text-blue-600 hover:text-blue-500">{{ __('all.terms_and_conditions') }}</a></label>
                                                                </div>
                                                            </div>

                                                            <button type="submit"
                                                                class="w-full mt-4 py-3 px-6 bg-gradient-to-r from-red-600 to-red-800 hover:from-red-700 hover:to-red-900 text-white font-medium rounded-lg shadow-md transition-all duration-300 flex items-center justify-center">
                                                                <i class="fas fa-lock mr-2"></i>
                                                                {{ __('all.proceed_to_pay') }}
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>

                                                <!-- Airtel Money Payment -->
                                                <div id="tab4" class="tab-pane" role="tabpanel" aria-labelledby="tab4-btn">
                                                    <div class="space-y-4">
                                                        <div class="p-4 bg-red-50 rounded-lg border border-red-100">
                                                            <p class="text-sm text-gray-700">Enter your Airtel Money number. A payment prompt will be sent to your phone.</p>
                                                        </div>

                                                        <div>
                                                            <label class="block text-sm font-medium text-gray-700 mb-1">Airtel Money Number</label>
                                                            <input type="text" id="airtel_phone" maxlength="12"
                                                                class="text-black w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 onlydigits"
                                                                placeholder="e.g. 0780000000" required>
                                                        </div>

                                                        <!-- Airtel Money Tariff -->
                                                        <div>
                                                            <label class="block text-sm font-medium text-gray-700 mb-1">Airtel Money Tariff (TZS)</label>
                                                            <input type="number" id="airtel_tariff" value="0" min="0"
                                                                class="text-black w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500"
                                                                placeholder="Enter Airtel Money tariff (optional)"
                                                                oninput="updateAirtelTotal(this)">
                                                        </div>

                                                        <p class="text-sm text-gray-600">Total to pay: <strong id="airtel_total_display">TZS {{ convert_money($price + $fees) }}</strong></p>

                                                        <button type="button" id="airtel_pay_btn"
                                                            class="w-full mt-2 py-3 px-6 bg-gradient-to-r from-red-600 to-red-800 hover:from-red-700 hover:to-red-900 text-white font-medium rounded-lg shadow-md transition-all duration-300 flex items-center justify-center">
                                                            <i class="fas fa-lock mr-2"></i> Pay with Airtel Money
                                                        </button>
                                                        <p id="airtel_status_msg" class="text-sm text-center hidden"></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Right Column - Price Summary -->
                        <div class="bg-white rounded-xl shadow-md overflow-hidden h-fit sticky top-6">
                            <div class="p-6">
                                <h3 class="text-lg font-semibold text-gray-800 mb-4">
                                    <i class="fas fa-receipt mr-2 text-blue-500"></i> {{ __('all.price_summary') }}
                                </h3>

                                <div class="space-y-3 mb-6">
                                    <div class="flex justify-between">
                                        <span class="text-sm text-gray-600">{{ __('all.discount') }}</span>
                                        <span class="text-sm font-medium text-gray-500">{{ __('all.currency_prefix_tzs') }}
                                            {{ number_format($dis, 2) }}</span>
                                    </div>

                                    @if(isset($ins) && $ins > 0)
                                        <div class="flex justify-between">
                                            <span class="text-sm text-gray-600">{{ __('all.insurance') }}</span>
                                            <span class="text-sm font-medium text-gray-500">{{ __('all.currency_prefix_tzs') }}
                                                {{ number_format($ins) }}</span>
                                        </div>
                                    @endif

                                    <div class="flex justify-between">
                                        <span class="text-sm text-gray-600">{{ __('all.system_charge') }}</span>
                                        <span class="text-sm font-medium text-gray-500">{{ __('all.currency_prefix_tzs') }}
                                            {{ convert_money($fees) }}</span>
                                    </div>
                                    @if(($excess_luggage_fee ?? 0) > 0)
                                        <div class="flex justify-between">
                                            <span class="text-sm text-gray-600">{{ __('all.excess_luggage') }}</span>
                                            <span class="text-sm font-medium text-gray-500">
                                                {{ __('all.currency_prefix_tzs') }} {{ convert_money($excess_luggage_fee) }}
                                            </span>
                                        </div>
                                    @endif

                                    <div class="flex justify-between">
                                        <span class="text-sm text-gray-600">{{ __('all.bus_fare') }}</span>
                                        <span class="text-sm font-medium text-gray-500">{{ __('all.currency_prefix_tzs') }}
                                            {{ convert_money($price - $ins) }}</span>
                                    </div>

                                    <div class="flex justify-between" id="tariff-summary-row" style="display:none!important">
                                        <span class="text-sm text-gray-600">Payment Tariff</span>
                                        <span class="text-sm font-medium text-orange-500" id="tariff-summary-value">TZS 0</span>
                                    </div>

                                    <div class="border-t border-gray-200 pt-2 mt-2 flex justify-between">
                                        <span class="text-base font-semibold">{{ __('all.total_payable') }}</span>
                                        <span class="text-base font-bold text-blue-600" id="total-payable-display">
                                            {{ __('all.currency_prefix_tzs') }} {{ convert_money($price + $fees) }}
                                        </span>
                                    </div>
                                </div>

                                <div class="p-4 bg-blue-50 rounded-lg">
                                    <p class="flex items-center text-sm text-blue-700">
                                        <i class="fas fa-shield-alt mr-2"></i> {{ __('all.secure_ssl_payment') }}
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <script>
                @include('partials.tz_phone_normalize_js')

                // Timer countdown functionality
                function startTimer(duration, displayMinutes, displaySeconds) {
                    let timer = duration, minutes, seconds;
                    setInterval(function () {
                        minutes = parseInt(timer / 60, 10);
                        seconds = parseInt(timer % 60, 10);

                        minutes = minutes < 10 ? "0" + minutes : minutes;
                        seconds = seconds < 10 ? "0" + seconds : seconds;

                        displayMinutes.textContent = minutes;
                        displaySeconds.textContent = seconds;

                        if (--timer < 0) {
                            timer = duration;
                        }
                    }, 1000);
                }

                window.onload = function () {
                    const fiveMinutes = 60 * 6 + 40, // 6 minutes and 40 seconds
                        displayMinutes = document.querySelector('#minutes'),
                        displaySeconds = document.querySelector('#seconds');
                    startTimer(fiveMinutes, displayMinutes, displaySeconds);
                };

                // Form submission handler for Tigo form
                document.getElementById('tigo').addEventListener('submit', function (event) {
                    event.preventDefault();

                    // Get contact details
                    const code = document.getElementById('countrycode').value;
                    const phone = normalizePhoneTo255(document.getElementById('contactNumber').value);
                    const email = document.getElementById('contactEmail').value.trim();

                    if (!phone) {
                        alert('Please enter phone number');
                        return;
                    }

                    var paymentContactEl = document.getElementById('paymentContact');
                    if (paymentContactEl) {
                        paymentContactEl.value = normalizePhoneTo255(paymentContactEl.value);
                    }

                    // Create hidden inputs
                    const codeInput = document.createElement('input');
                    codeInput.type = 'hidden';
                    codeInput.name = 'countrycode';
                    codeInput.value = code;

                    const phoneInput = document.createElement('input');
                    phoneInput.type = 'hidden';
                    phoneInput.name = 'contactNumber';
                    phoneInput.value = phone;

                    const emailInput = document.createElement('input');
                    emailInput.type = 'hidden';
                    emailInput.name = 'contactEmail';
                    emailInput.value = email;

                    // Append to form
                    this.appendChild(codeInput);
                    this.appendChild(phoneInput);
                    this.appendChild(emailInput);

                    // Submit form
                    this.submit();
                });

                // Form submission handler for DPO form
                document.getElementById('dpo').addEventListener('submit', function (event) {
                    event.preventDefault();

                    // Get contact details
                    const code = document.getElementById('countrycode').value;
                    const phone = normalizePhoneTo255(document.getElementById('contactNumber').value);
                    const email = document.getElementById('contactEmail').value.trim();

                    if (!phone) {
                        alert('Please enter phone number');
                        return;
                    }

                    // Create hidden inputs
                    const codeInput = document.createElement('input');
                    codeInput.type = 'hidden';
                    codeInput.name = 'countrycode';
                    codeInput.value = code;

                    const phoneInput = document.createElement('input');
                    phoneInput.type = 'hidden';
                    phoneInput.name = 'contactNumber';
                    phoneInput.value = phone;

                    const emailInput = document.createElement('input');
                    emailInput.type = 'hidden';
                    emailInput.name = 'contactEmail';
                    emailInput.value = email;

                    // Append to form
                    this.appendChild(codeInput);
                    this.appendChild(phoneInput);
                    this.appendChild(emailInput);

                    // Submit form
                    this.submit();
                });

                // Form submission handler for ClickPesa form
                document.getElementById('clickpesa').addEventListener('submit', function (event) {
                    event.preventDefault();

                    // Get contact details
                    const code = document.getElementById('countrycode').value;
                    const phone = normalizePhoneTo255(document.getElementById('contactNumber').value);
                    const email = document.getElementById('contactEmail').value.trim();

                    if (!phone) {
                        alert('Please enter phone number');
                        return;
                    }

                    // Create hidden inputs
                    const codeInput = document.createElement('input');
                    codeInput.type = 'hidden';
                    codeInput.name = 'countrycode';
                    codeInput.value = code;

                    const phoneInput = document.createElement('input');
                    phoneInput.type = 'hidden';
                    phoneInput.name = 'contactNumber';
                    phoneInput.value = phone;

                    const emailInput = document.createElement('input');
                    emailInput.type = 'hidden';
                    emailInput.name = 'contactEmail';
                    emailInput.value = email;

                    // Append to form
                    this.appendChild(codeInput);
                    this.appendChild(phoneInput);
                    this.appendChild(emailInput);

                    // Submit form
                    this.submit();
                });

                // Tab functionality
                document.querySelectorAll('[role="tablist"] button').forEach(button => {
                    button.addEventListener('click', () => {
                        // Remove active states
                        document.querySelectorAll('[role="tablist"] button').forEach(btn => {
                            btn.classList.remove('bg-blue-100', 'text-blue-700', 'font-medium');
                            btn.classList.add('bg-white', 'text-blue-700', 'hover:bg-gray-100');
                        });
                        document.querySelectorAll('.tab-pane').forEach(pane => {
                            pane.classList.remove('active');
                        });

                        // Add active states
                        button.classList.add('bg-blue-100', 'text-blue-700', 'font-medium');
                        button.classList.remove('bg-white', 'hover:bg-gray-100');
                        document.querySelector(button.dataset.bsTarget).classList.add('active');

                        // Refresh tariff summary for newly active tab
                        const activePane = document.querySelector(button.dataset.bsTarget);
                        const tariffInput = activePane ? activePane.querySelector('[name="tariff_amount"]') : null;
                        if (tariffInput) {
                            const amtInput = activePane.querySelector('[name="amount"]');
                            if (amtInput) updateTariff(tariffInput, amtInput.id);
                        } else {
                            // No tariff for this tab (e.g. DPO card) — reset summary
                            document.getElementById('tariff-summary-row').style.display = 'none';
                            document.getElementById('total-payable-display').textContent =
                                'TZS ' + baseTotal.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2});
                        }
                    });
                });

                // ---- Airtel Money handler ----
                document.getElementById('airtel_pay_btn').addEventListener('click', function () {
                    const phone  = document.getElementById('airtel_phone').value.trim();
                    const tariff = parseFloat(document.getElementById('airtel_tariff').value) || 0;
                    const total  = baseTotal + tariff;
                    const phone1 = document.getElementById('contactNumber').value.trim();
                    const bookingCode = ''; // booking_code not yet created at this stage; server will use session

                    if (!phone) { alert('Please enter your Airtel Money phone number'); return; }

                    this.disabled = true;
                    this.textContent = 'Processing…';
                    const statusEl = document.getElementById('airtel_status_msg');
                    statusEl.classList.remove('hidden');
                    statusEl.textContent = 'Sending payment request…';
                    statusEl.className = 'text-sm text-center text-blue-600';

                    fetch('{{ route("airtel.booking.payment") }}', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json', 'X-CSRF-TOKEN': '{{ csrf_token() }}' },
                        body: JSON.stringify({
                            amount: Math.round(total),
                            phone_number: normalizePhoneTo255(phone),
                            contact_number: normalizePhoneTo255(phone1 || phone),
                            contact_email: document.getElementById('contactEmail').value.trim(),
                            booking_code: bookingCode,
                            tariff_amount: tariff,
                        })
                    })
                    .then(r => r.json())
                    .then(data => {
                        if (data.status === 'success') {
                            statusEl.textContent = data.message || 'Prompt sent! Approve on your phone.';
                            statusEl.className = 'text-sm text-center text-green-600';
                        } else {
                            statusEl.textContent = data.message || 'Payment failed. Please try again.';
                            statusEl.className = 'text-sm text-center text-red-600';
                            document.getElementById('airtel_pay_btn').disabled = false;
                            document.getElementById('airtel_pay_btn').textContent = 'Pay with Airtel Money';
                        }
                    })
                    .catch(() => {
                        statusEl.textContent = 'Network error. Please try again.';
                        statusEl.className = 'text-sm text-center text-red-600';
                        document.getElementById('airtel_pay_btn').disabled = false;
                        document.getElementById('airtel_pay_btn').innerHTML = '<i class="fas fa-lock mr-2"></i> Pay with Airtel Money';
                    });
                });

                function updateAirtelTotal(input) {
                    const tariff = parseFloat(input.value) || 0;
                    const total  = baseTotal + tariff;
                    document.getElementById('airtel_total_display').textContent =
                        'TZS ' + total.toLocaleString(undefined, {minimumFractionDigits:2,maximumFractionDigits:2});
                    // Also update tariff summary
                    const row   = document.getElementById('tariff-summary-row');
                    const valEl = document.getElementById('tariff-summary-value');
                    if (tariff > 0) {
                        row.style.cssText = 'display:flex!important';
                        valEl.textContent = 'TZS ' + tariff.toLocaleString(undefined,{minimumFractionDigits:2,maximumFractionDigits:2});
                    } else {
                        row.style.cssText = 'display:none!important';
                    }
                    document.getElementById('total-payable-display').textContent =
                        'TZS ' + total.toLocaleString(undefined,{minimumFractionDigits:2,maximumFractionDigits:2});
                }

                // ---- Tariff helpers ----
                const baseTotal = {{ round($price + $fees, 2) }};

                function updateTariff(input, amountInputId) {
                    const tariff = parseFloat(input.value) || 0;
                    const total  = baseTotal + tariff;

                    // Update price summary
                    const row  = document.getElementById('tariff-summary-row');
                    const valEl = document.getElementById('tariff-summary-value');
                    if (tariff > 0) {
                        row.style.cssText = 'display:flex!important';
                        valEl.textContent = 'TZS ' + tariff.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2});
                    } else {
                        row.style.cssText = 'display:none!important';
                    }
                    document.getElementById('total-payable-display').textContent =
                        'TZS ' + total.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2});

                    // Update hidden amount field for the form
                    const amtEl = document.getElementById(amountInputId);
                    if (amtEl) amtEl.value = Math.round(total);

                    // Update ClickPesa display field if applicable
                    if (amountInputId === 'clickpesa_amount') {
                        const disp = document.getElementById('clickpesa_amount_display');
                        if (disp) disp.value = total.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2});
                    }
                    // Update DPO display field if applicable
                    if (amountInputId === 'dpo_amount') {
                        const disp = document.getElementById('dpo_amount_display');
                        if (disp) disp.value = total.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2});
                    }
                }
            </script>

            <style>
                .tab-pane {
                    display: none;
                }

                .tab-pane.active {
                    display: block;
                    animation: fadeIn 0.3s ease-out;
                }

                @keyframes fadeIn {
                    from {
                        opacity: 0;
                        transform: translateY(10px);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }

                .onlydigits {
                    -moz-appearance: textfield;
                }

                .onlydigits::-webkit-outer-spin-button,
                .onlydigits::-webkit-inner-spin-button {
                    -webkit-appearance: none;
                    margin: 0;
                }
            </style>
@endsection