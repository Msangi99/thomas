<section id="faq" class="py-20 bg-gray-50">
    <div class="container mx-auto px-4">
        <div class="text-center mb-12 fade-in">
            <h2 class="section-title">{{ __('all.frequently_asked_questions') }}</h2>
            <p class="section-subtitle">{{ __('all.find_answers_common_questions') }}</p>
        </div>

        <div class="max-w-3xl mx-auto space-y-3">
            <div class="faq-item bg-white border border-gray-200 rounded-xl p-5 fade-in">
                <div class="faq-question flex justify-between items-center cursor-pointer">
                    <h3 class="font-bold text-base pr-4">Step-by-Step: How to Book a Bus Ticket Online</h3>
                    <i class="fas fa-chevron-down flex-shrink-0" style="color:var(--home-primary)"></i>
                </div>
                <div class="mt-3 text-gray-600 text-sm hidden">
                    <ol class="list-decimal pl-5 space-y-2">
                        <li>Visit the official site and search your route using From, To, and travel date.</li>
                        <li>Compare buses, fares, and schedules — then click <strong>View Seats</strong>.</li>
                        <li>Select your seat(s) and enter passenger details.</li>
                        <li>Pay via Mobile Money, bank card, or at a booking office.</li>
                        <li>Receive your e-ticket by SMS/email. Arrive 30 minutes before departure.</li>
                    </ol>
                </div>
            </div>

            @foreach ([
                ['q' => __('all.what_payment_methods_accept'), 'a' => __('all.what_payment_methods_accept_answer')],
                ['q' => __('all.cancel_modify_booking'), 'a' => __('all.cancel_modify_booking_answer')],
                ['q' => __('all.amenities_available_buses'), 'a' => __('all.amenities_available_buses_answer')],
                ['q' => __('all.how_early_arrive_departure'), 'a' => __('all.how_early_arrive_departure_answer')],
            ] as $item)
                <div class="faq-item bg-white border border-gray-200 rounded-xl p-5 fade-in">
                    <div class="faq-question flex justify-between items-center cursor-pointer">
                        <h3 class="font-bold text-base pr-4">{{ $item['q'] }}</h3>
                        <i class="fas fa-chevron-down flex-shrink-0" style="color:var(--home-primary)"></i>
                    </div>
                    <div class="mt-3 text-gray-600 text-sm hidden">
                        <p>{{ $item['a'] }}</p>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</section>
