@extends('admin.app')

@section('content')
    <!-- DataTables CSS -->
    <link href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" rel="stylesheet">
    <!-- Date Range Picker CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

    <div class="container mx-auto px-4 py-6 max-w-7xl">
        <h4 class="text-blue-600 text-center text-lg font-semibold mb-4">{{ __('vender/history.highlink_isgc') }}</h4>
        <div class="bg-white rounded-lg shadow-md overflow-hidden">
            <!-- Card Header -->
            <div
                class="p-4 bg-gradient-to-r from-teal-500 to-teal-400 text-white flex flex-col sm:flex-row justify-between items-center gap-4">
                <div class="flex flex-col">
                    <h2 class="text-lg font-semibold mb-2">{{ __('vender/history.booking_history') }}</h2>
                    <div class="flex flex-wrap gap-3 text-sm font-medium">
                        <span>{{ __('vender/history.total_payment') }} <span id="totalPayment">0</span></span>
                        <span>{{ __('vender/history.total_discount') }} <span id="totalDiscount">0</span></span>
                        <span>{{ __('vender/history.total_vat') }} <span id="totalVAT">0</span></span>
                        <span>{{ __('vender/history.grand_total') }} <span id="grandTotal">0</span></span>
                    </div>
                </div>
                <div class="flex flex-col sm:flex-row items-center gap-2 flex-wrap">
                    {{-- Date range filter: daterangepicker with callback submits form on Apply --}}
                    <form action="{{ route('history') }}" method="GET" class="flex items-center gap-2 w-full sm:w-auto" id="dateRangeForm">
                        <input type="hidden" name="start_date" id="filterStartDate" value="{{ request('start_date') }}">
                        <input type="hidden" name="end_date" id="filterEndDate" value="{{ request('end_date') }}">
                        <input type="text" readonly
                            class="px-3 py-2 border rounded-lg bg-white text-gray-800 text-sm w-full sm:w-56 cursor-pointer"
                            id="dateRangeFilter" placeholder="{{ __('vender/history.select_date_range') }}"
                            value="{{ request('start_date') && request('end_date') ? request('start_date') . ' - ' . request('end_date') : '' }}">
                        @if(request('start_date') || request('end_date'))
                        <a href="{{ route('history') }}" class="p-2 bg-white/90 text-gray-700 rounded-lg hover:bg-white transition" title="Clear filter">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                            </svg>
                        </a>
                        @endif
                    </form>
                    <div class="relative w-full sm:w-auto">
                        <button type="button"
                            class="px-3 py-2 bg-white text-blue-500 rounded-lg hover:bg-blue-50 transition flex items-center gap-1 text-sm w-full sm:w-auto"
                            onclick="toggleDropdown(this)">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 8h16M4 16h16"></path>
                            </svg>
                            {{ __('vender/history.actions') }}
                        </button>
                        <div class="dropdown-menu hidden absolute right-0 mt-2 w-48 bg-white rounded-lg shadow-lg z-10">
                            {{-- Print Manifest: server uses start_date/end_date from current page --}}
                            <form action="{{ route('admin.print.manifest') }}" method="POST">
                                @csrf
                                <input type="hidden" name="start_date" value="{{ request('start_date') }}">
                                <input type="hidden" name="end_date" value="{{ request('end_date') }}">
                                <button type="submit" class="block w-full text-left px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 w-full">{{ __('vender/history.print_manifest') }}</button>
                            </form>
                            {{-- Print Income: server uses start_date/end_date from current page --}}
                            <form action="{{ route('admin.print') }}" method="POST">
                                @csrf
                                <input type="hidden" name="start_date" value="{{ request('start_date') }}">
                                <input type="hidden" name="end_date" value="{{ request('end_date') }}">
                                <button type="submit" class="block w-full text-left px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 w-full">{{ __('vender/history.print_income') }}</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Card Body -->
            <div class="p-4">
                <div class="overflow-x-auto">
                    <table id="busTable" class="w-full table-auto">
                        <thead>
                            <tr class="bg-gray-100 text-gray-600 uppercase text-xs leading-normal">
                                <th class="py-2 px-4 text-left font-medium">{{ __('vender/history.sn') }}</th>
                                @foreach (['booking_id', 'bus_route', 'travel_details', 'passenger', 'seats_payment', 'commission', 'total', 'action'] as $key)
                                    <th class="py-2 px-4 text-left font-medium">{{ __('vender/history.' . $key) }}</th>
                                @endforeach
                            </tr>
                        </thead>
                        <tbody class="text-gray-600 text-xs">
                            @if (isset($bookings) && $bookings->count())
                                @foreach ($bookings as $index => $booking)
                                    <tr class="border-b border-gray-200 hover:bg-gray-50 transition" data-booking-id="{{ $booking->id }}" data-created-at="{{ $booking->created_at->format('Y-m-d') }}">
                                        <td class="py-2 px-4 text-center">{{ $index + 1 }}</td>
                                        <td class="py-2 px-4">
                                            <div class="flex flex-col">
                                                <p class="font-medium mb-0">
                                                    {{ $booking->booking_code ?? __('vender/history.na') }}</p>
                                                <p class="text-gray-500 mb-0">{{ __('vender/history.confirmed') }}</p>
                                                <p class="text-gray-500 mb-0">{{ __('vender/history.paid_time') }}:
                                                    {{ $booking->created_at->format('d M Y H:i A') }}</p>
                                            </div>
                                        </td>
                                        <td class="py-2 px-4">
                                            <div class="flex flex-col">
                                                <h6 class="font-medium mb-0">
                                                    {{ $booking->campany->name ?? __('vender/history.na') }}</h6>
                                                <p class="text-gray-500 mb-0">
                                                    {{ $booking->schedule->from ?? __('vender/history.na') }}
                                                    {{ __('vender/history.to') }}
                                                    {{ $booking->schedule->to ?? __('vender/history.na') }}</p>
                                                <p class="text-gray-500 mb-0">
                                                    {{ $booking->bus->bus_number ?? __('vender/history.na') }}</p>
                                            </div>
                                        </td>
                                        <td class="py-2 px-4">
                                            <div class="flex flex-col">
                                                <p class="font-medium mb-0 view-booking" data-id="{{ $booking->id }}" data-created-at="{{ $booking->created_at->format('Y-m-d') }}">
                                                    {{ $booking->travel_date ?? __('vender/history.na') }}</p>
                                                <p class="text-gray-500 mb-0">{{ __('vender/history.seat') }}
                                                    {{ $booking->seat ?? __('vender/history.na') }}</p>
                                                <p class="text-gray-500 mb-0">{{ __('vender/history.pickup') }}
                                                    {{ $booking->pickup_point ?? __('vender/history.na') }}</p>
                                                <p class="text-gray-500 mb-0">{{ __('vender/history.drop_point') }}
                                                    {{ $booking->dropping_point ?? __('vender/history.na') }}</p>
                                                
                                            </div>
                                        </td>
                                        <td class="py-2 px-4">
                                            <div class="flex flex-col">
                                                <p class="font-medium mb-0">
                                                    {{ $booking->customer_name ?? __('vender/history.na') }}</p>
                                                <p class="text-gray-500 mb-0">
                                                    {{ $booking->customer_phone ?? __('vender/history.na') }}</p>
                                            </div>
                                        </td>
                                        <td class="py-2 px-4">
                                            <div class="flex flex-col">
                                                <p class="text-gray-500 mb-0 payment-amount"
                                                    data-amount="{{ $booking->amount ?? '0' }}"
                                                    data-vat="{{ $booking->vat ?? '0' }}"
                                                    data-discount="{{ $booking->discount_amount ?? '0' }}"
                                                    data-fee="{{ $booking->fee ?? '0' }}"
                                                    data-vender_fee="{{ $booking->vender_fee ?? '0' }}"
                                                    data-fee_vat="{{ $booking->fee_vat ?? '0' }}">
                                                    {{ $booking->amount + $booking->vat ?? __('vender/history.na') }}
                                                </p>
                                            </div>
                                        </td>
                                        <td class="py-2 px-4">
                                            <div class="flex flex-col">
                                                <p class="text-gray-500 font-medium mb-0">
                                                    {{ __('vender/history.system') }}
                                                    {{ $booking->fee ?? __('vender/history.na') }}</p>
                                                <p class="text-gray-500 font-medium mb-0">
                                                    {{ __('vender/history.vendor') }}
                                                    {{ $booking->vender_fee ?? __('vender/history.na') }}</p>
                                                <p class="text-gray-500 font-medium mb-0">
                                                    {{ __('vender/history.discount') }}
                                                    {{ $booking->discount_amount ?? __('vender/history.na') }}</p>
                                                <p class="text-gray-500 font-medium mb-0">{{ __('vender/history.vat') }}
                                                    {{ $booking->vat ?? __('vender/history.na') }}</p>
                                            </div>
                                        </td>
                                        <td class="py-2 px-4">
                                            <div class="flex flex-col">
                                                <p class="text-gray-500 font-medium mb-0 total-amount"
                                                    data-total="{{ round($booking->fee + $booking->vender_fee + $booking->amount + $booking->vat + $booking->fee_vat) ?? '0' }}">
                                                    {{ round($booking->fee + $booking->vender_fee + $booking->amount + $booking->vat + $booking->fee_vat) ?? __('vender/history.na') }}
                                                </p>
                                                <p class="hidden text-gray-500 font-medium mb-0">
                                                    {{ round($booking->fee + $booking->vender_fee + $booking->amount + $booking->vat + $booking->service + $booking->vender_service + $booking->fee_vat) ?? __('vender/history.na') }}
                                                </p>
                                            </div>
                                        </td>
                                        <td class="py-2 px-4">
                                            <div class="relative">
                                                <button
                                                    class="px-3 py-1 bg-white text-blue-500 rounded-lg hover:bg-blue-50 transition flex items-center gap-1 text-sm"
                                                    onclick="toggleDropdown(this)">
                                                    <svg class="w-4 h-4" fill="none" stroke="currentColor"
                                                        viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round"
                                                            stroke-width="2" d="M4 8h16M4 16h16"></path>
                                                    </svg>
                                                    {{ __('vender/history.print') }}
                                                </button>
                                                <div
                                                    class="dropdown-menu hidden absolute right-0 mt-2 w-48 bg-white rounded-lg shadow-lg z-10">
                                                    <form action="{{ route('ticket.print') }}" method="POST">
                                                        @csrf
                                                        <input type="hidden" name="data"
                                                            value="{{ $booking }}">
                                                        <button type="submit"
                                                            class="block w-full text-left px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">{{ __('vender/history.print_ticket') }}</button>
                                                    </form>
                                                    <form action="{{ route('print.service') }}" method="POST">
                                                        @csrf
                                                        <input type="hidden" name="data"
                                                            value="{{ $booking }}">
                                                        <button type="submit"
                                                            class="block w-full text-left px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">{{ __('vender/history.print_service') }}</button>
                                                    </form>
                                                    <form
                                                        action="{{ route('booking.transfer.form', ['booking_id' => $booking->id]) }}"
                                                        method="GET">
                                                        <button type="submit"
                                                            class="block w-full text-left px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Transfer
                                                            Booking</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            @else
                                <tr>
                                    <td class="py-2 px-4 text-center text-gray-500">{{ __('vender/history.no_bookings_found') }}</td>
                                    <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                                </tr>
                            @endif
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- View Booking Modal -->
        <div id="viewBookingModal"
            class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
            <div class="bg-white rounded-lg shadow-lg w-full max-w-2xl mx-4 transform transition-all">
                <div class="p-4 flex justify-between items-center border-b border-gray-200">
                    <h2 class="text-lg font-semibold text-gray-800">{{ __('vender/history.booking_details') }}</h2>
                    <button type="button" class="text-gray-500 hover:text-gray-700"
                        onclick="document.getElementById('viewBookingModal').classList.add('hidden')">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M6 18L18 6M6 6l12 12"></path>
                        </svg>
                    </button>
                </div>
                <div class="p-4" id="modalContent">
                    <!-- Dynamic content will be loaded here -->
                </div>
                <div class="p-4 flex justify-end gap-2 border-t border-gray-200">
                    <button type="button"
                        class="px-3 py-1 bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200 transition text-sm"
                        onclick="document.getElementById('viewBookingModal').classList.add('hidden')">{{ __('vender/history.close') }}</button>
                    <button type="button"
                        class="px-3 py-1 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition text-sm print-ticket">
                        <svg class="w-4 h-4 inline mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 8h16M4 16h16">
                            </path>
                        </svg>
                        {{ __('vender/history.print_ticket') }}
                    </button>
                </div>
            </div>
        </div>
    </div>


    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <script>
        $(document).ready(function() {
                    // Initialize DataTable (totals only; date filter is server-side)
                    DataTable.ext.errMode = 'none';
                    var table = $('#busTable').DataTable({
                        responsive: true,
                        paging: true,
                        searching: true,
                        ordering: true,
                        language: { emptyTable: "No bookings found." },
                        footerCallback: function() {
                            var totalPayment = 0, totalDiscount = 0, totalVAT = 0, grandTotal = 0;
                            var api = this.api();
                            api.rows({ page: 'current' }).every(function() {
                                var rowNode = this.node();
                                var paymentEl = $(rowNode).find('.payment-amount');
                                var totalEl = $(rowNode).find('.total-amount');
                                totalPayment += parseFloat(paymentEl.attr('data-amount')) || 0;
                                totalPayment += parseFloat(paymentEl.attr('data-vat')) || 0;
                                totalDiscount += parseFloat(paymentEl.attr('data-discount')) || 0;
                                totalVAT += parseFloat(paymentEl.attr('data-vat')) || 0;
                                grandTotal += parseFloat(totalEl.attr('data-total')) || 0;
                            });
                            $('#totalPayment').text(totalPayment.toLocaleString('en-US', { minimumFractionDigits: 2 }));
                            $('#totalDiscount').text(totalDiscount.toLocaleString('en-US', { minimumFractionDigits: 2 }));
                            $('#totalVAT').text(totalVAT.toLocaleString('en-US', { minimumFractionDigits: 2 }));
                            $('#grandTotal').text(grandTotal.toLocaleString('en-US', { minimumFractionDigits: 2 }));
                        }
                    });

                    // Date Range Picker with callback (https://www.daterangepicker.com/#usage)
                    var start = '{{ request('start_date') }}' ? moment('{{ request('start_date') }}') : moment().startOf('month');
                    var end = '{{ request('end_date') }}' ? moment('{{ request('end_date') }}') : moment().endOf('month');

                    $('#dateRangeFilter').daterangepicker({
                        startDate: start,
                        endDate: end,
                        autoUpdateInput: false,
                        locale: {
                            format: 'YYYY-MM-DD',
                            separator: ' - ',
                            applyLabel: 'Apply',
                            cancelLabel: 'Cancel',
                            fromLabel: 'From',
                            toLabel: 'To',
                            customRangeLabel: 'Custom Range',
                            daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
                            monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
                            firstDay: 1
                        },
                        ranges: {
                            'Today': [moment(), moment()],
                            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                            'This Month': [moment().startOf('month'), moment().endOf('month')],
                            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                        },
                        opens: 'left',
                        drops: 'down'
                    }, function(startDate, endDate, label) {
                        $('#dateRangeFilter').val(startDate.format('YYYY-MM-DD') + ' - ' + endDate.format('YYYY-MM-DD'));
                        $('#filterStartDate').val(startDate.format('YYYY-MM-DD'));
                        $('#filterEndDate').val(endDate.format('YYYY-MM-DD'));
                        $('#dateRangeForm').submit();
                    });

                    $('#dateRangeFilter').on('cancel.daterangepicker', function() {
                        $(this).val('');
                        $('#filterStartDate').val('');
                        $('#filterEndDate').val('');
                    });

            // View booking details
            $(document).on('click', '.view-booking', function() {
                const bookingId = $(this).data('id');
                $.ajax({
                    url: '{{ route('history.show', ':id') }}'.replace(':id', bookingId),
                    method: 'GET',
                    success: function(response) {
                        $('#modalContent').html(response.html);
                        document.getElementById('viewBookingModal').classList.remove('hidden');
                    },
                    error: function(xhr) {
                        console.error('Error fetching booking details:', xhr);
                    }
                });
            });

            // Close modal when clicking outside
            document.getElementById('viewBookingModal').addEventListener('click', function(e) {
                if (e.target === this) {
                    this.classList.add('hidden');
                }
            });
        });

        // Toggle dropdown
        function toggleDropdown(button) {
            const dropdown = button.nextElementSibling;
            dropdown.classList.toggle('hidden');
            document.addEventListener('click', function closeDropdown(e) {
                if (!button.contains(e.target) && !dropdown.contains(e.target)) {
                    dropdown.classList.add('hidden');
                    document.removeEventListener('click', closeDropdown);
                }
            });
        }
    </script>

    <style>
        .search-input {
            width: 100%;
            padding: 4px;
            font-size: 12px;
            border-radius: 4px;
        }

        .daterangepicker {
            z-index: 9999 !important;
        }

        #dateRangeFilter {
            min-width: 150px;
            text-align: center;
        }

        @media (max-width: 640px) {
            #dateRangeFilter {
                min-width: 100%;
            }
    </style>
@endsection
