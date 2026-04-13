@extends('vender.app')

@section('content')
<div class="container mx-auto py-12">
    <div class="max-w-lg mx-auto bg-white rounded-2xl shadow-xl p-8">
        <h2 class="text-2xl font-bold text-gray-800 mb-6 text-center">
            {{ __('vender/busroot.deposit_to_vendor_wallet') }}
        </h2>
        <p class="text-sm text-gray-600 mb-4 text-center">
            Deposits are credited to your <strong>cash wallet</strong> (used when you sell tickets for cash). Commission from sold bookings stays in your <strong>commission wallet</strong>. You can move amounts between the two on the transactions page. Use <strong>ClickPesa</strong> or PDO as you prefer.
        </p>

        {{-- Success & Error Messages --}}
        @if (session('success'))
            <div class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 mb-4 rounded-lg" role="alert">
                <p>{{ session('success') }}</p>
            </div>
        @endif

        @if (session('error'))
            <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 mb-4 rounded-lg" role="alert">
                <p>{{ session('error') }}</p>
            </div>
        @endif

        {{-- Deposit Form --}}
        <form method="POST" action="{{ route('vender.wallet.processDeposit') }}" class="space-y-5">
            @csrf

            {{-- Amount --}}
            <div>
                <label for="amount" class="block text-sm font-semibold text-gray-700 mb-1">
                    {{ __('vender/busroot.amount') }}
                </label>
                <input id="amount" type="number" name="amount" min="1"
                    value="{{ old('amount') }}"
                    class="w-full rounded-lg border-gray-300 shadow-sm focus:ring-blue-200 h-10 px-2 focus:border-blue-500 @error('amount') border-red-500 @enderror"
                    required autofocus>
                @error('amount')
                    <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                @enderror
            </div>

            {{-- Payment Method --}}
            <div>
                <label for="payment_method" class="block text-sm font-semibold text-gray-700 mb-1">
                    {{ __('vender/busroot.payment_method') }}
                </label>
                <select id="payment_method" name="payment_method" onchange="toggleDepositMethodFields()"
                    class="w-full rounded-lg border-gray-300 shadow-sm focus:ring-blue-200 h-10 px-2 focus:border-blue-500 @error('payment_method') border-red-500 @enderror"
                    required>
                    <option value="">{{ __('vender/busroot.select_method') }}</option>
                    {{-- <option value="tigosecure" {{ old('payment_method') == 'tigosecure' ? 'selected' : '' }}>Tigosecure</option> --}}
                    <option value="clickpesa" {{ old('payment_method') == 'clickpesa' ? 'selected' : '' }}>ClickPesa (mobile money)</option>
                    <option value="pdo" {{ old('payment_method') == 'pdo' ? 'selected' : '' }}>{{ __('vender/busroot.pdo') }}</option>
                </select>
                @error('payment_method')
                    <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                @enderror
            </div>

            <div id="clickpesa-fields" class="space-y-4"
                style="display: {{ old('payment_method') == 'clickpesa' ? 'block' : 'none' }};">
                <div>
                    <label for="deposit_phone" class="block text-sm font-semibold text-gray-700 mb-1">
                        Mobile number for USSD (ClickPesa)
                    </label>
                    <input id="deposit_phone" type="text" name="deposit_phone"
                        value="{{ old('deposit_phone', auth()->user()->contact ?? auth()->user()->phone ?? '') }}"
                        placeholder="2557xxxxxxxx or 07xxxxxxxx"
                        class="w-full rounded-lg border-gray-300 shadow-sm focus:ring-blue-200 h-10 px-2 focus:border-blue-500 @error('deposit_phone') border-red-500 @enderror">
                    <p class="text-xs text-gray-500 mt-1">Use a Tanzania mobile money number. You can enter <strong>07…</strong> or <strong>06…</strong>, or international form <strong>255…</strong> (no + needed). The system sends <strong>255</strong> plus nine digits to ClickPesa.</p>
                    @error('deposit_phone')
                        <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                    @enderror
                </div>
            </div>

            {{-- Tigosecure Fields --}}
            <div id="tigosecure-fields" class="space-y-4"
                style="display: {{ old('payment_method') == 'tigosecure' ? 'block' : 'none' }};">

                <div>
                    <label for="phone_number" class="block text-sm font-semibold text-gray-700 mb-1">
                        {{ __('vender/busroot.phone_number_tigosecure') }}
                    </label>
                    <input id="phone_number" type="text" name="phone_number"
                        value="{{ old('phone_number') }}"
                        class="w-full rounded-lg border-gray-300 shadow-sm focus:ring-blue-200 h-10 px-2 focus:border-blue-500 @error('phone_number') border-red-500 @enderror">
                    @error('phone_number')
                        <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                    @enderror
                </div>

                <div>
                    <label for="first_name" class="block text-sm font-semibold text-gray-700 mb-1">
                        {{ __('vender/busroot.first_name_tigosecure') }}
                    </label>
                    <input id="first_name" type="text" name="first_name"
                        value="{{ old('first_name') }}"
                        class="w-full rounded-lg border-gray-300 shadow-sm focus:ring-blue-200 h-10 px-2 focus:border-blue-500 @error('first_name') border-red-500 @enderror">
                    @error('first_name')
                        <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                    @enderror
                </div>

                <div>
                    <label for="last_name" class="block text-sm font-semibold text-gray-700 mb-1">
                        {{ __('vender/busroot.last_name_tigosecure') }}
                    </label>
                    <input id="last_name" type="text" name="last_name"
                        value="{{ old('last_name') }}"
                        class="w-full rounded-lg border-gray-300 shadow-sm focus:ring-blue-200 h-10 px-2 focus:border-blue-500 @error('last_name') border-red-500 @enderror">
                    @error('last_name')
                        <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                    @enderror
                </div>

                <div>
                    <label for="email" class="block text-sm font-semibold text-gray-700 mb-1">
                        {{ __('vender/busroot.email_tigosecure') }}
                    </label>
                    <input id="email" type="email" name="email"
                        value="{{ old('email') }}"
                        class="w-full rounded-lg border-gray-300 shadow-sm focus:ring-blue-200 h-10 px-2 focus:border-blue-500 @error('email') border-red-500 @enderror">
                    @error('email')
                        <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                    @enderror
                </div>
            </div>

            {{-- Submit Button --}}
            <div class="text-center">
                <button type="submit"
                    class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded-lg shadow focus:outline-none focus:ring-blue-300 transition">
                    {{ __('vender/busroot.deposit_button') }}
                </button>
            </div>
        </form>
    </div>
</div>

<script>
    function toggleDepositMethodFields() {
        const paymentMethod = document.getElementById('payment_method').value;
        const tigosecureFields = document.getElementById('tigosecure-fields');
        const clickpesaFields = document.getElementById('clickpesa-fields');
        if (tigosecureFields) tigosecureFields.style.display = paymentMethod === 'tigosecure' ? 'block' : 'none';
        if (clickpesaFields) clickpesaFields.style.display = paymentMethod === 'clickpesa' ? 'block' : 'none';
    }
    document.addEventListener('DOMContentLoaded', toggleDepositMethodFields);
</script>
@endsection
