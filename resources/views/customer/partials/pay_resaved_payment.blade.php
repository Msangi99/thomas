@php
    $totalPayable = round($price + $fees, 2);
    $canonicalBookingPhone = normalize_tanzania_phone_to_canonical($booking->customer_phone ?? '');
    $defaultPaymentPhone = $canonicalBookingPhone
        ? ('0' . substr($canonicalBookingPhone, 3))
        : ($booking->customer_phone ?? '');
@endphp

<div class="inline-payment inline-payment--resaved" data-resaved-payment>
    <h4 class="inline-payment__heading">
        <i class="fas fa-credit-card" aria-hidden="true"></i> {{ __('customer/busroot.payment_options') }}
    </h4>

    <div class="inline-payment__gateway">
        <div class="inline-payment__layout">
            <div class="inline-payment__tabs" role="tablist" aria-label="{{ __('customer/busroot.payment_methods') }}">
                <button type="button" class="inline-payment__tab inline-payment__tab--active"
                    data-resaved-pay-tab="mixx" role="tab" aria-selected="true">
                    <i class="fas fa-mobile-alt" aria-hidden="true"></i> {{ __('customer/busroot.mixx_by_yas') }}
                </button>
                <button type="button" class="inline-payment__tab"
                    data-resaved-pay-tab="dpo" role="tab" aria-selected="false">
                    <i class="fas fa-credit-card" aria-hidden="true"></i> {{ __('customer/busroot.dpo_payment') }}
                </button>
                <button type="button" class="inline-payment__tab"
                    data-resaved-pay-tab="clickpesa" role="tab" aria-selected="false">
                    <i class="fas fa-wallet" aria-hidden="true"></i> {{ __('customer/busroot.clickpesa_payment') }}
                </button>
            </div>

            <div class="inline-payment__panes">
                {{-- Mixx --}}
                <div class="inline-payment__pane inline-payment__pane--active" data-resaved-pay-pane="mixx" role="tabpanel">
                    <div class="inline-payment__amount-row">
                        <span>{{ __('customer/busroot.total_payable') }}</span>
                        <strong>{{ $currency }} {{ convert_money($totalPayable) }}</strong>
                    </div>
                    <p class="text-sm text-gray-600 mb-3">{{ __('customer/busroot.enter_yas_mobile_number') }}</p>
                    <form action="{{ route('resaved.mix') }}" method="POST" class="resaved-pay-form" data-resaved-form="mixx">
                        @csrf
                        <input type="hidden" name="payment_method" value="mixx">
                        <input type="hidden" name="booking_id" value="{{ $booking->id }}">
                        <input type="hidden" name="amount" value="{{ $totalPayable }}">
                        <input type="hidden" name="payment_contact" class="resaved-phone-hidden">
                        <label class="booking-field__label" for="resaved_mix_phone">{{ __('customer/busroot.mobile_number') }}</label>
                        <input type="tel" id="resaved_mix_phone" maxlength="13" class="page-input resaved-phone-input mb-2"
                            value="{{ old('payment_contact', $defaultPaymentPhone) }}"
                            placeholder="0712345678">
                        <p class="text-xs text-gray-500 mb-4">{{ __('customer/busroot.leave_blank_use_booking_phone') }}</p>
                        <label class="inline-extras-form__check">
                            <input type="checkbox" name="payment_term_0" value="1" checked>
                            <span>{{ __('customer/busroot.i_accept') }}
                                <a href="{{ route('ticket.purchase') }}" target="_blank" rel="noopener">{{ __('customer/busroot.terms_and_conditions') }}</a>
                            </span>
                        </label>
                        <button type="submit" class="page-btn w-full mt-4">
                            <i class="fas fa-lock" aria-hidden="true"></i> {{ __('customer/busroot.proceed_to_pay') }}
                        </button>
                    </form>
                </div>

                {{-- DPO --}}
                <div class="inline-payment__pane" data-resaved-pay-pane="dpo" role="tabpanel" hidden>
                    <div class="inline-payment__amount-row">
                        <span>{{ __('customer/busroot.total_payable') }}</span>
                        <strong>{{ $currency }} {{ convert_money($totalPayable) }}</strong>
                    </div>
                    <form action="{{ route('resaved.pdo') }}" method="POST" class="resaved-pay-form" data-resaved-form="dpo">
                        @csrf
                        <input type="hidden" name="payment_method" value="dpo">
                        <input type="hidden" name="booking_id" value="{{ $booking->id }}">
                        <input type="hidden" name="amount" value="{{ $totalPayable }}">
                        <input type="hidden" name="payment_phone" class="resaved-phone-hidden">
                        <label class="booking-field__label" for="resaved_dpo_phone">{{ __('customer/busroot.mobile_number') }}</label>
                        <input type="tel" id="resaved_dpo_phone" maxlength="13" class="page-input resaved-phone-input mb-2"
                            value="{{ old('payment_phone', $defaultPaymentPhone) }}"
                            placeholder="0712345678">
                        <p class="text-xs text-gray-500 mb-4">{{ __('customer/busroot.leave_blank_use_booking_phone') }}</p>
                        <label class="inline-extras-form__check">
                            <input type="checkbox" name="dpo_terms" value="1" checked>
                            <span>{{ __('customer/busroot.i_accept') }}
                                <a href="{{ route('ticket.purchase') }}" target="_blank" rel="noopener">{{ __('customer/busroot.terms_and_conditions') }}</a>
                            </span>
                        </label>
                        <button type="submit" class="page-btn w-full mt-4">
                            <i class="fas fa-lock" aria-hidden="true"></i> {{ __('customer/busroot.proceed_to_pay') }}
                        </button>
                    </form>
                </div>

                {{-- ClickPesa --}}
                <div class="inline-payment__pane" data-resaved-pay-pane="clickpesa" role="tabpanel" hidden>
                    <div class="inline-payment__amount-row">
                        <span>{{ __('customer/busroot.total_payable') }}</span>
                        <strong>{{ $currency }} {{ convert_money($totalPayable) }}</strong>
                    </div>
                    <form action="{{ route('resaved.clickpesa') }}" method="POST" class="resaved-pay-form" data-resaved-form="clickpesa">
                        @csrf
                        <input type="hidden" name="booking_id" value="{{ $booking->id }}">
                        <input type="hidden" name="amount" value="{{ $totalPayable }}">
                        <input type="hidden" name="payment_phone" class="resaved-phone-hidden">
                        <label class="booking-field__label" for="resaved_clickpesa_phone">{{ __('customer/busroot.mobile_number') }}</label>
                        <input type="tel" id="resaved_clickpesa_phone" maxlength="13" class="page-input resaved-phone-input mb-2"
                            value="{{ old('payment_phone', $defaultPaymentPhone) }}"
                            placeholder="0712345678">
                        <p class="text-xs text-gray-500 mb-4">{{ __('customer/busroot.leave_blank_use_booking_phone') }}</p>
                        <label class="inline-extras-form__check">
                            <input type="checkbox" name="clickpesa_terms" value="1" checked>
                            <span>{{ __('customer/busroot.i_accept') }}
                                <a href="{{ route('ticket.purchase') }}" target="_blank" rel="noopener">{{ __('customer/busroot.terms_and_conditions') }}</a>
                            </span>
                        </label>
                        <button type="submit" class="page-btn w-full mt-4">
                            <i class="fas fa-lock" aria-hidden="true"></i> {{ __('customer/busroot.proceed_to_pay') }}
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
