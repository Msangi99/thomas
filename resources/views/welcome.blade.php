<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ __('all.higlink_premium_travel') }}</title>
    <script src="https://cdn.tailwindcss.com"></script>
    @livewireStyles()
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="{{ asset('css/home.css') }}">
</head>
<body class="font-sans bg-gray-50">

    @include('test.nav')
    @include('test.hero')
    @include('test.deals')
    @include('test.hero_carousel')
    @include('test.booking_channels')
    @include('test.popular_routes')
    @include('test.popular')
    @include('test.brand_story')

    {{-- Features / Amenities --}}
    <section id="features" class="py-20 bg-gray-50">
        <div class="container mx-auto px-4">
            <div class="text-center mb-12 fade-in">
                <h2 class="section-title">{{ __('all.why_choose_higlink') }} <span style="color:var(--home-primary)">HIGHLINK</span>?</h2>
                <p class="section-subtitle">{{ __('all.experience_travel_redefined') }}</p>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <article class="home-feature fade-in">
                    <div class="home-feature__icon"><i class="fas fa-shield-alt"></i></div>
                    <h3 class="font-bold text-lg mb-2">{{ __('all.safety_first') }}</h3>
                    <p class="text-gray-600 text-sm">{{ __('all.safety_first_description') }}</p>
                </article>
                <article class="home-feature fade-in">
                    <div class="home-feature__icon"><i class="fas fa-wifi"></i></div>
                    <h3 class="font-bold text-lg mb-2">{{ __('all.premium_comfort') }}</h3>
                    <p class="text-gray-600 text-sm">{{ __('all.premium_comfort_description') }}</p>
                </article>
                <article class="home-feature fade-in">
                    <div class="home-feature__icon"><i class="fas fa-bolt"></i></div>
                    <h3 class="font-bold text-lg mb-2">{{ __('all.hassle_free_booking') }}</h3>
                    <p class="text-gray-600 text-sm">{{ __('all.hassle_free_booking_description') }}</p>
                </article>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-6">
                <article class="home-feature fade-in text-left">
                    <div class="flex items-start gap-4">
                        <div class="home-feature__icon flex-shrink-0" style="margin:0"><i class="fas fa-clock"></i></div>
                        <div>
                            <h3 class="font-bold text-lg mb-2">{{ __('all.punctual_service') }}</h3>
                            <p class="text-gray-600 text-sm">{{ __('all.punctual_service_description') }}</p>
                        </div>
                    </div>
                </article>
                <article class="home-feature fade-in text-left">
                    <div class="flex items-start gap-4">
                        <div class="home-feature__icon flex-shrink-0" style="margin:0"><i class="fas fa-headset"></i></div>
                        <div>
                            <h3 class="font-bold text-lg mb-2">{{ __('all.support_24_7') }}</h3>
                            <p class="text-gray-600 text-sm">{{ __('all.support_24_7_description') }}</p>
                        </div>
                    </div>
                </article>
            </div>
        </div>
    </section>

    @include('test.how_it_works')

    {{-- Testimonials --}}
    <section id="testimonials" class="py-20 bg-white">
        <div class="container mx-auto px-4">
            <div class="text-center mb-12 fade-in">
                <h2 class="section-title">{{ __('all.what_passengers_say') }}</h2>
                <p class="section-subtitle">{{ __('all.hear_from_thousands') }}</p>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <article class="home-testimonial fade-in">
                    <div class="flex items-center mb-4">
                        <img src="{{ asset('testimonials/IMG-20251015-WA0005.jpg') }}" alt="Rose Mshanga" class="w-12 h-12 rounded-full object-cover mr-3">
                        <div>
                            <h4 class="font-bold text-sm">Rose Mshanga</h4>
                            <div class="flex text-yellow-400 text-xs"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></div>
                        </div>
                    </div>
                    <p class="text-gray-600 text-sm">"{{ __('all.sarah_testimonial') }}"</p>
                    <p class="text-xs text-gray-400 mt-3">{{ __('all.traveled_dar_mwanza_may') }}</p>
                </article>
                <article class="home-testimonial fade-in">
                    <div class="flex items-center mb-4">
                        <img src="{{ asset('testimonials/IMG-20251016-WA0000.jpg') }}" alt="Christina Ekarist" class="w-12 h-12 rounded-full object-cover mr-3">
                        <div>
                            <h4 class="font-bold text-sm">Christina Ekarist</h4>
                            <div class="flex text-yellow-400 text-xs"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i></div>
                        </div>
                    </div>
                    <p class="text-gray-600 text-sm">"{{ __('all.michael_testimonial') }}"</p>
                    <p class="text-xs text-gray-400 mt-3">{{ __('all.traveled_arusha_dodoma_june') }}</p>
                </article>
                <article class="home-testimonial fade-in">
                    <div class="flex items-center mb-4">
                        <img src="{{ asset('testimonials/IMG-20251017-WA0005.jpg') }}" alt="Pokea Panja" class="w-12 h-12 rounded-full object-cover mr-3">
                        <div>
                            <h4 class="font-bold text-sm">Pokea Panja</h4>
                            <div class="flex text-yellow-400 text-xs"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></div>
                        </div>
                    </div>
                    <p class="text-gray-600 text-sm">"{{ __('all.amina_testimonial') }}"</p>
                    <p class="text-xs text-gray-400 mt-3">{{ __('all.traveled_dar_mbeya_april') }}</p>
                </article>
            </div>
        </div>
    </section>

    @include('test.faq')
    @include('test.cta_band')
    @include('test.footer')

    <button id="back-to-top" class="fixed bottom-8 right-8 text-white w-12 h-12 rounded-full flex items-center justify-center shadow-lg z-50 hidden">
        <i class="fas fa-arrow-up"></i>
    </button>

    <script src="{{ asset('js/home.js') }}"></script>
    @livewireScripts()
</body>
</html>
