@extends('vender.app')

@section('title', __('vender/busroot.round_payment_failed_title'))
@section('content')
<section class="bg-gradient-to-b from-gray-200 to-gray-600 py-8 px-4 sm:px-6 lg:px-8 rounded-3xl">
    <div class="max-w-3xl mx-auto">
        <div class="bg-white rounded-xl shadow-lg overflow-hidden">
            <div class="bg-red-600 px-6 py-4">
                <h1 class="text-xl font-bold text-white">{{ __('all.payment_failed') }}</h1>
            </div>
            <div class="p-6">
                <h2 class="text-center text-red-700 text-lg font-semibold mb-2">{{ __('vender/busroot.round_payment_could_not_process') }}</h2>
                <p class="text-center text-gray-600 mb-6">{{ __('vender/busroot.round_payment_try_again_or_support') }}</p>

                @if(isset($error) && $error)
                    <div class="border border-red-200 rounded-lg p-4 mb-6 bg-red-50">
                        <strong>{{ __('vender/busroot.error') }}:</strong> {{ $error }}
                    </div>
                @endif
                @if(session('error'))
                    <div class="border border-red-200 rounded-lg p-4 mb-6 bg-red-50">
                        <strong>{{ __('vender/busroot.error') }}:</strong> {{ session('error') }}
                    </div>
                @endif

                <div class="flex flex-wrap gap-3 justify-center mt-6">
                    <a href="{{ route('round.trip.payment') }}" class="inline-flex items-center px-4 py-2 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700">{{ __('all.retry_payment') }}</a>
                    <a href="{{ route('home') }}" class="inline-flex items-center px-4 py-2 bg-gray-600 text-white rounded-lg hover:bg-gray-700">{{ __('all.return_home') }}</a>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
