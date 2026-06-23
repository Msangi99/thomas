@extends('system.app')

@section('content')
    <div class="container mx-auto px-4 py-6 max-w-7xl">
        <div class="mb-5">
            <h2 class="text-2xl font-semibold text-slate-800">Government Levy Report</h2>
            <p class="text-sm text-slate-500 mt-1">Track government levy and service fee values from paid bookings.</p>
        </div>

        <form method="GET" action="{{ route('system.government_levy') }}" class="bg-white rounded-xl border border-slate-200 shadow-sm p-4 mb-6">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-3">
                <div>
                    <label for="period" class="block text-xs font-medium text-slate-500 mb-1">Period</label>
                    <select id="period" name="period" class="w-full rounded-lg border-slate-300 focus:ring-blue-500 focus:border-blue-500 text-sm">
                        <option value="today" {{ $period === 'today' ? 'selected' : '' }}>Today</option>
                        <option value="week" {{ $period === 'week' ? 'selected' : '' }}>This Week</option>
                        <option value="month" {{ $period === 'month' ? 'selected' : '' }}>This Month</option>
                        <option value="year" {{ $period === 'year' ? 'selected' : '' }}>This Year</option>
                        <option value="custom" {{ $period === 'custom' ? 'selected' : '' }}>Custom Range</option>
                    </select>
                </div>
                <div>
                    <label for="start_date" class="block text-xs font-medium text-slate-500 mb-1">Start Date</label>
                    <input id="start_date" type="date" name="start_date" value="{{ $startDate }}" class="w-full rounded-lg border-slate-300 focus:ring-blue-500 focus:border-blue-500 text-sm">
                </div>
                <div>
                    <label for="end_date" class="block text-xs font-medium text-slate-500 mb-1">End Date</label>
                    <input id="end_date" type="date" name="end_date" value="{{ $endDate }}" class="w-full rounded-lg border-slate-300 focus:ring-blue-500 focus:border-blue-500 text-sm">
                </div>
                <div class="flex items-end gap-2">
                    <button type="submit" class="w-full md:w-auto px-4 py-2 rounded-lg bg-blue-600 text-white text-sm font-medium hover:bg-blue-700 transition">
                        Apply Filter
                    </button>
                    <a href="{{ route('system.government_levy') }}" class="w-full md:w-auto text-center px-4 py-2 rounded-lg bg-slate-100 text-slate-700 text-sm font-medium hover:bg-slate-200 transition">
                        Reset
                    </a>
                </div>
            </div>
        </form>

        @if(!$hasGovernmentLevyColumn || !$hasSystemServiceFeeColumn)
            <div class="mb-6 rounded-xl border border-amber-200 bg-amber-50 p-4 text-amber-800 text-sm">
                Some columns are missing in your database schema.
                @if(!$hasGovernmentLevyColumn)
                    <span class="font-semibold">`government_levy`</span>
                @endif
                @if(!$hasGovernmentLevyColumn && !$hasSystemServiceFeeColumn)
                    and
                @endif
                @if(!$hasSystemServiceFeeColumn)
                    <span class="font-semibold">`system_service_fee`</span>
                @endif
                values will show as 0 until migration is applied.
            </div>
        @endif

        <div class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-6 gap-4 mb-6">
            <div class="bg-white rounded-xl border border-slate-200 shadow-sm p-4">
                <p class="text-xs font-medium text-slate-500">Paid Amount</p>
                <p class="text-xl font-semibold text-slate-800 mt-2">{{ $currency }} {{ convert_money($totalPaidAmount) }}</p>
            </div>
            <div class="bg-white rounded-xl border border-slate-200 shadow-sm p-4">
                <p class="text-xs font-medium text-slate-500">VAT</p>
                <p class="text-xl font-semibold text-slate-800 mt-2">{{ $currency }} {{ convert_money($totalVat) }}</p>
            </div>
            <div class="bg-white rounded-xl border border-slate-200 shadow-sm p-4">
                <p class="text-xs font-medium text-slate-500">Gov Levy (Fare)</p>
                <p class="text-xl font-semibold text-emerald-700 mt-2">{{ $currency }} {{ convert_money($totalGovLevyOnFare) }}</p>
            </div>
            <div class="bg-white rounded-xl border border-slate-200 shadow-sm p-4">
                <p class="text-xs font-medium text-slate-500">Gov Levy (Service)</p>
                <p class="text-xl font-semibold text-emerald-600 mt-2">{{ $currency }} {{ convert_money($totalGovLevyOnService) }}</p>
            </div>
            <div class="bg-white rounded-xl border border-slate-200 shadow-sm p-4">
                <p class="text-xs font-medium text-slate-500">Total Gov Levy</p>
                <p class="text-xl font-semibold text-emerald-800 mt-2">{{ $currency }} {{ convert_money($totalGovernmentLevy) }}</p>
            </div>
            <div class="bg-white rounded-xl border border-slate-200 shadow-sm p-4">
                <p class="text-xs font-medium text-slate-500">System Service Fee</p>
                <p class="text-xl font-semibold text-indigo-700 mt-2">{{ $currency }} {{ convert_money($totalSystemServiceFee) }}</p>
            </div>
        </div>

        <div class="bg-white rounded-xl border border-slate-200 shadow-sm overflow-hidden">
            <div class="px-4 py-3 border-b border-slate-200">
                <h3 class="text-sm font-semibold text-slate-700">Paid Bookings Breakdown</h3>
            </div>
            <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-slate-200">
                    <thead class="bg-slate-50">
                        <tr>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Booking</th>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Date</th>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Route</th>
                            <th class="px-4 py-3 text-right text-xs font-semibold text-slate-600 uppercase">Paid Amount</th>
                            <th class="px-4 py-3 text-right text-xs font-semibold text-slate-600 uppercase">VAT</th>
                            <th class="px-4 py-3 text-right text-xs font-semibold text-slate-600 uppercase">Gov Levy (Fare)</th>
                            <th class="px-4 py-3 text-right text-xs font-semibold text-slate-600 uppercase">Gov Levy (Service)</th>
                            <th class="px-4 py-3 text-right text-xs font-semibold text-slate-600 uppercase">Total Gov Levy</th>
                            <th class="px-4 py-3 text-right text-xs font-semibold text-slate-600 uppercase">Service Fee</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-100">
                        @forelse($bookings as $booking)
                            @php
                                $govLevyOnFare = (float) ($booking->government_levy ?? 0);
                                $govLevyOnService = (float) $booking->governmentLeviesOnService->sum('amount');
                                $totalGovLevy = $govLevyOnFare + $govLevyOnService;
                            @endphp
                            <tr class="hover:bg-slate-50 transition">
                                <td class="px-4 py-3 text-sm text-slate-700 font-medium">{{ $booking->booking_code ?? 'N/A' }}</td>
                                <td class="px-4 py-3 text-sm text-slate-600">{{ optional($booking->created_at)->format('d M Y H:i') }}</td>
                                <td class="px-4 py-3 text-sm text-slate-600">
                                    {{ $booking->route->from ?? 'N/A' }} - {{ $booking->route->to ?? 'N/A' }}
                                </td>
                                <td class="px-4 py-3 text-sm text-slate-700 text-right">{{ $currency }} {{ convert_money($booking->amount ?? 0) }}</td>
                                <td class="px-4 py-3 text-sm text-slate-700 text-right">{{ $currency }} {{ convert_money($booking->vat ?? 0) }}</td>
                                <td class="px-4 py-3 text-sm text-emerald-700 text-right font-medium">{{ $currency }} {{ convert_money($govLevyOnFare) }}</td>
                                <td class="px-4 py-3 text-sm text-emerald-600 text-right font-medium">{{ $currency }} {{ convert_money($govLevyOnService) }}</td>
                                <td class="px-4 py-3 text-sm text-emerald-800 text-right font-semibold">{{ $currency }} {{ convert_money($totalGovLevy) }}</td>
                                <td class="px-4 py-3 text-sm text-indigo-700 text-right font-medium">{{ $currency }} {{ convert_money($booking->system_service_fee ?? 0) }}</td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="9" class="px-4 py-8 text-center text-sm text-slate-500">No paid bookings found for this filter.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
            <div class="px-4 py-3 border-t border-slate-200">
                {{ $bookings->links() }}
            </div>
        </div>
    </div>
@endsection
