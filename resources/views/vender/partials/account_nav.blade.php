@php
    $vb = auth()->user()->VenderBalances;
    $commissionBalance = convert_money(optional($vb)->amount ?? 0);
    $bookingFlowRoutes = [
        'vender.route', 'vender.route.by_route_search', 'vender.route.road',
        'vender.booking_form', 'vender.store', 'seates.vender', 'vender.get_seats',
        'vender.pay', 'vender.payment_store', 'vender.verify',
    ];
    $navItems = [
        ['route' => 'vender.index', 'label' => __('assistance/sidebar.dashboard'), 'icon' => 'fa-gauge-high', 'active' => request()->routeIs('vender.index')],
        ['route' => 'vender.bus_route', 'label' => __('assistance/sidebar.bus_schedule'), 'icon' => 'fa-calendar-days', 'active' => request()->routeIs('vender.bus_route', 'vender.edit.schedule', 'vender.update_schedule')],
        ['route' => 'vender.transaction', 'label' => __('assistance/sidebar.transactions'), 'icon' => 'fa-money-bill-transfer', 'active' => request()->routeIs('vender.transaction', 'vender.transaction.request', 'vender.wallet.*', 'vender.dpo.*')],
    ];
    if (auth()->user()->status == 'accept') {
        $navItems[] = ['route' => 'vender.route', 'label' => __('assistance/sidebar.book_ticket'), 'icon' => 'fa-ticket', 'active' => request()->routeIs($bookingFlowRoutes)];
    }
    $navItems = array_merge($navItems, [
        ['route' => 'vender.history', 'label' => __('assistance/sidebar.booking_history'), 'icon' => 'fa-clock-rotate-left', 'active' => request()->routeIs('vender.history', 'vender.print', 'vender.print.manifest'), 'params' => ['period' => request('period', 'today')]],
        ['route' => 'round.trip', 'label' => __('all.round_trip'), 'icon' => 'fa-arrows-rotate', 'active' => request()->routeIs('round.trip', 'round.trip.*')],
        ['route' => 'vender.parcels.index', 'label' => __('all.parcels'), 'icon' => 'fa-box', 'active' => request()->routeIs('vender.parcels.*')],
        ['route' => 'vender.profile', 'label' => __('assistance/sidebar.profile'), 'icon' => 'fa-user', 'active' => request()->routeIs('vender.profile', 'vender.profile.update')],
    ]);
@endphp

<nav class="customer-account-nav" aria-label="{{ __('assistance/sidebar.vendor_panel') }}">
    <div class="container mx-auto px-3 sm:px-4">
        <div class="customer-account-nav__inner">
            <div class="customer-account-nav__links-wrap">
                <div class="customer-account-nav__links" id="vendor-account-links">
                    @foreach ($navItems as $item)
                        @php
                            $href = isset($item['params'])
                                ? route($item['route'], $item['params'])
                                : route($item['route']);
                        @endphp
                        <a href="{{ $href }}"
                           class="customer-account-nav__link {{ $item['active'] ? 'customer-account-nav__link--active' : '' }}"
                           aria-label="{{ $item['label'] }}"
                           @if($item['active']) aria-current="page" @endif>
                            <i class="fas {{ $item['icon'] }}" aria-hidden="true"></i>
                            <span class="customer-account-nav__label">{{ $item['label'] }}</span>
                        </a>
                    @endforeach
                </div>
            </div>

            <div class="customer-account-nav__meta">
                <div class="customer-account-nav__wallet" title="{{ __('assistance/dashboard.available_balance') }}">
                    <i class="fas fa-wallet" aria-hidden="true"></i>
                    <span>{{ $commissionBalance }} {{ $currency }}</span>
                </div>

                <div class="customer-account-nav__selects">
                    <select class="customer-account-nav__select"
                            aria-label="{{ __('all.currency_label') }}"
                            onchange="window.location.href = '{{ route('set.currency', ['currency' => ':currency']) }}'.replace(':currency', this.value)">
                        <option value="Tsh" {{ session('currency') == 'Tsh' ? 'selected' : '' }}>TSH</option>
                        <option value="Usd" {{ session('currency') == 'Usd' ? 'selected' : '' }}>USD</option>
                    </select>

                    <select class="customer-account-nav__select"
                            aria-label="{{ __('all.language') }}"
                            onchange="window.location.href = '{{ route('set.locale', ['lang' => '']) }}' + this.value">
                        <option value="en" {{ app()->getLocale() == 'en' ? 'selected' : '' }}>{{ __('customer/busroot.english') }}</option>
                        <option value="sw" {{ app()->getLocale() == 'sw' ? 'selected' : '' }}>{{ __('customer/busroot.kiswahili') }}</option>
                    </select>
                </div>

                <form action="{{ route('logout') }}" method="POST" class="customer-account-nav__logout">
                    @csrf
                    <button type="submit" class="customer-account-nav__logout-btn" title="{{ __('assistance/sidebar.logout') }}">
                        <i class="fas fa-right-from-bracket" aria-hidden="true"></i>
                        <span class="customer-account-nav__logout-text">{{ __('assistance/sidebar.logout') }}</span>
                    </button>
                </form>
            </div>
        </div>
    </div>
</nav>
