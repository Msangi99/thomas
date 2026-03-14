@extends('system.app')

@section('title', $campany->name . ' - Dashboard')

@section('content')
<div class="min-h-screen bg-slate-50/80">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {{-- Back + Header --}}
        <div class="mb-8">
            <a href="{{ route('system.campany') }}" class="inline-flex items-center text-sm text-slate-600 hover:text-indigo-600 mb-4 transition-colors">
                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/></svg>
                Back to Bus Operators
            </a>
            <div class="flex flex-wrap items-center justify-between gap-4">
                <div class="flex items-center gap-4">
                    <div class="campany-dash-icon w-14 h-14 rounded-2xl bg-gradient-to-br from-indigo-500 to-purple-600 flex items-center justify-center text-white shadow-lg">
                        <svg class="w-7 h-7" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/></svg>
                    </div>
                    <div>
                        <h1 class="text-2xl font-bold text-slate-800">{{ $campany->name }}</h1>
                        <p class="text-slate-500 text-sm mt-0.5">{{ $campany->user->name ?? '—' }} · {{ $campany->user->contact ?? '—' }}</p>
                        <span class="inline-flex mt-2 items-center px-2.5 py-0.5 rounded-full text-xs font-medium {{ $campany->status == 1 ? 'bg-emerald-100 text-emerald-800' : ($campany->status == 2 ? 'bg-red-100 text-red-800' : 'bg-slate-100 text-slate-700') }}">
                            {{ $campany->status == 1 ? 'Active' : ($campany->status == 2 ? 'Disabled' : 'Pending') }}
                        </span>
                    </div>
                </div>
            </div>
        </div>

        {{-- KPI cards --}}
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
            <div class="kpi-card bg-white rounded-2xl border border-slate-200/80 shadow-sm p-5">
                <p class="text-xs font-semibold uppercase tracking-wider text-slate-400">Wallet Balance</p>
                <p class="mt-1 text-2xl font-bold text-slate-800">{{ $currency }} {{ number_format($campany->balance->amount ?? 0, 0) }}</p>
            </div>
            <div class="kpi-card bg-white rounded-2xl border border-slate-200/80 shadow-sm p-5">
                <p class="text-xs font-semibold uppercase tracking-wider text-slate-400">Booking Revenue</p>
                <p class="mt-1 text-2xl font-bold text-emerald-600">{{ $currency }} {{ number_format($totalBookingsRevenue ?? 0, 0) }}</p>
            </div>
            <div class="kpi-card bg-white rounded-2xl border border-slate-200/80 shadow-sm p-5">
                <p class="text-xs font-semibold uppercase tracking-wider text-slate-400">Commission (System)</p>
                <p class="mt-1 text-2xl font-bold text-indigo-600">{{ $currency }} {{ number_format($totalCommission ?? 0, 0) }}</p>
            </div>
            <div class="kpi-card bg-white rounded-2xl border border-slate-200/80 shadow-sm p-5">
                <p class="text-xs font-semibold uppercase tracking-wider text-slate-400">Service Fees (System)</p>
                <p class="mt-1 text-2xl font-bold text-amber-600">{{ $currency }} {{ number_format($totalServiceFees ?? 0, 0) }}</p>
            </div>
        </div>

        {{-- Chart --}}
        <div class="chart-card bg-white rounded-2xl border border-slate-200/80 shadow-sm p-6 mb-8">
            <h2 class="text-lg font-semibold text-slate-800 mb-4">Bookings & Revenue (Last 14 Days)</h2>
            <div class="h-64">
                <canvas id="bookingsChart" width="400" height="200"></canvas>
            </div>
        </div>

        <div class="grid grid-cols-1 xl:grid-cols-2 gap-8 mb-8">
            {{-- Recent Bookings --}}
            <div class="table-card bg-white rounded-2xl border border-slate-200/80 shadow-sm overflow-hidden">
                <div class="px-6 py-4 border-b border-slate-100 bg-slate-50/50">
                    <h2 class="text-lg font-semibold text-slate-800">Recent Bookings</h2>
                    <p class="text-sm text-slate-500">Paid bookings</p>
                </div>
                <div class="overflow-x-auto max-h-80 overflow-y-auto">
                    <table class="min-w-full divide-y divide-slate-100">
                        <thead class="bg-slate-50/80 sticky top-0">
                            <tr>
                                <th class="px-4 py-2.5 text-left text-xs font-semibold text-slate-600">Code</th>
                                <th class="px-4 py-2.5 text-left text-xs font-semibold text-slate-600">Route</th>
                                <th class="px-4 py-2.5 text-left text-xs font-semibold text-slate-600">Date</th>
                                <th class="px-4 py-2.5 text-right text-xs font-semibold text-slate-600">Amount</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-50">
                            @forelse($bookings->take(15) as $b)
                                <tr class="hover:bg-slate-50/50">
                                    <td class="px-4 py-2.5 text-sm font-medium text-slate-800">{{ $b->booking_code }}</td>
                                    <td class="px-4 py-2.5 text-sm text-slate-600">{{ optional($b->schedule)->from ?? '—' }} → {{ optional($b->schedule)->to ?? '—' }}</td>
                                    <td class="px-4 py-2.5 text-sm text-slate-600">{{ $b->travel_date }}</td>
                                    <td class="px-4 py-2.5 text-sm text-right font-medium text-slate-800">{{ $currency }} {{ number_format($b->amount ?? 0, 0) }}</td>
                                </tr>
                            @empty
                                <tr><td colspan="4" class="px-4 py-8 text-center text-slate-400 text-sm">No bookings yet.</td></tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>

            {{-- Schedules --}}
            <div class="table-card bg-white rounded-2xl border border-slate-200/80 shadow-sm overflow-hidden">
                <div class="px-6 py-4 border-b border-slate-100 bg-slate-50/50">
                    <h2 class="text-lg font-semibold text-slate-800">Schedules</h2>
                    <p class="text-sm text-slate-500">Upcoming trips</p>
                </div>
                <div class="overflow-x-auto max-h-80 overflow-y-auto">
                    <table class="min-w-full divide-y divide-slate-100">
                        <thead class="bg-slate-50/80 sticky top-0">
                            <tr>
                                <th class="px-4 py-2.5 text-left text-xs font-semibold text-slate-600">Bus</th>
                                <th class="px-4 py-2.5 text-left text-xs font-semibold text-slate-600">From → To</th>
                                <th class="px-4 py-2.5 text-left text-xs font-semibold text-slate-600">Date</th>
                                <th class="px-4 py-2.5 text-left text-xs font-semibold text-slate-600">Time</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-50">
                            @forelse($schedules->take(15) as $s)
                                <tr class="hover:bg-slate-50/50">
                                    <td class="px-4 py-2.5 text-sm font-medium text-slate-800">{{ $s->bus->bus_number ?? '—' }}</td>
                                    <td class="px-4 py-2.5 text-sm text-slate-600">{{ $s->from ?? '—' }} → {{ $s->to ?? '—' }}</td>
                                    <td class="px-4 py-2.5 text-sm text-slate-600">{{ $s->schedule_date ? \Carbon\Carbon::parse($s->schedule_date)->format('d M Y') : '—' }}</td>
                                    <td class="px-4 py-2.5 text-sm text-slate-600">{{ $s->start ?? '—' }} - {{ $s->end ?? '—' }}</td>
                                </tr>
                            @empty
                                <tr><td colspan="4" class="px-4 py-8 text-center text-slate-400 text-sm">No schedules.</td></tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="grid grid-cols-1 xl:grid-cols-2 gap-8 mb-8">
            {{-- Buses --}}
            <div class="table-card bg-white rounded-2xl border border-slate-200/80 shadow-sm overflow-hidden">
                <div class="px-6 py-4 border-b border-slate-100 bg-slate-50/50">
                    <h2 class="text-lg font-semibold text-slate-800">Buses</h2>
                    <p class="text-sm text-slate-500">{{ $campany->bus->count() }} total</p>
                </div>
                <div class="overflow-x-auto max-h-64 overflow-y-auto">
                    <table class="min-w-full divide-y divide-slate-100">
                        <thead class="bg-slate-50/80 sticky top-0">
                            <tr>
                                <th class="px-4 py-2.5 text-left text-xs font-semibold text-slate-600">Bus #</th>
                                <th class="px-4 py-2.5 text-left text-xs font-semibold text-slate-600">Type</th>
                                <th class="px-4 py-2.5 text-left text-xs font-semibold text-slate-600">Seats</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-50">
                            @forelse($campany->bus as $bus)
                                <tr class="hover:bg-slate-50/50">
                                    <td class="px-4 py-2.5 text-sm font-medium text-slate-800">{{ $bus->bus_number }}</td>
                                    <td class="px-4 py-2.5 text-sm text-slate-600">{{ $bus->bus_type ?? '—' }}</td>
                                    <td class="px-4 py-2.5 text-sm text-slate-600">{{ $bus->total_seats ?? '—' }}</td>
                                </tr>
                            @empty
                                <tr><td colspan="3" class="px-4 py-8 text-center text-slate-400 text-sm">No buses.</td></tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>

            {{-- Payment Requests (Transactions) --}}
            <div class="table-card bg-white rounded-2xl border border-slate-200/80 shadow-sm overflow-hidden">
                <div class="px-6 py-4 border-b border-slate-100 bg-slate-50/50">
                    <h2 class="text-lg font-semibold text-slate-800">Payment Requests</h2>
                    <p class="text-sm text-slate-500">Recent transactions</p>
                </div>
                <div class="overflow-x-auto max-h-64 overflow-y-auto">
                    <table class="min-w-full divide-y divide-slate-100">
                        <thead class="bg-slate-50/80 sticky top-0">
                            <tr>
                                <th class="px-4 py-2.5 text-left text-xs font-semibold text-slate-600">User</th>
                                <th class="px-4 py-2.5 text-left text-xs font-semibold text-slate-600">Amount</th>
                                <th class="px-4 py-2.5 text-left text-xs font-semibold text-slate-600">Status</th>
                                <th class="px-4 py-2.5 text-left text-xs font-semibold text-slate-600">Date</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-50">
                            @forelse($transactions->take(10) as $t)
                                <tr class="hover:bg-slate-50/50">
                                    <td class="px-4 py-2.5 text-sm text-slate-800">{{ $t->user->name ?? '—' }}</td>
                                    <td class="px-4 py-2.5 text-sm font-medium text-slate-800">{{ $currency }} {{ number_format($t->amount ?? 0, 0) }}</td>
                                    <td class="px-4 py-2.5">
                                        <span class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium
                                            {{ $t->status === 'Completed' ? 'bg-emerald-100 text-emerald-800' : ($t->status === 'Pending' ? 'bg-amber-100 text-amber-800' : 'bg-red-100 text-red-800') }}">
                                            {{ $t->status }}
                                        </span>
                                    </td>
                                    <td class="px-4 py-2.5 text-sm text-slate-600">{{ $t->created_at ? $t->created_at->format('d M Y H:i') : '—' }}</td>
                                </tr>
                            @empty
                                <tr><td colspan="4" class="px-4 py-8 text-center text-slate-400 text-sm">No transactions.</td></tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Anime.js: animate cards and chart in
    var kpiCards = document.querySelectorAll('.kpi-card');
    var chartCard = document.querySelector('.chart-card');
    var tableCards = document.querySelectorAll('.table-card');
    var dashIcon = document.querySelector('.campany-dash-icon');

    anime({
        targets: dashIcon,
        translateY: [20, 0],
        opacity: [0, 1],
        duration: 500,
        easing: 'easeOutElastic(1, .6)'
    });

    anime({
        targets: kpiCards,
        translateY: [24, 0],
        opacity: [0, 1],
        delay: anime.stagger(80),
        duration: 400,
        easing: 'easeOutExpo'
    });

    anime({
        targets: chartCard,
        translateY: [24, 0],
        opacity: [0, 1],
        delay: 350,
        duration: 450,
        easing: 'easeOutExpo'
    });

    anime({
        targets: tableCards,
        translateY: [20, 0],
        opacity: [0, 1],
        delay: anime.stagger(80, { start: 500 }),
        duration: 400,
        easing: 'easeOutExpo'
    });

    // Chart.js: bookings & revenue last 14 days
    var chartData = @json($bookingsChart);
    var labels = chartData.map(function(d) { return d.date; });
    var counts = chartData.map(function(d) { return d.count; });
    var totals = chartData.map(function(d) { return Math.round(parseFloat(d.total) || 0); });

    var ctx = document.getElementById('bookingsChart');
    if (ctx && typeof Chart !== 'undefined') {
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [
                    {
                        label: 'Bookings',
                        data: counts,
                        backgroundColor: 'rgba(99, 102, 241, 0.6)',
                        borderColor: 'rgb(99, 102, 241)',
                        borderWidth: 1,
                        yAxisID: 'y'
                    },
                    {
                        label: 'Revenue ({{ $currency }})',
                        data: totals,
                        type: 'line',
                        borderColor: 'rgb(16, 185, 129)',
                        backgroundColor: 'rgba(16, 185, 129, 0.1)',
                        fill: true,
                        tension: 0.3,
                        yAxisID: 'y1'
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                interaction: { mode: 'index', intersect: false },
                plugins: {
                    legend: { position: 'top' }
                },
                scales: {
                    y: { type: 'linear', display: true, position: 'left', title: { display: true, text: 'Bookings' } },
                    y1: { type: 'linear', display: true, position: 'right', grid: { drawOnChartArea: false }, title: { display: true, text: 'Revenue' } }
                }
            }
        });
    }
});
</script>
@endsection
