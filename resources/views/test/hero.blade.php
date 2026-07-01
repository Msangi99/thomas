<section id="home" class="home-hero text-white pt-28 pb-8 relative">
    <div class="home-hero__overlay"></div>
    <div class="container mx-auto px-4 relative z-10">
        <div class="home-hero__copy text-center max-w-3xl mx-auto pt-8 pb-4">
            <span class="home-hero__badge">{{ __('all.hero_badge') }}</span>
            <h1 class="home-hero__title">{{ __('all.hero_title') }}</h1>
            <p class="home-hero__subtitle">{{ __('all.hero_subtitle') }}</p>
        </div>

        <div class="home-hero__search-wrap relative z-20 pb-16">
            @include('test.sach')
        </div>
    </div>
</section>
