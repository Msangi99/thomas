<section id="testimonials" class="py-20 bg-gradient-to-b from-gray-50 to-white relative overflow-hidden">
        <div class="bubble w-80 h-80 bg-indigo-100 -top-40 -right-40"></div>
        <div class="bubble w-64 h-64 bg-pink-100 bottom-20 -left-20"></div>
        
        <div class="container mx-auto px-4 relative z-10">
            <div class="text-center mb-12 fade-in">
                <h2 class="text-3xl md:text-4xl font-extrabold mb-4">{{ __('all.what_passengers_say') }}</h2>
                <p class="text-gray-600 max-w-2xl mx-auto text-lg">{{ __('all.hear_from_thousands') }}</p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div class="glass-card p-6 fade-in delay-100">
                    <div class="flex items-center mb-4">
                        <div class="w-12 h-12 rounded-full bg-gradient-to-r from-indigo-500 to-purple-500 flex items-center justify-center mr-4 overflow-hidden">
                            <img src="{{ asset('testimonials/IMG-20251015-WA0005.jpg') }}" alt="Rose Mshanga" class="w-full h-full object-cover">
                        </div>
                        <div>
                            <h4 class="font-bold">Rose Mshanga</h4>
                            <div class="flex text-yellow-400 text-sm">
                                <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                            </div>
                        </div>
                    </div>
                    <p class="text-gray-600 mb-4">"{{ __('all.sarah_testimonial') }}"</p>
                    <div class="text-xs text-gray-500">{{ __('all.traveled_dar_mwanza_may') }}</div>
                </div>

                <div class="glass-card p-6 fade-in delay-200">
                    <div class="flex items-center mb-4">
                        <div class="w-12 h-12 rounded-full bg-gradient-to-r from-indigo-500 to-purple-500 flex items-center justify-center mr-4 overflow-hidden">
                            <img src="{{ asset('testimonials/IMG-20251016-WA0000.jpg') }}" alt="Christina Ekarist" class="w-full h-full object-cover">
                        </div>
                        <div>
                            <h4 class="font-bold">Christina Ekarist</h4>
                            <div class="flex text-yellow-400 text-sm">
                                <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i>
                            </div>
                        </div>
                    </div>
                    <p class="text-gray-600 mb-4">"{{ __('all.michael_testimonial') }}"</p>
                    <div class="text-xs text-gray-500">{{ __('all.traveled_arusha_dodoma_june') }}</div>
                </div>

                <div class="glass-card p-6 fade-in delay-300">
                    <div class="flex items-center mb-4">
                        <div class="w-12 h-12 rounded-full bg-gradient-to-r from-indigo-500 to-purple-500 flex items-center justify-center mr-4 overflow-hidden">
                            <img src="{{ asset('testimonials/IMG-20251017-WA0005.jpg') }}" alt="Pokea Panja" class="w-full h-full object-cover">
                        </div>
                        <div>
                            <h4 class="font-bold">Pokea Panja</h4>
                            <div class="flex text-yellow-400 text-sm">
                                <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                            </div>
                        </div>
                    </div>
                    <p class="text-gray-600 mb-4">"{{ __('all.amina_testimonial') }}"</p>
                    <div class="text-xs text-gray-500">{{ __('all.traveled_dar_mbeya_april') }}</div>
                </div>
            </div>
        </div>
    </section>
