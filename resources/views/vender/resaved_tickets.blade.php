@extends('vender.app')

@section('title', __('vender/resaved_tickets.title'))

@section('content')
<div class="vendor-dash fade-in">
    <header class="vendor-dash__header">
        <div class="vendor-dash__welcome">
            <p class="vendor-dash__eyebrow">{{ __('all.highlink_isgc') }}</p>
            <h1 class="vendor-dash__title">{{ __('vender/resaved_tickets.title') }}</h1>
            <p class="vendor-dash__subtitle">{{ __('vender/resaved_tickets.subtitle') }}</p>
        </div>
        <div class="vendor-dash__actions">
            <a href="{{ route('vender.route') }}" class="page-btn">
                <i class="fas fa-ticket"></i> {{ __('assistance/sidebar.book_ticket') }}
            </a>
            <a href="{{ route('vender.history') }}" class="page-btn page-btn--outline">
                <i class="fas fa-clock-rotate-left"></i> {{ __('assistance/sidebar.booking_history') }}
            </a>
        </div>
    </header>

    <section class="vendor-table-card">
        <div class="vendor-table-card__head">
            <div class="vendor-table-card__title-wrap">
                <h3>{{ __('vender/resaved_tickets.title') }}</h3>
                <p>{{ $bookings->total() }} {{ __('vender/resaved_tickets.title') }}</p>
            </div>
        </div>

        <div class="vendor-table-card__body p-4 sm:p-6">
            @if (session('success'))
                <div class="customer-alert customer-alert--success mb-4" role="alert">
                    {{ session('success') }}
                </div>
            @endif
            @if (session('error'))
                <div class="customer-alert customer-alert--error mb-4" role="alert">
                    {{ session('error') }}
                </div>
            @endif

                @if ($bookings->isEmpty())
                <div class="tickets-empty">
                    <div class="tickets-empty__icon"><i class="fas fa-bookmark"></i></div>
                    <h4 class="tickets-empty__title">{{ __('vender/resaved_tickets.no_tickets') }}</h4>
                    <a href="{{ route('vender.route') }}" class="page-btn mt-4">
                        <i class="fas fa-bus"></i> {{ __('assistance/sidebar.book_ticket') }}
                    </a>
                </div>
            @else
                <div class="tickets-table-wrap page-table-wrap">
                    <table class="page-table tickets-table">
                        <thead>
                            <tr>
                                <th class="tickets-table__col-no">#</th>
                                <th>{{ __('vender/resaved_tickets.booking_code') }}</th>
                                <th>{{ __('vender/resaved_tickets.customer_name') }}</th>
                                <th>{{ __('vender/resaved_tickets.route') }}</th>
                                <th>{{ __('vender/resaved_tickets.travel_date') }}</th>
                                <th>{{ __('vender/resaved_tickets.seats') }}</th>
                                <th>{{ __('vender/resaved_tickets.amount') }}</th>
                                <th>{{ __('vender/resaved_tickets.resaved_until') }}</th>
                                <th>{{ __('vender/resaved_tickets.status') }}</th>
                                <th class="tickets-table__col-actions">{{ __('vender/resaved_tickets.actions') }}</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($bookings as $row)
                                @include('vender.partials.resaved_ticket_table_row', [
                                    'row' => $row,
                                    'rowNumber' => $loop->iteration + ($bookings->currentPage() - 1) * $bookings->perPage(),
                                ])
                            @endforeach
                        </tbody>
                    </table>
                </div>

                <div class="mt-4">
                    {{ $bookings->links() }}
                </div>
            @endif
        </div>
    </section>
</div>
@endsection
