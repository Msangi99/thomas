<section id="routes" class="py-20 bg-white relative overflow-hidden">
    <div class="bubble w-80 h-80 bg-indigo-100 -top-40 -right-40"></div>
    <div class="bubble w-64 h-64 bg-pink-100 bottom-20 -left-20"></div>

    <div class="container mx-auto px-4 relative z-10">
        <div class="text-center mb-12 fade-in">
            <h2 class="text-3xl md:text-4xl font-extrabold mb-4">Available <span class="gradient-text">Schedules</span></h2>
            <p class="text-gray-600 max-w-2xl mx-auto text-lg">Today's bus schedules – real-time data from our system</p>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
            @forelse ($todaySchedules ?? [] as $schedule)
                @php
                    $from = $schedule->from ?? $schedule->route->from ?? 'N/A';
                    $to = $schedule->to ?? $schedule->route->to ?? 'N/A';
                    $startTime = $schedule->start ? \Carbon\Carbon::parse($schedule->start)->format('g:i A') : 'N/A';
                    $endTime = $schedule->end ? \Carbon\Carbon::parse($schedule->end)->format('g:i A') : 'N/A';
                    $scheduleDate = $schedule->schedule_date ? \Carbon\Carbon::parse($schedule->schedule_date)->format('d M Y') : 'N/A';
                @endphp
                <div class="glass-card p-6 route-card fade-in delay-100">
                    <h3 class="font-bold">{{ $schedule->bus->campany->name ?? $schedule->bus->busname->name ?? 'N/A' }}</h3>
                    <div class="flex justify-between items-start mb-4">
                        <div>
                            <h3 class="font-bold text-xl">{{ $from }}</h3>
                            <p class="text-gray-600 text-sm">to</p>
                            <h3 class="font-bold text-xl">{{ $to }}</h3>
                        </div>
                        <div class="bg-indigo-100/50 p-2 rounded-lg">
                            <i class="fas fa-bus text-indigo-600 text-xl"></i>
                        </div>
                    </div>
                    <div class="flex items-center text-sm text-gray-500 mb-2">
                        <i class="fas fa-clock mr-2"></i>
                        <span>{{ $startTime }} – {{ $endTime }}</span>
                    </div>
                    <div class="flex items-center text-sm text-gray-500 mb-3">
                        <i class="fas fa-calendar-day mr-2"></i>
                        <span>{{ $scheduleDate }}</span>
                    </div>
                    <div class="text-xs text-gray-500 mb-3">Bus {{ $schedule->bus->bus_number ?? 'N/A' }}</div>
                    <a href="{{ route('booking_form', ['id' => $schedule->bus_id, 'from' => $from, 'to' => $to]) }}"
                        class="w-full py-2 px-3 bg-gradient-to-r from-indigo-500 to-purple-500 hover:from-indigo-600 hover:to-purple-600 text-white rounded-lg transition-all btn-glow text-center block">
                        Book Now <i class="fas fa-arrow-right ml-1"></i>
                    </a>
                </div>
            @empty
                <div class="col-span-full text-center py-8 text-gray-500">
                    <i class="fas fa-bus text-4xl mb-3 opacity-50"></i>
                    <p>No schedules for today. Check back later or search for your route above.</p>
                </div>
            @endforelse
        </div>
        <div class="text-center mt-10 fade-in delay-500">
            <a href="{{ route('schedules.today') }}" class="px-6 py-3 border border-white/80 text-white rounded-lg hover:bg-white/10 font-medium transition-all btn-glow inline-block">
                Explore All Routes <i class="fas fa-route ml-2"></i>
            </a>
        </div>
    </div>
</section>
