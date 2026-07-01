@extends('vender.app')

@section('title', __('all.parcels'))

@php
    $stats = $parcelStats ?? ['total' => 0, 'amount' => 0, 'today' => 0, 'assigned' => 0];
@endphp

@section('content')
<div class="vendor-dash fade-in">
    <header class="vendor-dash__header">
        <div class="vendor-dash__welcome">
            <p class="vendor-dash__eyebrow">{{ __('all.highlink_isgc') }}</p>
            <h1 class="vendor-dash__title">{{ __('all.parcels') }}</h1>
            <p class="vendor-dash__subtitle">{{ __('assistance/sidebar.vendor_panel') }} · {{ $stats['total'] }} {{ __('vender/busroot.entries') }}</p>
        </div>
        <div class="vendor-dash__actions">
            <a href="{{ route('vender.parcels.find_bus') }}" class="page-btn">
                <i class="fas fa-plus"></i> Add New Parcel
            </a>
            <a href="{{ route('vender.index') }}" class="page-btn page-btn--outline">
                <i class="fas fa-gauge-high"></i> {{ __('assistance/sidebar.dashboard') }}
            </a>
        </div>
    </header>

    <div class="vendor-kpi-grid">
        <article class="vendor-kpi vendor-kpi--schedules">
            <div class="vendor-kpi__top">
                <div class="vendor-kpi__icon"><i class="fas fa-box"></i></div>
                <span class="vendor-kpi__badge">{{ __('all.parcels') }}</span>
            </div>
            <p class="vendor-kpi__label">Total parcels</p>
            <p class="vendor-kpi__value">{{ number_format($stats['total']) }}</p>
            <p class="vendor-kpi__hint">All time</p>
        </article>

        <article class="vendor-kpi vendor-kpi--commission">
            <div class="vendor-kpi__top">
                <div class="vendor-kpi__icon"><i class="fas fa-coins"></i></div>
                <span class="vendor-kpi__badge">Revenue</span>
            </div>
            <p class="vendor-kpi__label">Amount collected</p>
            <p class="vendor-kpi__value">{{ convert_money($stats['amount']) }}</p>
            <p class="vendor-kpi__hint">{{ $currency }}</p>
        </article>

        <article class="vendor-kpi vendor-kpi--week">
            <div class="vendor-kpi__top">
                <div class="vendor-kpi__icon"><i class="fas fa-calendar-day"></i></div>
                <span class="vendor-kpi__badge">{{ __('assistance/dashboard.today') }}</span>
            </div>
            <p class="vendor-kpi__label">Added today</p>
            <p class="vendor-kpi__value">{{ number_format($stats['today']) }}</p>
            <p class="vendor-kpi__hint">New parcels</p>
        </article>

        <article class="vendor-kpi vendor-kpi--pending">
            <div class="vendor-kpi__top">
                <div class="vendor-kpi__icon"><i class="fas fa-truck-loading"></i></div>
                <span class="vendor-kpi__badge">Assigned</span>
            </div>
            <p class="vendor-kpi__label">Pending on bus</p>
            <p class="vendor-kpi__value">{{ number_format($stats['assigned']) }}</p>
            <p class="vendor-kpi__hint">Awaiting dispatch</p>
        </article>
    </div>

    @if(session('success'))
        <div class="booking-alert booking-alert--success mb-4 mx-0" role="alert">
            <i class="fas fa-check-circle mr-2"></i>{{ session('success') }}
        </div>
    @endif

    <section class="vendor-table-card">
        <div class="vendor-table-card__head">
            <div class="vendor-table-card__title-wrap">
                <h3>Parcel registry</h3>
                <p>{{ $parcels->count() }} on this page · {{ $parcels->total() }} total</p>
            </div>
        </div>

        <div class="vendor-table-toolbar">
            <div class="vendor-search-wrap">
                <i class="fas fa-search"></i>
                <input type="text" id="parcelSearch" class="page-input text-sm" placeholder="Search parcel no, bus, type…">
            </div>
        </div>

        @if($parcels->isEmpty())
            <div class="vendor-table-empty">
                <i class="fas fa-box-open"></i>
                <h4>No parcels found</h4>
                <p>Register a parcel and assign it to a departing bus.</p>
                <a href="{{ route('vender.parcels.find_bus') }}" class="page-btn">Add New Parcel</a>
            </div>
        @else
            <div class="overflow-x-auto">
                <table class="vendor-dash-table" id="parcelsTable">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Parcel No</th>
                            <th>Type</th>
                            <th>Bus</th>
                            <th>Travel</th>
                            <th>Amount</th>
                            <th>Date added</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($parcels as $parcel)
                            <tr class="parcel-row">
                                <td class="row-index text-gray-400">{{ ($parcels->currentPage() - 1) * $parcels->perPage() + $loop->iteration }}</td>
                                <td><span class="font-semibold">{{ $parcel->parcel_number }}</span></td>
                                <td><span class="vendor-tx-method">{{ $parcel->parcel_type }}</span></td>
                                <td>
                                    <span class="vendor-schedule-busno">{{ $parcel->bus->bus_number ?? '—' }}</span>
                                    <span class="vendor-schedule-date__sub block">{{ $parcel->bus->campany->name ?? '—' }}</span>
                                </td>
                                <td>
                                    @if($parcel->bus && $parcel->bus->schedule)
                                        <span class="vendor-schedule-date__day">{{ \Carbon\Carbon::parse($parcel->bus->schedule->schedule_date)->format('d M Y') }}</span>
                                        <span class="vendor-schedule-date__sub block">{{ \Carbon\Carbon::parse($parcel->bus->schedule->start)->format('h:i A') }}</span>
                                    @else
                                        <span class="text-gray-400">Not scheduled</span>
                                    @endif
                                </td>
                                <td class="vendor-tx-amount">{{ $currency }} {{ convert_money($parcel->amount_paid) }}</td>
                                <td>
                                    <span class="vendor-schedule-date__day">{{ $parcel->created_at->format('d M Y') }}</span>
                                    <span class="vendor-schedule-date__sub block">{{ $parcel->created_at->format('h:i A') }}</span>
                                </td>
                                <td>
                                    @php
                                        $statusKey = strtolower($parcel->status ?? 'pending');
                                        $statusClass = $statusKey === 'completed' ? 'vendor-status--paid' : ($statusKey === 'cancelled' ? 'vendor-status--other' : 'vendor-status--unpaid');
                                    @endphp
                                    <span class="vendor-status {{ $statusClass }}">{{ ucfirst($parcel->status ?? 'pending') }}</span>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>

            @if($parcels->hasPages())
                <div class="vendor-table-footer">
                    <p class="vendor-table-footer__info">{{ __('vender/busroot.showing') }} {{ $parcels->firstItem() }} {{ __('vender/busroot.to') }} {{ $parcels->lastItem() }} {{ __('vender/busroot.of') }} {{ $parcels->total() }}</p>
                    <div>{{ $parcels->links() }}</div>
                </div>
            @endif
        @endif
    </section>
</div>
@endsection

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function () {
    const input = document.getElementById('parcelSearch');
    const rows = Array.from(document.querySelectorAll('.parcel-row'));
    if (!input || !rows.length) return;
    input.addEventListener('input', function () {
        const term = this.value.toLowerCase().trim();
        rows.forEach(function (row) {
            row.style.display = !term || row.textContent.toLowerCase().includes(term) ? '' : 'none';
        });
    });
});
</script>
@endpush
