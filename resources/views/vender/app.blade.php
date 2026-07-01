<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title', __('assistance/sidebar.vendor_panel')) — {{ __('all.highlink_isgc') }}</title>
    <script src="https://cdn.tailwindcss.com"></script>
    @livewireStyles()
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="shortcut icon" href="{{ asset('ChatGPT Image Jul 7, 2025, 12_18_13 PM.png') }}" type="image/icon">
    <link rel="stylesheet" href="{{ asset('css/home.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    @stack('styles')
</head>
<body class="font-sans bg-gray-50 vendor-portal vendor-portal--sidebar">

    <div class="vendor-shell">
        <div id="vendor-sidebar-overlay" class="vendor-sidebar-overlay" aria-hidden="true"></div>

        <aside id="vendor-sidebar" class="vendor-sidebar" aria-label="{{ __('assistance/sidebar.vendor_panel') }}">
            @include('vender.sidebar')
        </aside>

        <div class="vendor-shell__main">
            <header class="vendor-topbar">
                <div class="vendor-topbar__start">
                    <button type="button" id="vendor-sidebar-toggle" class="vendor-topbar__menu-btn lg:hidden" aria-label="Toggle menu" aria-expanded="false" aria-controls="vendor-sidebar">
                        <i class="fas fa-bars"></i>
                    </button>
                    <a href="{{ route('vender.index') }}" class="vendor-topbar__brand">
                        <img src="{{ asset('ChatGPT Image Jul 7, 2025, 12_18_13 PM.png') }}" alt="" class="vendor-topbar__logo" loading="lazy">
                        <span>{{ __('assistance/sidebar.vendor_panel') }}</span>
                    </a>
                </div>

                <div class="vendor-topbar__meta">
                    @php $vb = auth()->user()->VenderBalances; @endphp
                    <div class="vendor-topbar__wallet" title="{{ __('assistance/dashboard.available_balance') }}">
                        <i class="fas fa-wallet" aria-hidden="true"></i>
                        <span>{{ convert_money(optional($vb)->amount ?? 0) }} {{ $currency }}</span>
                    </div>
                    <select class="vendor-topbar__select"
                            aria-label="Currency"
                            onchange="window.location.href = '{{ route('set.currency', ['currency' => ':currency']) }}'.replace(':currency', this.value)">
                        <option value="Tsh" {{ session('currency') == 'Tsh' ? 'selected' : '' }}>TSH</option>
                        <option value="Usd" {{ session('currency') == 'Usd' ? 'selected' : '' }}>USD</option>
                    </select>
                    <select class="vendor-topbar__select"
                            aria-label="Language"
                            onchange="window.location.href = '{{ route('set.locale', ['lang' => '']) }}' + this.value">
                        <option value="en" {{ app()->getLocale() == 'en' ? 'selected' : '' }}>{{ __('customer/busroot.english') }}</option>
                        <option value="sw" {{ app()->getLocale() == 'sw' ? 'selected' : '' }}>{{ __('customer/busroot.kiswahili') }}</option>
                    </select>
                    <form action="{{ route('logout') }}" method="POST" class="vendor-topbar__logout">
                        @csrf
                        <button type="submit" class="vendor-topbar__logout-btn" title="{{ __('assistance/sidebar.logout') }}">
                            <i class="fas fa-right-from-bracket" aria-hidden="true"></i>
                        </button>
                    </form>
                </div>
            </header>

            <main class="vendor-shell__content page-main page-main--vendor">
                @hasSection('page_hero')
                    @yield('page_hero')
                @endif

                @yield('content')
            </main>
        </div>
    </div>

    <button id="back-to-top" class="fixed bottom-8 right-8 text-white w-12 h-12 rounded-full flex items-center justify-center shadow-lg z-50 hidden" style="background:var(--home-primary)">
        <i class="fas fa-arrow-up"></i>
    </button>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script src="{{ asset('js/home.js') }}"></script>
    <script src="{{ asset('js/vendor-portal.js') }}"></script>
    <script>
        toastr.options = {
            closeButton: true,
            progressBar: true,
            positionClass: 'toast-top-right',
            timeOut: 5000
        };
        @if(session('success'))
            toastr.success(@json(session('success')));
        @endif
        @if(session('error'))
            toastr.error(@json(session('error')));
        @endif
        @if(session('warning'))
            toastr.warning(@json(session('warning')));
        @endif
        @if(session('info'))
            toastr.info(@json(session('info')));
        @endif
        @if($errors->any())
            @foreach($errors->all() as $error)
                toastr.error(@json($error));
            @endforeach
        @endif
    </script>
    @stack('scripts')
    @livewireScripts()
</body>
</html>
