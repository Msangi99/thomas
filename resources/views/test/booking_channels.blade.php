<section class="py-14 bg-gray-50">
    <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
            <article class="home-channels__card fade-in">
                <div class="home-channels__icon"><i class="fas fa-laptop"></i></div>
                <h3 class="font-heading font-bold uppercase text-sm">Book Online</h3>
                <p class="text-gray-600 text-sm mt-2">Search routes and book tickets 24/7 from any device.</p>
                <a href="#search" class="home-channels__btn">Book Online Now</a>
            </article>
            <article class="home-channels__card fade-in">
                <div class="home-channels__icon"><i class="fas fa-phone"></i></div>
                <h3 class="font-heading font-bold uppercase text-sm">Call Us</h3>
                <p class="text-gray-600 text-sm mt-2">Speak to our team for bookings and enquiries.</p>
                <a href="tel:+255755879793" class="home-channels__btn">+255 755 879 793</a>
            </article>
            <article class="home-channels__card fade-in">
                <div class="home-channels__icon"><i class="fas fa-map-marker-alt"></i></div>
                <h3 class="font-heading font-bold uppercase text-sm">Booking Offices</h3>
                <p class="text-gray-600 text-sm mt-2">Visit our offices across Tanzania.</p>
                <a href="{{ route('contact') }}" class="home-channels__btn">Find Offices</a>
            </article>
            <article class="home-channels__card fade-in">
                <div class="home-channels__icon"><i class="fas fa-bus"></i></div>
                <h3 class="font-heading font-bold uppercase text-sm">Group Travel</h3>
                <p class="text-gray-600 text-sm mt-2">Charters and group bookings for events.</p>
                <a href="{{ route('about') }}" class="home-channels__btn">Learn More</a>
            </article>
        </div>
    </div>
</section>
