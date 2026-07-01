<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title', __('all.higlink_premium_travel'))</title>
    <script src="https://cdn.tailwindcss.com"></script>
    @livewireStyles()
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="shortcut icon" href="{{ asset('ChatGPT Image Jul 7, 2025, 12_18_13 PM.png') }}" type="image/icon">
    <link rel="stylesheet" href="{{ asset('css/home.css') }}">
    @stack('styles')
</head>
<body class="font-sans bg-gray-50">

    @include('test.nav')

    <main class="page-main">
        @hasSection('page_hero')
            @yield('page_hero')
        @endif

        @yield('content')
    </main>

    @include('test.footer')

    <button id="back-to-top" class="fixed bottom-8 right-8 text-white w-12 h-12 rounded-full flex items-center justify-center shadow-lg z-50 hidden">
        <i class="fas fa-arrow-up"></i>
    </button>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="{{ asset('js/home.js') }}"></script>
    @stack('scripts')
    @livewireScripts()
</body>
</html>
