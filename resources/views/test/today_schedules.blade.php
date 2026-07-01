@php
    $busClassLabels = [
        '10' => __('all.luxury'),
        '20' => __('all.upper_semiluxury'),
        '30' => __('all.lower_semiluxury'),
        '40' => __('all.ordinary'),
    ];
    $scheduleCount = ($todaySchedules ?? collect())->count();
    $showExploreLink = $showExploreLink ?? false;
    $showSectionHeader = $showSectionHeader ?? true;
@endphp

<section id="routes" class="home-schedules {{ !empty($sectionClass) ? $sectionClass : '' }}">
    <div class="container mx-auto px-4">
        @if ($showSectionHeader)
            <div class="home-schedules__header fade-in">
                <div>
                    <h2 class="home-schedules__title">Today's <span>Schedules</span></h2>
                    <p class="home-schedules__subtitle">Live departures for {{ now()->format('l, F j, Y') }}</p>
                </div>
                @if ($scheduleCount > 0)
                    <div class="home-schedules__badge" aria-label="{{ $scheduleCount }} departures today">
                        <i class="fas fa-bus" aria-hidden="true"></i>
                        {{ $scheduleCount }} {{ $scheduleCount === 1 ? 'departure' : 'departures' }}
                    </div>
                @endif
            </div>
        @endif

        <div class="home-schedules__grid">
            @forelse ($todaySchedules ?? [] as $schedule)
                @php
                    $from = $schedule->from ?? $schedule->route->from ?? 'N/A';
                    $to = $schedule->to ?? $schedule->route->to ?? 'N/A';
                    $startTime = $schedule->start ? \Carbon\Carbon::parse($schedule->start)->format('g:i A') : 'N/A';
                    $endTime = $schedule->end ? \Carbon\Carbon::parse($schedule->end)->format('g:i A') : 'N/A';
                    $scheduleDate = $schedule->schedule_date ? \Carbon\Carbon::parse($schedule->schedule_date)->format('d M Y') : 'N/A';
                    $operator = $schedule->bus->campany->name ?? $schedule->bus->busname->name ?? 'Highlink ISGC';
                    $busType = isset($schedule->bus->bus_type) && array_key_exists($schedule->bus->bus_type, $busClassLabels)
                        ? $busClassLabels[$schedule->bus->bus_type]
                        : null;
                    $price = $schedule->route->price ?? null;
                    $durationText = null;
                    if ($schedule->start && $schedule->end) {
                        try {
                            $start = \Carbon\Carbon::parse($schedule->start);
                            $end = \Carbon\Carbon::parse($schedule->end);
                            if ($end->lessThan($start)) {
                                $end->addDay();
                            }
                            $mins = $start->diffInMinutes($end);
                            $durationText = sprintf('%dh %dm', floor($mins / 60), $mins % 60);
                        } catch (\Exception $e) {
                            $durationText = null;
                        }
                    }
                @endphp
                <article class="home-schedule-card fade-in">
                    <div class="home-schedule-card__head">
                        <span class="home-schedule-card__operator">{{ $operator }}</span>
                        @if ($busType)
                            <span class="home-schedule-card__class">{{ $busType }}</span>
                        @endif
                    </div>

                    <div class="home-schedule-card__route">
                        <div class="home-schedule-card__city">
                            <span class="home-schedule-card__time">{{ $startTime }}</span>
                            <span class="home-schedule-card__name">{{ $from }}</span>
                        </div>
                        <div class="home-schedule-card__connector" aria-hidden="true">
                            <span class="home-schedule-card__line"></span>
                            <span class="home-schedule-card__icon"><i class="fas fa-bus"></i></span>
                            @if ($durationText)
                                <span class="home-schedule-card__duration">{{ $durationText }}</span>
                            @endif
                        </div>
                        <div class="home-schedule-card__city home-schedule-card__city--arrival">
                            <span class="home-schedule-card__time">{{ $endTime }}</span>
                            <span class="home-schedule-card__name">{{ $to }}</span>
                        </div>
                    </div>

                    <div class="home-schedule-card__meta">
                        <span><i class="fas fa-hashtag" aria-hidden="true"></i> Bus {{ $schedule->bus->bus_number ?? 'N/A' }}</span>
                        <span><i class="fas fa-calendar-day" aria-hidden="true"></i> {{ $scheduleDate }}</span>
                    </div>

                    <div class="home-schedule-card__foot">
                        <div class="home-schedule-card__price">
                            @if ($price)
                                <small>{{ __('all.from_price') }}</small>
                                <strong>TZS {{ number_format($price) }}</strong>
                            @else
                                <small>Available today</small>
                                <strong>Book your seat</strong>
                            @endif
                        </div>
                        <a href="{{ route('booking_form', ['id' => $schedule->bus_id, 'from' => $from, 'to' => $to]) }}"
                            class="home-schedule-card__btn">
                            Book Now <i class="fas fa-arrow-right" aria-hidden="true"></i>
                        </a>
                    </div>
                </article>
            @empty
                <div class="home-schedules__empty fade-in">
                    <div class="home-schedules__empty-icon" aria-hidden="true"><i class="fas fa-bus"></i></div>
                    <h3>No departures today</h3>
                    <p>There are no buses scheduled for today yet. Search your route above or browse popular destinations.</p>
                    <a href="{{ route('routes') }}" class="home-schedules__empty-link">
                        Browse Popular Routes <i class="fas fa-route" aria-hidden="true"></i>
                    </a>
                </div>
            @endforelse
        </div>

        @if ($showExploreLink && $scheduleCount > 0)
            <div class="home-schedules__footer fade-in">
                <a href="{{ route('schedules.today') }}" class="home-schedules__explore">
                    View All Today's Schedules <i class="fas fa-arrow-right" aria-hidden="true"></i>
                </a>
            </div>
        @endif
    </div>
</section>
