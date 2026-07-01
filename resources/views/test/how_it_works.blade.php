<section id="book" class="py-20 bg-white">
    <div class="container mx-auto px-4">
        <div class="text-center mb-12 fade-in">
            <h2 class="section-title">{{ __('all.how_to_book') ?? 'How It Works' }}</h2>
            <p class="section-subtitle">{{ __('all.four_simple_steps') }}</p>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
            @foreach ([
                ['n' => 1, 'title' => __('all.search_select'), 'body' => __('all.search_select_description'), 'active' => true],
                ['n' => 2, 'title' => __('all.step_search_bus'), 'body' => __('all.step_search_bus_desc'), 'active' => false],
                ['n' => 3, 'title' => __('all.enter_details'), 'body' => __('all.enter_details_description'), 'active' => false],
                ['n' => 4, 'title' => __('all.pay_travel'), 'body' => __('all.pay_travel_description'), 'active' => false],
            ] as $step)
                <article @class([
                    'home-steps__card fade-in',
                    'home-steps__card--active' => $step['active'],
                    'home-steps__card--idle' => !$step['active'],
                ])>
                    <div class="home-steps__number">{{ $step['n'] }}</div>
                    <h3 class="font-bold text-base mt-4">{{ $step['title'] }}</h3>
                    <p class="mt-2 text-sm opacity-90">{{ $step['body'] }}</p>
                </article>
            @endforeach
        </div>
    </div>
</section>
