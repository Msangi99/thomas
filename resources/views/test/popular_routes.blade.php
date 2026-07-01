@php
    $routeImages = [
        'dar es salaam|dodoma' => 'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcRarWGa5yA8eyc7fJyuwwVD1sjd00niaSuYhUWsl-xsPYdRO7Dooy0QJ12M_birZbVlqWZadvW-PeQJp0c',
        'arusha|mwanza' => 'https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcTghxI5TuVMrE6a9-fu4lALoskw1O1g3ZG4ERxsBbD_GPTPs3X66hN69LjvaXpqZA1K2-uwYnbGKzzcbcE',
        'dar es salaam|arusha' => 'https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcTaSggxxpPvkTjvXmW5ilO40Hx9AqGiRm6x_NmNezTJsSYnb4ozY4NVk7VEDEBjzLKGYyMXpFdk4fhkrLw',
        'dar es salaam|mwanza' => 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7xmM2E8pjgXcCICgiB8padz41yLeupl7nMuyQuE66A25zujdW_0t4p5I&s=10',
        'dar es salaam|mbeya' => 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-6ahTwpJxxh-Ios5BXEURIL8Ih4-_DhwxWpV7x0sAzc2CLidG1EdMO-p3&s=10',
        'arusha|dodoma' => 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj3RNzHifVvQHaLeJcEBm-jTrxkzjoc_BTPF8ZyKtiQNTeApHItBIsH1Y-&s=10',
    ];

    $featuredRoutes = [
        ['from' => 'Dar Es Salaam', 'to' => 'Dodoma'],
        ['from' => 'Arusha', 'to' => 'Mwanza'],
        ['from' => 'Dar Es Salaam', 'to' => 'Arusha'],
        ['from' => 'Dar Es Salaam', 'to' => 'Mwanza'],
        ['from' => 'Dar Es Salaam', 'to' => 'Mbeya'],
        ['from' => 'Arusha', 'to' => 'Dodoma'],
    ];

    $normalizeRouteKey = function ($from, $to) {
        return strtolower(trim(preg_replace('/\s+/', ' ', $from ?? ''))) . '|' . strtolower(trim(preg_replace('/\s+/', ' ', $to ?? '')));
    };

    $defaultRouteImage = 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?w=600&q=80';
@endphp

<section id="popular-routes" class="home-routes">
    <div class="container mx-auto px-4">
        <h2 class="home-routes__title fade-in">Popular Routes</h2>
        <p class="home-routes__subtitle fade-in">Top destinations travelled by our passengers</p>

        <div class="home-routes__grid">
            @foreach ($featuredRoutes as $route)
                @php
                    $routeKey = $normalizeRouteKey($route['from'], $route['to']);
                    $img = $routeImages[$routeKey] ?? $defaultRouteImage;
                    $fromCity = \App\Models\City::where('name', $route['from'])->first();
                    $toCity = \App\Models\City::where('name', $route['to'])->first();
                    $price = \App\Models\route::query()
                        ->where('from', $route['from'])
                        ->where('to', $route['to'])
                        ->min('price');
                @endphp
                <form action="{{ route('by_route_search') }}" method="POST" class="home-routes__card-wrap">
                    @csrf
                    <input type="hidden" name="departure_city" value="{{ $fromCity->id ?? '' }}">
                    <input type="hidden" name="arrival_city" value="{{ $toCity->id ?? '' }}">
                    <input type="hidden" name="departure_date" value="{{ now()->toDateString() }}">
                    <input type="hidden" name="bus_class" value="any">
                    <button type="submit" class="home-routes__card" style="background-image:url('{{ $img }}')">
                        <span class="home-routes__overlay" aria-hidden="true"></span>
                        <span class="home-routes__content">
                            <span class="home-routes__name">{{ $route['from'] }} ➔ {{ $route['to'] }}</span>
                            <span class="home-routes__price">From TZS {{ number_format($price ?: 1000) }}</span>
                        </span>
                    </button>
                </form>
            @endforeach
        </div>
    </div>
</section>
