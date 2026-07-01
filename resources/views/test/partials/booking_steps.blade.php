@php
    $currentStep = $currentStep ?? 1;
    $interactive = $interactive ?? false;
    $steps = $steps ?? [
        1 => ['label' => 'Pickup & Drop', 'icon' => 'fa-map-marker-alt', 'key' => 'pickup'],
        2 => ['label' => 'Select Seats', 'icon' => 'fa-chair', 'key' => 'seats'],
        3 => ['label' => 'Payment', 'icon' => 'fa-credit-card', 'key' => 'payment'],
    ];
@endphp

<nav class="booking-steps fade-in {{ $interactive ? 'booking-steps--interactive' : '' }}"
    aria-label="Booking progress"
    @if ($interactive) data-inline-timeline @endif>
    @foreach ($steps as $num => $step)
        @php
            $stepKey = $step['key'] ?? ('step' . $num);
            $isActive = $num === $currentStep;
            $isDone = $num < $currentStep;
            $itemClass = 'booking-steps__item'
                . ($isActive ? ' booking-steps__item--active' : '')
                . ($isDone ? ' booking-steps__item--done' : '');
        @endphp

        @if ($interactive)
            <button type="button"
                class="{{ $itemClass }}"
                data-booking-step="{{ $stepKey }}"
                @if (!$isDone) disabled @endif
                aria-current="{{ $isActive ? 'step' : 'false' }}"
                aria-label="{{ $isDone ? 'Go back to ' . $step['label'] : $step['label'] }}">
                <span class="booking-steps__dot" aria-hidden="true">
                    @if ($isDone)
                        <i class="fas fa-check"></i>
                    @else
                        <i class="fas {{ $step['icon'] }}"></i>
                    @endif
                </span>
                <span class="booking-steps__label">{{ $step['label'] }}</span>
            </button>
        @else
            <div class="{{ $itemClass }}">
                <span class="booking-steps__dot" aria-hidden="true">
                    @if ($isDone)
                        <i class="fas fa-check"></i>
                    @else
                        <i class="fas {{ $step['icon'] }}"></i>
                    @endif
                </span>
                <span class="booking-steps__label">{{ $step['label'] }}</span>
            </div>
        @endif

        @if (!$loop->last)
            <span class="booking-steps__line" aria-hidden="true"></span>
        @endif
    @endforeach
</nav>
