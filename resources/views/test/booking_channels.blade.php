<section class="py-14 bg-gray-50">
    <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
            <article class="home-channels__card fade-in">
                <div class="home-channels__icon"><i class="fas fa-laptop"></i></div>
                <h3 class="font-heading font-bold uppercase text-sm">{{ __('all.book_online') }}</h3>
                <p class="text-gray-600 text-sm mt-2">{{ __('all.book_online_desc') }}</p>
                <a href="#search" class="home-channels__btn">{{ __('all.book_online_now') }}</a>
            </article>
            <article class="home-channels__card fade-in">
                <div class="home-channels__icon"><i class="fas fa-phone"></i></div>
                <h3 class="font-heading font-bold uppercase text-sm">{{ __('all.call_us') }}</h3>
                <p class="text-gray-600 text-sm mt-2">{{ __('all.call_us_desc') }}</p>
                <a href="tel:+255755879793" class="home-channels__btn">+255 755 879 793</a>
            </article>
            <article class="home-channels__card fade-in">
                <div class="home-channels__icon"><i class="fas fa-map-marker-alt"></i></div>
                <h3 class="font-heading font-bold uppercase text-sm">{{ __('all.booking_offices') }}</h3>
                <p class="text-gray-600 text-sm mt-2">{{ __('all.booking_offices_desc') }}</p>
                <a href="{{ route('contact') }}" class="home-channels__btn">{{ __('all.find_offices') }}</a>
            </article>
            <article class="home-channels__card fade-in">
                <div class="home-channels__icon"><i class="fas fa-bus"></i></div>
                <h3 class="font-heading font-bold uppercase text-sm">{{ __('all.group_travel') }}</h3>
                <p class="text-gray-600 text-sm mt-2">{{ __('all.group_travel_desc') }}</p>
                <a href="{{ route('about') }}" class="home-channels__btn">{{ __('all.learn_more') }}</a>
            </article>
        </div>
    </div>
</section>
