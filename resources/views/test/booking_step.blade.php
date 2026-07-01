<section id="book" class="py-20 bg-white relative overflow-hidden">
        <div class="bubble w-64 h-64 bg-indigo-100 top-1/4 -left-20"></div>
        <div class="bubble w-96 h-96 bg-pink-100 bottom-0 -right-40"></div>
        
        <div class="container mx-auto px-4 relative z-10">
            <div class="text-center mb-12 fade-in">
                <h2 class="text-3xl md:text-4xl font-extrabold mb-4">{{ __('all.how_to_book') }}</h2>
                <p class="text-gray-600 max-w-2xl mx-auto text-lg">{{ __('all.three_simple_steps') }}</p>
            </div>

            <div class="flex flex-col md:flex-row justify-center items-center md:items-start space-y-12 md:space-y-0 md:space-x-12">
                <div class="flex flex-col items-center text-center max-w-xs fade-in delay-100">
                    <div class="bg-gradient-to-r from-indigo-500 to-purple-500 text-white w-20 h-20 rounded-full flex items-center justify-center text-2xl font-bold mb-6 floating">1</div>
                    <h3 class="font-bold text-xl mb-3">{{ __('all.search_select') }}</h3>
                    <p class="text-gray-600">{{ __('all.search_select_description') }}</p>
                </div>

                <div class="hidden md:block mt-14 fade-in delay-150">
                    <div class="w-20 h-1 bg-gradient-to-r from-indigo-500 to-purple-500 rounded-full"></div>
                    <div class="w-20 h-1 bg-gradient-to-r from-indigo-500 to-purple-500 rounded-full mt-1 opacity-60"></div>
                </div>

                <div class="flex flex-col items-center text-center max-w-xs fade-in delay-200">
                    <div class="bg-gradient-to-r from-indigo-500 to-purple-500 text-white w-20 h-20 rounded-full flex items-center justify-center text-2xl font-bold mb-6 floating" style="animation-delay: 0.2s">2</div>
                    <h3 class="font-bold text-xl mb-3">{{ __('all.enter_details') }}</h3>
                    <p class="text-gray-600">{{ __('all.enter_details_description') }}</p>
                </div>

                <div class="hidden md:block mt-14 fade-in delay-250">
                    <div class="w-20 h-1 bg-gradient-to-r from-indigo-500 to-purple-500 rounded-full"></div>
                    <div class="w-20 h-1 bg-gradient-to-r from-indigo-500 to-purple-500 rounded-full mt-1 opacity-60"></div>
                </div>

                <div class="flex flex-col items-center text-center max-w-xs fade-in delay-300">
                    <div class="bg-gradient-to-r from-indigo-500 to-purple-500 text-white w-20 h-20 rounded-full flex items-center justify-center text-2xl font-bold mb-6 floating" style="animation-delay: 0.4s">3</div>
                    <h3 class="font-bold text-xl mb-3">{{ __('all.pay_travel') }}</h3>
                    <p class="text-gray-600">{{ __('all.pay_travel_description') }}</p>
                </div>
            </div>
        </div>
    </section>
