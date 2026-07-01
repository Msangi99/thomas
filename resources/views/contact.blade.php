@extends('test.layouts.marketing')

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => 'We\'re Here To Help',
        'title' => __('all.contact_highlink'),
        'subtitle' => __('all.get_in_touch_security_transport_solutions'),
        'image' => 'https://images.unsplash.com/photo-1570125909232-e0973298bbfe?w=1200&q=80',
    ])
@endsection

@section('content')
<section class="page-section page-section--alt">
    <div class="container mx-auto px-4 max-w-5xl">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            <article class="page-card fade-in">
                <div class="page-card__icon"><i class="fas fa-address-card"></i></div>
                <h2 class="page-card__title">{{ __('all.contact_information') }}</h2>
                <div class="space-y-4 mt-4">
                    <div class="page-contact-item">
                        <i class="fas fa-map-marker-alt"></i>
                        <span>
                            {{ __('all.highlink_company_full_name') }}<br>
                            {{ __('all.address_line_1') }}<br>
                            {{ __('all.address_line_2') }}
                        </span>
                    </div>
                    <div class="page-contact-item">
                        <i class="fas fa-envelope"></i>
                        <span>
                            {{ __('all.email') }}
                            <a href="mailto:support@hisgc.co.tz">support@hisgc.co.tz</a>
                        </span>
                    </div>
                    <div class="page-contact-item">
                        <i class="fas fa-phone"></i>
                        <span>
                            {{ __('all.phone') }}
                            <a href="tel:+255755879793">+255 755 879 793</a>
                        </span>
                    </div>
                    <div class="page-contact-item">
                        <i class="fas fa-clock"></i>
                        <span>Mon – Sun: 6:00 AM – 10:00 PM</span>
                    </div>
                </div>
            </article>

            <article class="page-card fade-in p-0 overflow-hidden">
                <div class="p-6 pb-0">
                    <div class="page-card__icon"><i class="fas fa-map"></i></div>
                    <h2 class="page-card__title">{{ __('all.our_location') }}</h2>
                </div>
                <div class="mt-4">
                    <iframe
                        class="w-full h-72 lg:h-80 border-0"
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.902484602534!2d39.24613531477291!3d-6.854097995051849!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zNsKwNTEnMTQuNyJTIDM5wrAxNCc0NS43IkU!5e0!3m2!1sen!2sus!4v1694471234567"
                        allowfullscreen
                        loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade"
                        title="Highlink ISGC office location">
                    </iframe>
                </div>
            </article>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-3 gap-6 mt-8">
            <article class="page-card text-center fade-in">
                <div class="page-card__icon mx-auto"><i class="fas fa-laptop"></i></div>
                <h3 class="page-card__title">Book Online</h3>
                <p class="page-card__text text-sm">Search and book tickets anytime.</p>
                <a href="{{ route('home') }}#search" class="page-btn mt-4 text-xs">Book Now</a>
            </article>
            <article class="page-card text-center fade-in">
                <div class="page-card__icon mx-auto"><i class="fas fa-phone-volume"></i></div>
                <h3 class="page-card__title">Call Us</h3>
                <p class="page-card__text text-sm">Speak to our booking team directly.</p>
                <a href="tel:+255755879793" class="page-btn mt-4 text-xs">Call Now</a>
            </article>
            <article class="page-card text-center fade-in">
                <div class="page-card__icon mx-auto"><i class="fas fa-ticket-alt"></i></div>
                <h3 class="page-card__title">My Booking</h3>
                <p class="page-card__text text-sm">Look up your ticket by email or phone.</p>
                <a href="{{ route('info') }}" class="page-btn mt-4 text-xs">Find Booking</a>
            </article>
        </div>
    </div>
</section>

@include('test.cta_band')
@endsection
