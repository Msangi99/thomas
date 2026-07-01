<footer id="contact" class="home-footer pt-16 pb-8">
    <div class="container mx-auto px-4">
        <div class="grid grid-cols-2 md:grid-cols-5 gap-8 mb-12">
            <!-- Company -->
            <div class="col-span-2 md:col-span-1 fade-in">
                <div class="flex items-center gap-2 mb-4">
                    <img src="{{ asset('ChatGPT Image Jul 7, 2025, 12_18_13 PM.png') }}" alt="Highlink ISGC" class="h-12 w-12 rounded-xl" loading="lazy">
                    <span class="text-white font-bold text-lg">Highlink ISGC</span>
                </div>
                <p class="text-sm mb-4">{{ __('all.footer_trusted_partner') }}</p>
                <div class="flex gap-3">
                    <a href="#" class="home-footer__link"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="home-footer__link"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="home-footer__link"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="home-footer__link"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>

            <!-- Company links -->
            <div class="fade-in">
                <h3 class="home-footer__heading">{{ __('all.footer_company') }}</h3>
                <ul class="space-y-2">
                    <li><a href="{{ route('about') }}" class="home-footer__link">{{ __('all.about_us') }}</a></li>
                    <li><a href="{{ route('contact') }}" class="home-footer__link">{{ __('all.contact_us_link') }}</a></li>
                    <li><a href="#testimonials" class="home-footer__link">{{ __('all.nav_testimonials') }}</a></li>
                    <li><a href="#faq" class="home-footer__link">{{ __('all.footer_faqs') }}</a></li>
                </ul>
            </div>

            <!-- Products -->
            <div class="fade-in">
                <h3 class="home-footer__heading">{{ __('all.footer_products') }}</h3>
                <ul class="space-y-2">
                    <li><a href="#search" class="home-footer__link">{{ __('all.footer_bus_ticketing') }}</a></li>
                    <li><a href="{{ route('routes') }}" class="home-footer__link">{{ __('all.footer_popular_routes') }}</a></li>
                    <li><a href="{{ route('schedules.today') }}" class="home-footer__link">{{ __('all.footer_todays_schedules') }}</a></li>
                    <li><a href="{{ route('round.trip') }}" class="home-footer__link">{{ __('all.round_trip') }}</a></li>
                    <li><a href="{{ route('info') }}" class="home-footer__link">{{ __('all.booking_info_short') }}</a></li>
                </ul>
            </div>

            <!-- Legal -->
            <div class="fade-in">
                <h3 class="home-footer__heading">{{ __('all.footer_legal') }}</h3>
                <ul class="space-y-2">
                    <li><a href="#" class="home-footer__link">{{ __('all.footer_terms_conditions') }}</a></li>
                    <li><a href="#" class="home-footer__link">{{ __('all.footer_privacy_policy') }}</a></li>
                    <li><a href="#" class="home-footer__link">{{ __('all.footer_refund_policy') }}</a></li>
                </ul>
            </div>

            <!-- Contact -->
            <div class="fade-in">
                <h3 class="home-footer__heading">{{ __('all.contact') }}</h3>
                <ul class="space-y-2 text-sm">
                    <li class="flex items-start gap-2">
                        <i class="fas fa-map-marker-alt mt-0.5" style="color:var(--home-accent)"></i>
                        <span>{{ __('all.address_line_1') }} {{ __('all.address_line_2') }}</span>
                    </li>
                    <li><a href="tel:+255755879793" class="home-footer__link"><i class="fas fa-phone mr-2"></i>+255 755 879 793</a></li>
                    <li><a href="mailto:support@hisgc.co.tz" class="home-footer__link"><i class="fas fa-envelope mr-2"></i>support@hisgc.co.tz</a></li>
                </ul>
            </div>
        </div>

        <div class="border-t border-gray-800 pt-8 flex flex-col md:flex-row justify-between items-center gap-4">
            <p class="text-sm">{{ __('all.copyright_notice', ['year' => date('Y')]) }}</p>
            <div class="flex gap-6 text-sm">
                <a href="#" class="home-footer__link">{{ __('all.footer_terms_of_service') }}</a>
                <a href="#" class="home-footer__link">{{ __('all.footer_privacy_policy') }}</a>
            </div>
        </div>
    </div>
</footer>
