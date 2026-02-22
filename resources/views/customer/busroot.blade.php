@extends('customer.app')

@section('content')
    <!-- Dependencies -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.13.6/css/dataTables.tailwindcss.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

    <style>
        /* Light-themed Select2 */
        .select2-container--default .select2-selection--single {
            background-color: #f9fafb;
            border: 1px solid #d1d5db;
            border-radius: 0.375rem;
            height: 40px;
            color: #1f2937;
        }
        .select2-container--default .select2-selection--single .select2-selection__rendered {
            color: #1f2937;
            line-height: 40px;
            padding-left: 0.75rem;
            padding-right: 2rem;
        }
        .select2-container--default .select2-selection--single .select2-selection__arrow {
            height: 40px;
            right: 8px;
        }
        .select2-dropdown {
            background-color: #f9fafb;
            border: 1px solid #d1d5db;
            border-radius: 0.375rem;
            color: #1f2937;
        }
        .select2-container--default .select2-results__option--highlighted[aria-selected] {
            background-color: #4f46e5;
            color: white;
        }
        input[type="date"] {
            position: relative;
            z-index: 1;
            background: #f9fafb;
            color: #1f2937;
            appearance: auto;
        }
        input[type="date"]::-webkit-calendar-picker-indicator {
            cursor: pointer;
        }
        /* DataTable styling */
        #busTable {
            background-color: #ffffff;
            color: #1f2937;
            border-collapse: collapse;
        }
        #busTable th, #busTable td {
            border-color: #e5e7eb;
            color: #374151;
        }
        #busTable thead {
            background-color: #f3f4f6;
        }
        #busTable thead th {
            color: #4b5563;
            font-weight: 600;
            white-space: nowrap;
        }
        #busTable tbody tr:hover {
            background-color: #f9fafb;
        }
        /* Empty state */
        #busTable tbody td.dataTables_empty {
            padding: 2.5rem 1rem;
            text-align: center;
            color: #6b7280;
            font-size: 0.9375rem;
        }
        /* DataTables wrapper: controls and pagination */
        #busTable_wrapper {
            width: 100%;
        }
        #busTable_wrapper .dataTables_length,
        #busTable_wrapper .dataTables_filter,
        #busTable_wrapper .dataTables_info {
            margin-bottom: 0.75rem;
            color: #4b5563;
            font-size: 0.875rem;
        }
        #busTable_wrapper .dataTables_length label,
        #busTable_wrapper .dataTables_filter label {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            flex-wrap: wrap;
        }
        #busTable_wrapper .dataTables_length select,
        #busTable_wrapper .dataTables_filter input {
            padding: 0.5rem 0.75rem;
            border: 1px solid #d1d5db;
            border-radius: 0.5rem;
            background: #fff;
            font-size: 0.875rem;
            color: #1f2937;
        }
        #busTable_wrapper .dataTables_filter input {
            min-width: 12rem;
        }
        #busTable_wrapper .dataTables_filter input:focus {
            outline: none;
            border-color: #4f46e5;
            box-shadow: 0 0 0 2px rgba(79, 70, 229, 0.2);
        }
        #busTable_wrapper .dataTables_paginate {
            margin-top: 1rem;
            padding-top: 0.75rem;
        }
        #busTable_wrapper .dataTables_paginate .paginate_button {
            padding: 0.5rem 0.875rem;
            margin: 0 0.15rem;
            border: 1px solid #d1d5db;
            border-radius: 0.5rem;
            background: #fff;
            color: #374151 !important;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease;
        }
        #busTable_wrapper .dataTables_paginate .paginate_button:hover {
            background: #f3f4f6;
            border-color: #9ca3af;
            color: #111827 !important;
        }
        #busTable_wrapper .dataTables_paginate .paginate_button.current {
            background: linear-gradient(to right, #4f46e5, #4338ca);
            border-color: #4f46e5;
            color: #fff !important;
        }
        #busTable_wrapper .dataTables_paginate .paginate_button.current:hover {
            background: linear-gradient(to right, #4338ca, #3730a3);
            color: #fff !important;
        }
        #busTable_wrapper .dataTables_paginate .paginate_button.disabled,
        #busTable_wrapper .dataTables_paginate .paginate_button.disabled:hover {
            background: #f9fafb !important;
            border-color: #e5e7eb;
            color: #9ca3af !important;
            cursor: not-allowed;
        }
        @media (min-width: 640px) {
            #busTable_wrapper .row:first-child {
                display: flex;
                flex-wrap: wrap;
                align-items: center;
                justify-content: space-between;
                gap: 1rem;
            }
        }
        /* Modal styling */
        dialog {
            background-color: #ffffff;
            color: #1f2937;
            border: 1px solid #e5e7eb;
        }
    </style>

    <div class="container mx-auto px-4 py-8 max-w-5xl">
        <div class="bg-white shadow-md rounded-lg p-6">
            <h2 class="text-2xl font-semibold text-gray-800 mb-6">{{ __('all.search_bus_schedules') }}</h2>

            <!-- Tab Navigation -->
            <div class="flex space-x-2 mb-6 bg-gray-100 rounded-lg p-1">
                <button class="search-tab flex-1 py-2 px-4 rounded-lg bg-indigo-500 text-white font-medium text-sm uppercase transition-colors duration-200" data-tab="one-way">{{ __('all.one_way') }}</button>
                <button class="search-tab flex-1 py-2 px-4 rounded-lg text-gray-500 font-medium text-sm uppercase transition-colors duration-200" data-tab="bus-name">{{ __('all.bus_name') }}</button>
            </div>

            <!-- One Way Form -->
            <form action="{{ route('customer.mybooking.search.form') }}" method="GET" class="search-form" id="one-way-form">
                @csrf
                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                    <div>
                        <label class="block text-gray-600 text-sm mb-1">{{ __('all.from') }}</label>
                        <div class="relative">
                            <select name="departure_city" id="departure_city" class="w-full px-3 py-2 bg-gray-50 border border-gray-300 rounded-lg text-gray-800">
                                <option value="">{{ __('all.select_departure_city') }}</option>
                                @foreach ($cities as $city)
                                    <option value="{{ $city->id }}" {{ old('departure_city') == $city->id ? 'selected' : '' }}>{{ $city->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div>
                        <label class="block text-gray-600 text-sm mb-1">{{ __('all.to') }}</label>
                        <div class="relative">
                            <select name="arrival_city" id="arrival_city" class="w-full px-3 py-2 bg-gray-50 border border-gray-300 rounded-lg text-gray-800">
                                <option value="">{{ __('all.select_arrival_city') }}</option>
                                @foreach ($cities as $city)
                                    <option value="{{ $city->id }}" {{ old('arrival_city') == $city->id ? 'selected' : '' }}>{{ $city->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div>
                        <label class="block text-gray-600 text-sm mb-1">{{ __('all.date') }}</label>
                        <div class="relative">
                            <input type="date" name="departure_date" id="departure_date" class="w-full px-3 py-2 bg-gray-50 border border-gray-300 rounded-lg text-gray-800">
                        </div>
                    </div>
                    <div>
                        <label class="block text-gray-600 text-sm mb-1">Bus Class</label>
                        <div class="relative">
                            <select name="bus_type" id="bus_type" class="w-full px-3 py-2 bg-gray-50 border border-gray-300 rounded-lg text-gray-800">
                                <option value="any">Any</option>
                                <option value="10" {{ old('bus_type') == '10' ? 'selected' : '' }}>luxury</option>
                                <option value="20" {{ old('bus_type') == '20' ? 'selected' : '' }}>upper-semiluxury</option>
                                <option value="30" {{ old('bus_type') == '30' ? 'selected' : '' }}>lower-semiluxury</option>
                                <option value="40" {{ old('bus_type') == '40' ? 'selected' : '' }}>ordinary</option>
                            </select>
                        </div>
                    </div>
                </div>
                <button class="mt-4 w-full bg-indigo-500 hover:bg-indigo-600 text-white py-2 rounded-lg font-medium transition-colors duration-200">
                    <i class="fas fa-search mr-2"></i> {{ __('all.find_buses') }}
                </button>
            </form>

            <!-- Bus Name Form -->
            <form action="{{ route('customer.mybooking.search') }}" method="GET" class="search-form hidden" id="bus-name-form">
                @csrf
                <div class="grid grid-cols-1 gap-4">
                    <div>
                        <label class="block text-gray-600 text-sm mb-1">{{ __('all.bus_name') }}</label>
                        <div class="relative">
                            <select name="bus_id" id="bus_name" class="w-full px-3 py-2 bg-gray-50 border border-gray-300 rounded-lg text-gray-800">
                                <option value="">{{ __('all.select_bus_name') }}</option>
                                @forelse (App\Models\Campany::all() as $bus)
                                    <option value="{{ $bus->id }}" {{ request('bus_name') == $bus->id ? 'selected' : '' }}>{{ $bus->name ?? 'N/A' }}</option>
                                @empty
                                    <option>{{ __('all.no_companies_found') }}</option>
                                @endforelse
                            </select>
                        </div>
                    </div>
                </div>
                <button class="mt-4 w-full bg-indigo-500 hover:bg-indigo-600 text-white py-2 rounded-lg font-medium transition-colors duration-200">
                    <i class="fas fa-search mr-2"></i> {{ __('all.find_buses') }}
                </button>
            </form>

            <a href="{{ route('customer.by_route') }}" class="text-indigo-500 hover:text-indigo-600 mt-4 inline-block transition-colors duration-200">{{ __('all.search_by_route') }}</a>
        </div>

        @if (!empty($busList))
            <div class="mt-6 bg-white shadow-md rounded-lg p-6">
                <h2 class="text-xl font-bold text-gray-800 mb-4">{{ __('all.bus_schedules') }}</h2>
                @if (session('success'))
                    <div class="mb-4 p-3 bg-green-100 text-green-700 rounded-md text-sm">{{ session('success') }}</div>
                @endif
                @if (session('error'))
                    <div class="mb-4 p-3 bg-red-100 text-red-700 rounded-md text-sm">{{ session('error') }}</div>
                @endif
                <div class="overflow-x-auto rounded-lg border border-gray-200" style="overflow-x: auto; -webkit-overflow-scrolling: touch;">
                    <table id="busTable" class="w-full text-sm text-gray-700">
                        <thead class="bg-gray-100 text-xs uppercase text-gray-600 font-semibold tracking-wide">
                            <tr>
                                <th class="px-4 py-3 text-left">{{ __('all.no') }}</th>
                                <th class="px-4 py-3 text-left">{{ __('all.bus_number') }}</th>
                                <th class="px-4 py-3 text-left">{{ __('all.from') }}</th>
                                <th class="px-4 py-3 text-left">{{ __('all.to') }}</th>
                                <th class="px-4 py-3 text-left">{{ __('all.time') }}</th>
                                <th class="px-4 py-3 text-left">{{ __('all.schedule_date') }}</th>
                                <th class="px-4 py-3 text-left">{{ __('all.action') }}</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($busList as $bus)
                                @if (!empty($bus['schedules']))
                                    @foreach ($bus['schedules'] as $schedule)
                                        <tr class="border-b border-gray-200 hover:bg-gray-50 cursor-pointer transition-colors duration-150" data-bus="{{ $bus['bus_number'] ?? 'N/A' }}" data-from="{{ $schedule['from'] ?? 'N/A' }}" data-to="{{ $schedule['to'] ?? 'N/A' }}" data-time="{{ $schedule['start'] ?? 'N/A' }} -> {{ $schedule['end'] ?? 'N/A' }}" data-date="{{ $schedule['schedule_date'] ?? 'N/A' }}">
                                            <td class="px-4 py-3">{{ $loop->iteration }}</td>
                                            <td class="px-4 py-3">{{ $bus['bus_number'] ?? 'N/A' }}</td>
                                            <td class="px-4 py-3">{{ $schedule['from'] ?? 'N/A' }}</td>
                                            <td class="px-4 py-3">{{ $schedule['to'] ?? 'N/A' }}</td>
                                            <td class="px-4 py-3">{{ $schedule['start'] ?? 'N/A' }} -> {{ $schedule['end'] ?? 'N/A' }}</td>
                                            <td class="px-4 py-3">{{ $schedule['schedule_date'] ?? 'N/A' }}</td>
                                            <td class="px-4 py-3">
                                                <form action="{{ route('customer.mybooking.search.form') }}" method="GET">
                                                    @csrf
                                                    <input type="hidden" name="departure_city" value="{{ App\Models\City::where('name', $schedule['from'])->value('id') ?? '' }}">
                                                    <input type="hidden" name="arrival_city" value="{{ App\Models\City::where('name', $schedule['to'])->value('id') ?? '' }}">
                                                    <input type="hidden" name="departure_date" value="{{ $schedule['schedule_date'] ?? '' }}">
                                                    <button type="submit" class="inline-flex items-center px-3 py-1 bg-indigo-500 text-white rounded-md hover:bg-indigo-600 transition-colors">
                                                        <i class="fas fa-ticket-alt mr-1"></i> {{ __('all.book') }}
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    @endforeach
                                @else
                                    <tr class="border-b border-gray-200 hover:bg-gray-50">
                                        <td class="px-4 py-3">{{ $loop->iteration }}</td>
                                        <td class="px-4 py-3">{{ $bus['bus_number'] ?? 'N/A' }}</td>
                                        <td class="px-4 py-3">N/A</td>
                                        <td class="px-4 py-3">N/A</td>
                                        <td class="px-4 py-3">N/A</td>
                                        <td class="px-4 py-3">N/A</td>
                                        <td class="px-4 py-3">
                                            <span class="text-gray-500">{{ __('all.no_schedule') }}</span>
                                        </td>
                                    </tr>
                                @endif
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        @endif

        <!-- Modal -->
        <dialog id="scheduleModal" class="p-6 rounded-lg max-w-lg w-full">
            <div class="flex justify-between items-center mb-4">
                <h2 class="text-lg font-semibold text-gray-800">{{ __('all.schedule_details') }}</h2>
                <button id="closeModal" class="text-gray-500 hover:text-gray-700">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="space-y-2 text-gray-700">
                <p><strong>{{ __('all.bus_number') }}:</strong> <span id="modal-bus"></span></p>
                <p><strong>{{ __('all.from') }}:</strong> <span id="modal-from"></span></p>
                <p><strong>{{ __('all.to') }}:</strong> <span id="modal-to"></span></p>
                <p><strong>{{ __('all.time') }}:</strong> <span id="modal-time"></span></p>
                <p><strong>{{ __('all.schedule_date') }}:</strong> <span id="modal-date"></span></p>
            </div>
            <div class="mt-6 flex justify-end">
                <button id="closeModalBtn" class="px-4 py-2 bg-gray-200 text-gray-700 rounded-md hover:bg-gray-300">{{ __('all.close') }}</button>
            </div>
        </dialog>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.tailwindcss.min.js"></script>
    <script>
        $(document).ready(function() {
            // Initialize Select2
            $('#departure_city, #arrival_city, #bus_name, #bus_type').select2({
                placeholder: "{{ __('all.select_departure_city') }}", // Using a translation as a placeholder
                allowClear: true,
                width: '100%'
            });

            // Set minimum date to today
            const today = new Date().toISOString().split('T')[0];
            $('#departure_date').attr('min', today);

            // Tab switching
            $('.search-tab').click(function() {
                $('.search-tab').removeClass('bg-indigo-500 text-white').addClass('text-gray-500');
                $(this).addClass('bg-indigo-500 text-white').removeClass('text-gray-500');
                $('.search-form').addClass('hidden');
                $(`#${$(this).data('tab')}-form`).removeClass('hidden');
            });

            // Ensure date input is clickable
            $('#departure_date').on('click', function() {
                $(this).focus();
            });

            // Initialize DataTable
            $('#busTable').DataTable({
                responsive: false,
                scrollX: false,
                paging: true,
                pageLength: 10,
                searching: true,
                ordering: true,
                language: {
                    emptyTable: "{{ __('all.no_buses_available') }}",
                    lengthMenu: "{{ __('all.show') ?? 'Show' }} _MENU_ {{ __('all.entries') ?? 'entries' }}",
                    search: "{{ __('all.search') ?? 'Search' }}:",
                    info: "{{ __('all.showing') ?? 'Showing' }} _START_ {{ __('all.to') ?? 'to' }} _END_ {{ __('all.of') ?? 'of' }} _TOTAL_ {{ __('all.entries') ?? 'entries' }}",
                    infoEmpty: "{{ __('all.showing') ?? 'Showing' }} 0 {{ __('all.to') ?? 'to' }} 0 {{ __('all.of') ?? 'of' }} 0 {{ __('all.entries') ?? 'entries' }}",
                    paginate: {
                        first: "{{ __('all.first') ?? 'First' }}",
                        last: "{{ __('all.last') ?? 'Last' }}",
                        next: "{{ __('all.next') ?? 'Next' }}",
                        previous: "{{ __('all.previous') ?? 'Previous' }}"
                    }
                }
            });

            // Modal logic
            $('tbody tr').on('click', function(e) {
                if ($(e.target).closest('button, a').length) return;
                const row = $(this);
                if (row.find('td').eq(2).text() !== 'N/A') {
                    $('#modal-bus').text(row.data('bus'));
                    $('#modal-from').text(row.data('from'));
                    $('#modal-to').text(row.data('to'));
                    $('#modal-time').text(row.data('time'));
                    $('#modal-date').text(row.data('date'));
                    document.getElementById('scheduleModal').showModal();
                }
            });

            $('#closeModal, #closeModalBtn').on('click', function() {
                document.getElementById('scheduleModal').close();
            });
        });
    </script>
@endsection
