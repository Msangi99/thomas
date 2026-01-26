@extends('vender.app')

@section('title', 'Parcels Management')

@section('content')
    <div class="container mx-auto px-4 py-8">
        <div class="max-w-7xl mx-auto">
            <div class="bg-white shadow-lg rounded-2xl overflow-hidden">
                <div class="bg-gradient-to-r from-blue-600 to-blue-800 px-6 py-4 flex justify-between items-center">
                    <h4 class="text-xl font-semibold text-white">Parcels List</h4>
                    <a href="{{ route('vender.parcels.find_bus') }}"
                        class="px-4 py-2 bg-white text-blue-700 rounded-lg font-medium hover:bg-gray-100 transition-colors">
                        Add New Parcel
                    </a>
                </div>

                <div class="p-6">
                    @if(session('success'))
                        <div class="mb-4 p-4 bg-green-100 border-l-4 border-green-500 text-green-700">
                            {{ session('success') }}
                        </div>
                    @endif

                    <div class="overflow-x-auto">
                        <table class="w-full">
                            <thead>
                                <tr class="bg-gray-50 text-gray-600 text-sm uppercase tracking-wider">
                                    <th class="px-4 py-3 text-left font-medium">#</th>
                                    <th class="px-4 py-3 text-left font-medium">Parcel No</th>
                                    <th class="px-4 py-3 text-left font-medium">Type</th>
                                    <th class="px-4 py-3 text-left font-medium">Bus</th>
                                    <th class="px-4 py-3 text-left font-medium">Amount Paid</th>
                                    <th class="px-4 py-3 text-left font-medium">Date Added</th>
                                    <th class="px-4 py-3 text-left font-medium">Status</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-200">
                                @forelse ($parcels as $parcel)
                                    <tr class="hover:bg-gray-50 transition-colors duration-150">
                                        <td class="px-4 py-3">{{ $loop->iteration }}</td>
                                        <td class="px-4 py-3 font-semibold">{{ $parcel->parcel_number }}</td>
                                        <td class="px-4 py-3">{{ $parcel->parcel_type }}</td>
                                        <td class="px-4 py-3">
                                            <span class="block font-medium">{{ $parcel->bus->bus_number }}</span>
                                            <span class="text-xs text-gray-500">{{ $parcel->bus->campany->name }}</span>
                                        </td>
                                        <td class="px-4 py-3 text-green-600 font-bold">Tsh.
                                            {{ number_format($parcel->amount_paid, 2) }}</td>
                                        <td class="px-4 py-3 text-gray-600">{{ $parcel->created_at->format('d M Y H:i') }}</td>
                                        <td class="px-4 py-3">
                                            <span
                                                class="px-2 py-1 bg-yellow-100 text-yellow-800 rounded-full text-xs">Assigned</span>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="7" class="px-4 py-3 text-center text-gray-500">No parcels found.</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>

                    <div class="mt-6">
                        {{ $parcels->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection