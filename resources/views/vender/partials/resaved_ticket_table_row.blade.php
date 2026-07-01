@php
    $isRoundTrip = ($row['type'] ?? 'single') === 'round_trip_resaved';
    $book = $row['primary'];
    $legs = $isRoundTrip ? ($row['bookings'] ?? []) : [$book];
    $totalAmount = $isRoundTrip
        ? collect($legs)->sum(fn ($leg) => (float) $leg->amount)
        : (float) $book->amount;
@endphp
<tr>
    <td class="tickets-table__col-no" data-label="#">{{ $rowNumber }}</td>
    <td data-label="{{ __('vender/resaved_tickets.booking_code') }}">
        @if ($isRoundTrip)
            <div class="tickets-table__code-group">
                @foreach ($legs as $leg)
                    <span class="tickets-table__code">{{ $leg->booking_code }}</span>
                @endforeach
                <span class="home-bus-row__class home-bus-row__class--round">{{ __('all.round_trip') }}</span>
            </div>
        @else
            <span class="tickets-table__code">{{ $book->booking_code }}</span>
        @endif
    </td>
    <td data-label="{{ __('vender/resaved_tickets.customer_name') }}">{{ $book->customer_name ?? '—' }}</td>
    <td data-label="{{ __('vender/resaved_tickets.route') }}">
        @if ($isRoundTrip)
            <div class="tickets-table__dates-stack">
                @foreach ($legs as $leg)
                    <span>
                        {{ ($leg->schedule->from ?? $leg->pickup_point ?? '—') }}
                        →
                        {{ ($leg->schedule->to ?? $leg->dropping_point ?? '—') }}
                    </span>
                @endforeach
            </div>
        @else
            {{ ($book->schedule->from ?? $book->pickup_point ?? '—') }}
            →
            {{ ($book->schedule->to ?? $book->dropping_point ?? '—') }}
        @endif
    </td>
    <td data-label="{{ __('vender/resaved_tickets.travel_date') }}">
        @if ($isRoundTrip)
            <div class="tickets-table__dates-stack">
                @foreach ($legs as $leg)
                    <span>{{ $leg->travel_date ?? '—' }}</span>
                @endforeach
            </div>
        @else
            {{ $book->travel_date ?? '—' }}
        @endif
    </td>
    <td data-label="{{ __('vender/resaved_tickets.seats') }}">
        @if ($isRoundTrip)
            <div class="tickets-table__dates-stack">
                @foreach ($legs as $leg)
                    <span>{{ $leg->seat ?? '—' }}</span>
                @endforeach
            </div>
        @else
            {{ $book->seat ?? '—' }}
        @endif
    </td>
    <td data-label="{{ __('vender/resaved_tickets.amount') }}">
        <span class="tickets-table__price">{{ number_format($totalAmount, 0) }} {{ $currency }}</span>
    </td>
    <td data-label="{{ __('vender/resaved_tickets.resaved_until') }}">
        {{ $book->resaved_until ? \Carbon\Carbon::parse($book->resaved_until)->format('M j, Y g:i A') : '—' }}
    </td>
    <td data-label="{{ __('vender/resaved_tickets.status') }}">
        @include('customer.partials.ticket_status', ['book' => $book])
    </td>
    <td class="tickets-table__col-actions" data-label="{{ __('vender/resaved_tickets.actions') }}">
        @include('vender.partials.resaved_ticket_actions', ['book' => $book])
    </td>
</tr>
