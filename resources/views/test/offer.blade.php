<section class="py-20 bg-white relative overflow-hidden">
        <div class="bubble w-64 h-64 bg-indigo-100 top-1/4 -left-20"></div>
        <div class="bubble w-96 h-96 bg-pink-100 bottom-0 -right-40"></div>
        
        <div class="container mx-auto px-4 relative z-10">
            <div class="text-center mb-12 fade-in">
                <h2 class="text-3xl md:text-4xl font-extrabold mb-4">{{ __('all.exclusive_offers') }}</h2>
                <p class="text-gray-600 max-w-2xl mx-auto text-lg">{{ __('all.limited_time_deals') }}</p>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                <div class="glass-card p-8 relative overflow-hidden h-64 flex items-center fade-in delay-100">
                    <div class="absolute inset-0 bg-gradient-to-r from-indigo-500 to-purple-500 z-0"></div>
                    <div class="relative z-10 max-w-md">
                        <div class="bg-white/20 text-xs uppercase tracking-wider px-3 py-1 rounded-full inline-block mb-3 text-white backdrop-blur-sm">{{ __('all.summer_special') }}</div>
                        <h3 class="font-bold text-3xl mb-3 text-white">{{ __('all.off_20') }}</h3>
                        <p class="mb-6 text-white/90">{{ __('all.book_before_august') }}</p>
                        <a href="#search" class="inline-block px-6 py-3 bg-white text-indigo-600 rounded-lg font-medium hover:bg-gray-100 transition-all btn-glow">
                            {{ __('all.book_now') }} <i class="fas fa-arrow-right ml-2"></i>
                        </a>
                    </div>
                </div>

                <div class="glass-card p-8 relative overflow-hidden h-64 flex items-center fade-in delay-200">
                    <div class="absolute inset-0 bg-gradient-to-r from-pink-500 to-rose-500 z-0"></div>
                    <div class="relative z-10 max-w-md">
                        <div class="bg-white/20 text-xs uppercase tracking-wider px-3 py-1 rounded-full inline-block mb-3 text-white backdrop-blur-sm">{{ __('all.group_discount') }}</div>
                        <h3 class="font-bold text-3xl mb-3 text-white">{{ __('all.off_15') }}</h3>
                        <p class="mb-6 text-white/90">{{ __('all.book_for_travelers_save') }}</p>
                        <a href="#search" class="inline-block px-6 py-3 bg-white text-pink-600 rounded-lg font-medium hover:bg-gray-100 transition-all btn-glow">
                            {{ __('all.book_now') }} <i class="fas fa-arrow-right ml-2"></i>
                        </a>
                    </div>
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mt-6">
                <div class="glass-card p-6 flex items-center fade-in delay-300">
                    <div class="bg-indigo-100/50 p-3 rounded-lg mr-4">
                        <i class="fas fa-user-graduate text-indigo-600 text-xl"></i>
                    </div>
                    <div>
                        <h3 class="font-bold mb-1">{{ __('all.student_discount') }}</h3>
                        <p class="text-gray-600 text-sm">{{ __('all.student_discount_description') }}</p>
                    </div>
                </div>

                <div class="glass-card p-6 flex items-center fade-in delay-400">
                    <div class="bg-pink-100/50 p-3 rounded-lg mr-4">
                        <i class="fas fa-calendar-check text-pink-600 text-xl"></i>
                    </div>
                    <div>
                        <h3 class="font-bold mb-1">{{ __('all.early_bird') }}</h3>
                        <p class="text-gray-600 text-sm">{{ __('all.early_bird_description') }}</p>
                    </div>
                </div>

                <div class="glass-card p-6 flex items-center fade-in delay-500">
                    <div class="bg-purple-100/50 p-3 rounded-lg mr-4">
                        <i class="fas fa-birthday-cake text-purple-600 text-xl"></i>
                    </div>
                    <div>
                        <h3 class="font-bold mb-1">{{ __('all.birthday_special') }}</h3>
                        <p class="text-gray-600 text-sm">{{ __('all.birthday_special_description') }}</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
