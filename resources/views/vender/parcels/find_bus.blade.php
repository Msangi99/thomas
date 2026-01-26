@extends('vender.app')

@section('title', 'Find Bus for Parcel')

@section('content')
    <div class="container mx-auto px-4 py-8">
        <div class="max-w-7xl mx-auto">
            <div class="bg-white shadow-lg rounded-2xl overflow-hidden">
                <div class="bg-gradient-to-r from-blue-600 to-blue-800 px-6 py-4">
                    <h4 class="text-xl font-semibold text-white">Find Bus to Assign Parcel</h4>
                </div>

                <div class="p-6">
                    <form action="{{ route('vender.parcels.find_bus') }}" method="GET" class="mb-8">
                        <div class="flex gap-4">
                            <div class="flex-grow">
                                <input type="text" name="query" value="{{ request('query') }}"
                                    placeholder="Search by Bus Number or Company Name"
                                    class="w-full pl-4 pr-10 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all">
                            </div>
                            <button type="submit"
                                class="px-8 py-3 bg-blue-600 text-white rounded-xl font-semibold hover:bg-blue-700 transition-all shadow-md">
                                Search
                            </button>
                        </div>
                    </form>

                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        @forelse ($buses as $bus)
                            <div class="bg-gray-50 rounded-2xl p-6 border border-gray-100 hover:shadow-md transition-all">
                                <div class="flex justify-between items-start mb-4">
                                    <div>
                                        <h3 class="text-lg font-bold text-gray-800">{{ $bus->bus_number }}</h3>
                                        <p class="text-blue-600 font-medium">{{ $bus->campany->name }}</p>
                                    </div>
                                    <span class="px-3 py-1 bg-blue-100 text-blue-800 rounded-full text-xs font-semibold">
                                        {{ $bus->bus_type ?: 'Standard' }}
                                    </span>
                                </div>

                                <div class="space-y-2 mb-6 text-sm text-gray-600">
                                    @if($bus->route)
                                        <div class="flex items-center">
                                            <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z">
                                                </path>
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                            </svg>
                                            {{ $bus->route->from }} ➔ {{ $bus->route->to }}
                                        </div>
                                    @endif
                                    @if($bus->schedule)
                                        <div class="flex items-center">
                                            <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                            </svg>
                                            Next Loading:
                                            {{ \Carbon\Carbon::parse($bus->schedule->schedule_date)->format('d M Y') }} at
                                            {{ $bus->schedule->start }}
                                        </div>
                                    @endif
                                </div>

                                <a href="{{ route('vender.parcels.create', $bus->id) }}"
                                    class="block w-full text-center py-3 bg-white text-blue-600 border border-blue-600 rounded-xl font-bold hover:bg-blue-600 hover:text-white transition-all">
                                    Select This Bus
                                </a>
                            </div>
                        @empty
                            <div class="col-span-full py-12 text-center text-gray-400">
                                No buses found matching your search.
                            </div>
                        @endforelse
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection