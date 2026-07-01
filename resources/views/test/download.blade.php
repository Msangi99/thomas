<section class="py-20 bg-gradient-to-r from-indigo-500 to-purple-600 text-white relative overflow-hidden">
        <div class="bubble w-64 h-64 bg-white/10 top-1/4 -left-20"></div>
        <div class="bubble w-96 h-96 bg-white/10 bottom-0 -right-40"></div>
        
        <div class="container mx-auto px-4 relative z-10">
            <div class="flex flex-col md:flex-row items-center">
                <div class="md:w-1/2 mb-10 md:mb-0 md:pr-10 fade-in">
                    <h2 class="text-3xl md:text-4xl font-extrabold mb-4">{{ __('all.get_mobile_app') }}</h2>
                    <p class="mb-6 text-indigo-100 max-w-md">{{ __('all.app_description') }}</p>
                    
                    <div class="flex flex-col sm:flex-row space-y-4 sm:space-y-0 sm:space-x-4">
                        <button type="button" class="bg-black/90 hover:bg-black text-white px-6 py-3 rounded-xl flex items-center justify-center transition-all glass-card">
                            <i class="fab fa-apple text-2xl mr-3"></i>
                            <div class="text-left">
                                <div class="text-xs text-gray-300">{{ __('all.download_on_the') }}</div>
                                <div class="font-bold">{{ __('all.app_store') }}</div>
                            </div>
                        </button>
                        <button type="button" class="bg-black/90 hover:bg-black text-white px-6 py-3 rounded-xl flex items-center justify-center transition-all glass-card">
                            <i class="fab fa-google-play text-2xl mr-3"></i>
                            <div class="text-left">
                                <div class="text-xs text-gray-300">{{ __('all.get_it_on') }}</div>
                                <div class="font-bold">{{ __('all.google_play') }}</div>
                            </div>
                        </button>
                    </div>
                    
                    <div class="mt-8 flex items-center space-x-4">
                        <div class="flex -space-x-2">
                            <img src="{{ asset('testimonials/IMG-20251015-WA0005.jpg') }}" class="w-10 h-10 rounded-full border-2 border-white" alt="{{ __('all.user_alt_text') }}">
                            <img src="{{ asset('testimonials/IMG-20251016-WA0000.jpg') }}" class="w-10 h-10 rounded-full border-2 border-white" alt="{{ __('all.user_alt_text') }}">
                            <img src="{{ asset('testimonials/IMG-20251017-WA0005.jpg') }}" class="w-10 h-10 rounded-full border-2 border-white" alt="{{ __('all.user_alt_text') }}">
                        </div>
                        <div class="text-sm text-indigo-100">
                            <div class="font-medium">{{ __('all.join_happy_users') }}</div>
                            <div class="flex text-yellow-400 text-xs">
                                <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i>
                                <span class="text-indigo-200 ml-1">{{ __('all.reviews_4_8') }}</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="md:w-1/2 flex justify-center relative fade-in delay-200">
                    <img src="https://cdn.pixabay.com/photo/2017/01/22/12/07/imac-1999636_1280.png" alt="{{ __('all.mobile_app_alt_text') }}" class="w-64 h-auto floating">
                    <div class="absolute -right-10 -top-10 w-32 h-32 bg-indigo-400/20 rounded-full filter blur-xl"></div>
                    <div class="absolute left-10 bottom-0 w-40 h-40 bg-pink-400/20 rounded-full filter blur-xl"></div>
                </div>
            </div>
        </div>
    </section>
