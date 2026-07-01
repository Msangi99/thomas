<footer id="contact" class="home-footer pt-16 pb-8">
    <div class="container mx-auto px-4">
        <div class="grid grid-cols-2 md:grid-cols-5 gap-8 mb-12">
            <!-- Company -->
            <div class="col-span-2 md:col-span-1 fade-in">
                <div class="flex items-center gap-2 mb-4">
                    <img src="{{ asset('ChatGPT Image Jul 7, 2025, 12_18_13 PM.png') }}" alt="Highlink ISGC" class="h-12 w-12 rounded-xl" loading="lazy">
                    <span class="text-white font-bold text-lg">Highlink ISGC</span>
                </div>
                <p class="text-sm mb-4">Your trusted partner for comfortable bus travel across Tanzania since 2015.</p>
                <div class="flex gap-3">
                    <a href="#" class="home-footer__link"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="home-footer__link"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="home-footer__link"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="home-footer__link"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>

            <!-- Company links -->
            <div class="fade-in">
                <h3 class="home-footer__heading">Company</h3>
                <ul class="space-y-2">
                    <li><a href="{{ route('about') }}" class="home-footer__link">About Us</a></li>
                    <li><a href="{{ route('contact') }}" class="home-footer__link">Contact Us</a></li>
                    <li><a href="#testimonials" class="home-footer__link">Testimonials</a></li>
                    <li><a href="#faq" class="home-footer__link">FAQs</a></li>
                </ul>
            </div>

            <!-- Products -->
            <div class="fade-in">
                <h3 class="home-footer__heading">Products</h3>
                <ul class="space-y-2">
                    <li><a href="#search" class="home-footer__link">Bus Ticketing</a></li>
                    <li><a href="{{ route('routes') }}" class="home-footer__link">Popular Routes</a></li>
                    <li><a href="{{ route('schedules.today') }}" class="home-footer__link">Today's Schedules</a></li>
                    <li><a href="{{ route('round.trip') }}" class="home-footer__link">Round Trip</a></li>
                    <li><a href="{{ route('info') }}" class="home-footer__link">Booking Info</a></li>
                </ul>
            </div>

            <!-- Legal -->
            <div class="fade-in">
                <h3 class="home-footer__heading">Legal</h3>
                <ul class="space-y-2">
                    <li><a href="#" class="home-footer__link">Terms &amp; Conditions</a></li>
                    <li><a href="#" class="home-footer__link">Privacy Policy</a></li>
                    <li><a href="#" class="home-footer__link">Refund Policy</a></li>
                </ul>
            </div>

            <!-- Contact -->
            <div class="fade-in">
                <h3 class="home-footer__heading">Contact</h3>
                <ul class="space-y-2 text-sm">
                    <li class="flex items-start gap-2">
                        <i class="fas fa-map-marker-alt mt-0.5" style="color:var(--home-accent)"></i>
                        <span>Basra Street, Changombe, Temeke, Dar es Salaam</span>
                    </li>
                    <li><a href="tel:+255755879793" class="home-footer__link"><i class="fas fa-phone mr-2"></i>+255 755 879 793</a></li>
                    <li><a href="mailto:support@hisgc.co.tz" class="home-footer__link"><i class="fas fa-envelope mr-2"></i>support@hisgc.co.tz</a></li>
                </ul>
            </div>
        </div>

        <div class="border-t border-gray-800 pt-8 flex flex-col md:flex-row justify-between items-center gap-4">
            <p class="text-sm">© {{ date('Y') }} Highlink ISGC Tanzania. All rights reserved.</p>
            <div class="flex gap-6 text-sm">
                <a href="#" class="home-footer__link">Terms of Service</a>
                <a href="#" class="home-footer__link">Privacy Policy</a>
            </div>
        </div>
    </div>
</footer>
