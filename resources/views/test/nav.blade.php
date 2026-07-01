<header class="home-nav fixed top-0 w-full z-50 relative" id="site-header">
    <div class="container mx-auto px-3 sm:px-4 py-2.5 sm:py-3 flex justify-between items-center">
        <!-- Logo -->
        <a href="{{ route('home') }}" class="flex items-center gap-2 flex-shrink-0 home-nav__brand">
            <img src="{{ asset('ChatGPT Image Jul 7, 2025, 12_18_13 PM.png') }}" alt="Highlink ISGC"
                class="h-8 w-8 sm:h-10 sm:w-10 rounded-xl" loading="lazy">
            <span class="text-sm sm:text-base">Highlink ISGC</span>
        </a>

        <!-- OTAPP-style pill nav -->
        <div class="hidden lg:flex home-nav__pill">
            <a href="{{ route('home') }}" class="home-nav__pill-item home-nav__pill-item--active">{{ __('all.nav_buses') }}</a>
        </div>

        <!-- Desktop links -->
        <nav class="hidden md:flex items-center gap-5">
            <a href="{{ route('about') }}" class="home-nav__link">{{ __('all.nav_about') }}</a>
            <a href="{{ route('contact') }}" class="home-nav__link">{{ __('all.contact') }}</a>
            <a href="{{ route('home') }}#testimonials" class="home-nav__link">{{ __('all.nav_testimonials') }}</a>
            <a href="{{ route('routes') }}" class="home-nav__link @if(request()->routeIs('routes')) font-bold @endif">{{ __('all.nav_routes') }}</a>
            <a href="{{ route('info') }}" class="home-nav__link @if(request()->routeIs('info', 'booking_info', 'booking.verification.*')) font-bold @endif">{{ __('all.booking_information') }}</a>
        </nav>

        <!-- Contact + Auth -->
        <div class="flex items-center gap-2 md:gap-4">
            <div class="hidden lg:flex flex-col text-right text-xs">
                <a href="tel:+255755879793" class="font-semibold text-gray-800 hover:text-[var(--home-primary)]">+255 755 879 793</a>
                <a href="mailto:support@hisgc.co.tz" class="text-gray-500 hover:text-[var(--home-primary)]">support@hisgc.co.tz</a>
            </div>

            <div class="hidden md:flex items-center gap-2">
                <select class="text-xs border rounded-full px-2 py-1.5 font-medium text-gray-700"
                        aria-label="{{ __('all.currency_label') }}"
                        onchange="window.location.href = '{{ route('set.currency', ['currency' => ':currency']) }}'.replace(':currency', this.value)">
                    <option value="Tsh" {{ session('currency', 'Tsh') == 'Tsh' ? 'selected' : '' }}>TSH</option>
                    <option value="Usd" {{ session('currency') == 'Usd' ? 'selected' : '' }}>USD</option>
                </select>
                <select class="text-xs border rounded-full px-2 py-1.5 font-medium text-gray-700"
                        aria-label="{{ __('all.language') }}"
                        onchange="window.location.href = '{{ route('set.locale', ['lang' => '']) }}' + this.value">
                    <option value="en" {{ app()->getLocale() == 'en' ? 'selected' : '' }}>{{ __('all.english') }}</option>
                    <option value="sw" {{ app()->getLocale() == 'sw' ? 'selected' : '' }}>{{ __('all.kiswahili') }}</option>
                </select>
            </div>

            @guest
                <a href="{{ route('login') }}" class="hidden md:block px-4 py-2 text-sm font-semibold border rounded-full transition-colors" style="color:var(--home-primary);border-color:var(--home-primary)">{{ __('all.login') }}</a>
                <a href="{{ route('register') }}" class="hidden md:block px-4 py-2 text-sm font-semibold text-white rounded-full transition-colors" style="background:var(--home-primary)">{{ __('all.register') }}</a>
            @endguest
            @auth
                @if (auth()->user()->isAdmin())
                    <a href="{{ route('system.index') }}" class="hidden md:block px-4 py-2 text-sm font-semibold text-white rounded-full" style="background:var(--home-primary)">{{ __('all.dashboard') }}</a>
                @elseif (auth()->user()->isBuscampany())
                    <a href="{{ route('index') }}" class="hidden md:block px-4 py-2 text-sm font-semibold text-white rounded-full" style="background:var(--home-primary)">{{ __('all.dashboard') }}</a>
                @elseif (auth()->user()->isVender())
                    @unless (request()->routeIs('vender.*', 'round.trip*'))
                        <a href="{{ route('vender.index') }}" class="hidden md:block px-4 py-2 text-sm font-semibold text-white rounded-full" style="background:var(--home-primary)">{{ __('all.dashboard') }}</a>
                    @endunless
                @elseif (auth()->user()->role == 'customer')
                    @unless (request()->routeIs('customer.*', 'customer.round.trip*', 'round.trip*'))
                        <a href="{{ route('customer.index') }}" class="hidden md:block px-4 py-2 text-sm font-semibold text-white rounded-full" style="background:var(--home-primary)">{{ __('all.dashboard') }}</a>
                    @endunless
                @endif
            @endauth

            <button type="button" id="mobile-menu-btn" class="md:hidden text-gray-700 p-2 hover:bg-gray-100 rounded-md" aria-label="{{ __('all.toggle_menu') }}" aria-expanded="false" aria-controls="mobile-menu">
                <i class="fas fa-bars text-xl"></i>
            </button>
        </div>
    </div>

    <!-- Mobile menu -->
    <div id="mobile-menu" class="md:hidden absolute top-full left-0 right-0 z-[60] bg-white border-t border-gray-200 shadow-lg rounded-b-2xl" role="navigation" aria-label="{{ __('all.mobile_navigation') }}">
        <div class="flex flex-col p-4 gap-1">
            <a href="{{ route('home') }}" class="px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-md font-medium">{{ __('all.home') }}</a>
            <a href="{{ route('about') }}" class="px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-md font-medium">{{ __('all.about_us') }}</a>
            <a href="{{ route('contact') }}" class="px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-md font-medium">{{ __('all.contact_us_link') }}</a>
            <a href="{{ route('info') }}" class="px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-md font-medium">{{ __('all.booking_info_short') }}</a>
            <a href="{{ route('routes') }}" class="px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-md font-medium">{{ __('all.nav_routes') }}</a>
            <a href="{{ route('home') }}#testimonials" class="px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-md font-medium">{{ __('all.nav_testimonials') }}</a>
            <div class="px-4 py-2">
                <label for="mobile-locale" class="block text-xs font-semibold uppercase tracking-wide text-gray-400 mb-1">{{ __('all.language') }}</label>
                <select id="mobile-locale" class="w-full page-input text-sm"
                        onchange="window.location.href = '{{ route('set.locale', ['lang' => '']) }}' + this.value">
                    <option value="en" {{ app()->getLocale() == 'en' ? 'selected' : '' }}>{{ __('all.english') }}</option>
                    <option value="sw" {{ app()->getLocale() == 'sw' ? 'selected' : '' }}>{{ __('all.kiswahili') }}</option>
                </select>
            </div>
            <div class="px-4 py-2">
                <label for="mobile-currency" class="block text-xs font-semibold uppercase tracking-wide text-gray-400 mb-1">{{ __('all.currency_label') }}</label>
                <select id="mobile-currency" class="w-full page-input text-sm"
                        onchange="window.location.href = '{{ route('set.currency', ['currency' => ':currency']) }}'.replace(':currency', this.value)">
                    <option value="Tsh" {{ session('currency', 'Tsh') == 'Tsh' ? 'selected' : '' }}>TSH</option>
                    <option value="Usd" {{ session('currency') == 'Usd' ? 'selected' : '' }}>USD</option>
                </select>
            </div>
            <a href="tel:+255755879793" class="px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-md font-medium flex items-center gap-2">
                <i class="fas fa-phone text-sm"></i> +255 755 879 793
            </a>
            @guest
                <div class="pt-2 mt-2 border-t border-gray-200 space-y-2">
                    <a href="{{ route('login') }}" class="block w-full px-4 py-2.5 text-center font-medium border rounded-lg" style="color:var(--home-primary);border-color:var(--home-primary)">{{ __('all.sign_in') }}</a>
                    <a href="{{ route('register') }}" class="block w-full px-4 py-2.5 text-center font-medium text-white rounded-lg" style="background:var(--home-primary)">{{ __('all.register') }}</a>
                </div>
            @endguest
            @auth
                @if (auth()->user()->isVender() && request()->routeIs('vender.*', 'round.trip*'))
                    <div class="pt-2 mt-2 border-t border-gray-200 space-y-1">
                        <p class="px-4 py-1 text-xs font-semibold uppercase tracking-wide text-gray-400">{{ __('assistance/sidebar.vendor_panel') }}</p>
                        <a href="{{ route('vender.index') }}" class="px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-md font-medium flex items-center gap-2">
                            <i class="fas fa-gauge-high text-sm w-4 text-center" style="color:var(--home-primary)"></i> {{ __('assistance/sidebar.dashboard') }}
                        </a>
                        <a href="{{ route('vender.transaction') }}" class="px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-md font-medium flex items-center gap-2">
                            <i class="fas fa-money-bill-transfer text-sm w-4 text-center" style="color:var(--home-primary)"></i> {{ __('assistance/sidebar.transactions') }}
                        </a>
                        @if (auth()->user()->status == 'accept')
                        <a href="{{ route('vender.route') }}" class="px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-md font-medium flex items-center gap-2">
                            <i class="fas fa-ticket text-sm w-4 text-center" style="color:var(--home-primary)"></i> {{ __('assistance/sidebar.book_ticket') }}
                        </a>
                        @endif
                        <a href="{{ route('vender.profile') }}" class="px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-md font-medium flex items-center gap-2">
                            <i class="fas fa-user text-sm w-4 text-center" style="color:var(--home-primary)"></i> {{ __('assistance/sidebar.profile') }}
                        </a>
                        <form action="{{ route('logout') }}" method="POST" class="px-4 py-2">
                            @csrf
                            <button type="submit" class="w-full px-4 py-2.5 text-center font-medium border rounded-lg text-red-600 border-red-200 hover:bg-red-50">
                                {{ __('assistance/sidebar.logout') }}
                            </button>
                        </form>
                    </div>
                @elseif (auth()->user()->role == 'customer' && request()->routeIs('customer.*', 'customer.round.trip*', 'round.trip*'))
                    <div class="pt-2 mt-2 border-t border-gray-200 space-y-1">
                        <p class="px-4 py-1 text-xs font-semibold uppercase tracking-wide text-gray-400">{{ __('customer_sidebar.Dashboard') }}</p>
                        <a href="{{ route('customer.index') }}" class="px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-md font-medium flex items-center gap-2">
                            <i class="fas fa-gauge-high text-sm w-4 text-center" style="color:var(--home-primary)"></i> {{ __('customer_sidebar.Dashboard') }}
                        </a>
                        <a href="{{ route('customer.mybooking') }}" class="px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-md font-medium flex items-center gap-2">
                            <i class="fas fa-ticket text-sm w-4 text-center" style="color:var(--home-primary)"></i> {{ __('customer_sidebar.My Tickets') }}
                        </a>
                        <a href="{{ route('customer.mybooking.search') }}" class="px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-md font-medium flex items-center gap-2">
                            <i class="fas fa-route text-sm w-4 text-center" style="color:var(--home-primary)"></i> {{ __('customer_sidebar.Bus Route') }}
                        </a>
                        <a href="{{ route('customer.profile') }}" class="px-4 py-3 text-gray-700 hover:bg-gray-50 rounded-md font-medium flex items-center gap-2">
                            <i class="fas fa-user text-sm w-4 text-center" style="color:var(--home-primary)"></i> {{ __('customer_sidebar.Profile') }}
                        </a>
                        <form action="{{ route('logout') }}" method="POST" class="px-4 py-2">
                            @csrf
                            <button type="submit" class="w-full px-4 py-2.5 text-center font-medium border rounded-lg text-red-600 border-red-200 hover:bg-red-50">
                                {{ __('customer_sidebar.Logout') }}
                            </button>
                        </form>
                    </div>
                @else
                <div class="pt-2 mt-2 border-t border-gray-200">
                    @if (auth()->user()->isAdmin())
                        <a href="{{ route('system.index') }}" class="block w-full px-4 py-2.5 text-center font-medium text-white rounded-lg" style="background:var(--home-primary)">{{ __('all.dashboard') }}</a>
                    @elseif (auth()->user()->isBuscampany())
                        <a href="{{ route('index') }}" class="block w-full px-4 py-2.5 text-center font-medium text-white rounded-lg" style="background:var(--home-primary)">{{ __('all.dashboard') }}</a>
                    @elseif (auth()->user()->isVender())
                        <a href="{{ route('vender.index') }}" class="block w-full px-4 py-2.5 text-center font-medium text-white rounded-lg" style="background:var(--home-primary)">{{ __('all.dashboard') }}</a>
                    @elseif (auth()->user()->role == 'customer')
                        <a href="{{ route('customer.index') }}" class="block w-full px-4 py-2.5 text-center font-medium text-white rounded-lg" style="background:var(--home-primary)">{{ __('all.dashboard') }}</a>
                    @endif
                </div>
                @endif
            @endauth
        </div>
    </div>
</header>
