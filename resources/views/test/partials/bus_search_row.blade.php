@php
    $busClassLabels = [
        '10' => __('all.luxury'),
        '20' => __('all.upper_semiluxury'),
        '30' => __('all.lower_semiluxury'),
        '40' => __('all.ordinary'),
    ];

    $from = $bus->schedule->from ?? 'N/A';
    $to = $bus->schedule->to ?? 'N/A';
    $startTime = $bus->schedule->start
        ? \Carbon\Carbon::parse($bus->schedule->start)->format('g:i A')
        : 'N/A';
    $endTime = $bus->schedule->end
        ? \Carbon\Carbon::parse($bus->schedule->end)->format('g:i A')
        : 'N/A';
    $busType = isset($bus->bus_type) && array_key_exists($bus->bus_type, $busClassLabels)
        ? $busClassLabels[$bus->bus_type]
        : null;
    $durationText = null;

    if ($bus->schedule->start && $bus->schedule->end) {
        try {
            $start = \Carbon\Carbon::parse($bus->schedule->start);
            $end = \Carbon\Carbon::parse($bus->schedule->end);
            if ($end->lessThan($start)) {
                $end->addDay();
            }
            $mins = $start->diffInMinutes($end);
            $durationText = sprintf('%dh %dm', floor($mins / 60), $mins % 60);
        } catch (\Exception $e) {
            $durationText = null;
        }
    }

    $remainSeats = $bus->remain_seats ?? null;
    $isSoldOut = $remainSeats !== null && (int) $remainSeats === 0;
    $isLowSeats = $remainSeats !== null && (int) $remainSeats > 0 && (int) $remainSeats <= 5;
    $price = $bus->route->price ?? 0;
    $scheduleDate = !empty($bus->schedule->schedule_date)
        ? \Carbon\Carbon::parse($bus->schedule->schedule_date)->format('D, M d, Y')
        : null;
    $br = booking_routes();
    $inlineFormUrl = route($br['inline_form'], ['id' => $bus->id, 'from' => $from, 'to' => $to]);
    if (!empty($bus->schedule->schedule_date)) {
        $inlineFormUrl .= '?departure_date=' . \Carbon\Carbon::parse($bus->schedule->schedule_date)->format('Y-m-d');
    }
    $rowKey = $bus->id . '-' . md5($from . $to . ($bus->schedule->schedule_date ?? ''));
@endphp

<div class="home-bus-row-wrap" data-inline-row="{{ $rowKey }}">
<article class="home-bus-row fade-in {{ $isSoldOut ? 'home-bus-row--sold-out' : '' }}">
    <div class="home-bus-row__operator">
        <span class="home-bus-row__operator-name">{{ $bus->busname->name ?? 'N/A' }}</span>
        @if ($busType)
            <span class="home-bus-row__class">{{ $busType }}</span>
        @endif
    </div>

    <div>
        <div class="home-bus-row__route">
            <div class="home-bus-row__city">
                <span class="home-bus-row__time">{{ $startTime }}</span>
                <span class="home-bus-row__name">{{ $from }}</span>
            </div>
            <div class="home-bus-row__connector" aria-hidden="true">
                <span class="home-bus-row__line"></span>
                <span class="home-bus-row__icon"><i class="fas fa-bus"></i></span>
                @if ($durationText)
                    <span class="home-bus-row__duration">{{ $durationText }}</span>
                @endif
            </div>
            <div class="home-bus-row__city home-bus-row__city--arrival">
                <span class="home-bus-row__time">{{ $endTime }}</span>
                <span class="home-bus-row__name">{{ $to }}</span>
            </div>
        </div>

        @if ($remainSeats !== null || $scheduleDate)
            <p class="home-bus-row__meta">
                @if ($scheduleDate)
                    <span class="mr-4"><i class="fas fa-calendar-day" aria-hidden="true"></i> {{ $scheduleDate }}</span>
                @endif
                @if ($remainSeats !== null)
                    <span>
                        <i class="fas fa-chair" aria-hidden="true"></i>
                        <span class="{{ $isSoldOut ? 'home-bus-row__seats--none' : ($isLowSeats ? 'home-bus-row__seats--low' : '') }}">
                            @if ($isSoldOut)
                                {{ __('all.sold_out') }}
                            @else
                                {{ $remainSeats == 1 ? __('all.seats_left_one', ['count' => $remainSeats]) : __('all.seats_left_many', ['count' => $remainSeats]) }}
                            @endif
                        </span>
                    </span>
                @endif
            </p>
        @endif
    </div>

    <div class="home-bus-row__commerce">
        <div class="home-bus-row__price">
            <small>{{ __('all.from_price') }}</small>
            <strong>{{ $currency }} {{ convert_money($price) }}</strong>
        </div>

        @if ($isSoldOut)
            <span class="home-bus-row__badge-sold">{{ __('all.sold_out') }}</span>
        @else
            <button type="button"
                class="home-bus-row__btn"
                data-inline-book
                data-inline-url="{{ $inlineFormUrl }}"
                aria-expanded="false">
                {{ __('all.book_button') }} <i class="fas fa-arrow-right" aria-hidden="true"></i>
            </button>
        @endif
    </div>
</article>

<div class="home-bus-row__expand" hidden>
    <div class="home-bus-row__expand-inner">
        <div class="inline-booking-loading hidden">
            <i class="fas fa-spinner fa-spin"></i> {{ __('all.loading') }}
        </div>
    </div>
</div>
</div>
