@extends('system.app')

@section('title', __('system.pages.migrate_title'))

@section('content')
<div class="container mx-auto px-4 py-8 max-w-4xl">
    <div class="mb-6">
        <a href="{{ route('system.index') }}" class="text-teal-600 hover:text-teal-800 font-medium">&larr; {{ __('system.pages.back_to_dashboard') }}</a>
    </div>

    <div class="bg-white rounded-xl shadow-lg overflow-hidden">
        <div class="px-6 py-4 {{ $success ? 'bg-green-600' : 'bg-red-600' }}">
            <h1 class="text-xl font-bold text-white">
                {{ $success ? __('system.pages.migrate_success') : __('system.pages.migrate_failed') }}
            </h1>
            <p class="text-white/90 text-sm mt-1">
                {{ __('system.pages.exit_code', ['code' => $exit_code]) }}
            </p>
        </div>
        <div class="p-6">
            @if ($output)
                <pre class="bg-gray-100 border border-gray-200 rounded-lg p-4 text-sm overflow-x-auto whitespace-pre-wrap font-mono">{{ $output }}</pre>
            @else
                <p class="text-gray-500">{{ __('system.pages.no_output') }}</p>
            @endif
            <div class="mt-6">
                <a href="{{ route('system.index') }}" class="inline-flex items-center px-4 py-2 bg-teal-600 text-white rounded-lg hover:bg-teal-700">
                    {{ __('system.pages.return_to_dashboard') }}
                </a>
            </div>
        </div>
    </div>
</div>
@endsection
