@extends('system.app')

@section('title', __('system.dashboard.overview'))

@section('content')
<div class="row mb-4">
    <div class="col-md-4">
        <div class="card text-center p-4">
            <h5 class="card-title">{{ __('system.pages.legacy_today_total') }}</h5>
            <h2 class="card-text text-success">{{ $currency }} {{ convert_money($todayAmount) }}</h2>
        </div>
    </div>

    <div class="col-md-4">
        <div class="card text-center p-4">
            <h5 class="card-title">{{ __('system.pages.legacy_system_total') }}</h5>
            <h2 class="card-text text-success">{{ $currency }} {{ convert_money($system) }}</h2>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-12">
        <div class="card p-4">
            <h5 class="card-title text-center">{{ __('system.pages.legacy_weekly_amounts') }}</h5>
            <div class="chart-container">
                <canvas id="weeklyChart"></canvas>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">{{ __('system.pages.legacy_today_bookings') }}</h5>
                @if($bookings->isEmpty())
                    <p class="text-muted">{{ __('system.pages.legacy_no_bookings') }}</p>
                @else
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>{{ __('system.common.booking_code') }}</th>
                                    <th>{{ __('system.common.customer') }}</th>
                                    <th>{{ __('system.common.company') }}</th>
                                    <th>{{ __('system.common.route') }}</th>
                                    <th>{{ __('system.common.amount') }}</th>
                                    <th>{{ __('system.common.status') }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($bookings as $booking)
                                    <tr>
                                        <td>{{ $booking->booking_code }}</td>
                                        <td>{{ $booking->customer_name }}</td>
                                        <td>{{ $booking->campany->name ?? __('system.common.na') }}</td>
                                        <td>{{ $booking->pickup_point }}-{{ $booking->dropping_point }}</td>
                                        <td>{{ $currency }} {{ convert_money($booking->amount) }}</td>
                                        <td>{{ $booking->payment_status }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                @endif
            </div>
        </div>
    </div>
</div>
@endsection
