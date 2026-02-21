@extends('test.ap')

@section('content')
<div class="min-h-screen flex items-center">
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="bg-white rounded-xl shadow-xl overflow-hidden">
            <div class="bg-blue-600 py-6 px-6 text-center">
                <div class="flex items-center justify-center space-x-3">
                    <svg class="h-8 w-8 text-white animate-spin" fill="none" viewBox="0 0 24 24">
                        <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                        <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                    </svg>
                    <h2 class="text-2xl font-bold text-white">Payment Processing</h2>
                </div>
            </div>
            <div class="p-6 sm:p-8 text-center">
                <p class="text-gray-600 mb-4">Your payment is being confirmed. This usually takes a few seconds.</p>
                <p class="text-sm text-gray-500">This page will refresh automatically. If it does not, <a href="{{ url()->current() }}" class="text-blue-600 hover:underline">click here</a>.</p>
            </div>
        </div>
    </div>
</div>
<meta http-equiv="refresh" content="3;url={{ url()->current() }}">
@endsection
