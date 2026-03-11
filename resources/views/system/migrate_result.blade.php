@extends('system.app')

@section('title', 'Run Migrations')

@section('content')
<div class="container mx-auto px-4 py-8 max-w-4xl">
    <div class="mb-6">
        <a href="{{ route('system.index') }}" class="text-teal-600 hover:text-teal-800 font-medium">&larr; Back to Dashboard</a>
    </div>

    <div class="bg-white rounded-xl shadow-lg overflow-hidden">
        <div class="px-6 py-4 {{ $success ? 'bg-green-600' : 'bg-red-600' }}">
            <h1 class="text-xl font-bold text-white">
                {{ $success ? 'Migrations completed' : 'Migrations failed' }}
            </h1>
            <p class="text-white/90 text-sm mt-1">
                Exit code: {{ $exit_code }}
            </p>
        </div>
        <div class="p-6">
            @if ($output)
                <pre class="bg-gray-100 border border-gray-200 rounded-lg p-4 text-sm overflow-x-auto whitespace-pre-wrap font-mono">{{ $output }}</pre>
            @else
                <p class="text-gray-500">No output.</p>
            @endif
            <div class="mt-6">
                <a href="{{ route('system.index') }}" class="inline-flex items-center px-4 py-2 bg-teal-600 text-white rounded-lg hover:bg-teal-700">
                    Return to Dashboard
                </a>
            </div>
        </div>
    </div>
</div>
@endsection
