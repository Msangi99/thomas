@extends('vender.app')

@section('title', 'Add New Parcel')

@section('content')
@section('content')
    <div class="min-h-[80vh] flex items-center justify-center bg-gray-50/50 py-8 px-4 sm:px-6 lg:px-8">
        <div class="max-w-3xl w-full space-y-6">
            <div class="bg-white shadow-xl rounded-2xl overflow-hidden border border-gray-100 transform transition-all hover:shadow-2xl duration-300">
                <!-- Header Section -->
                <div class="bg-gradient-to-br from-indigo-600 to-blue-700 px-6 py-6 text-center relative overflow-hidden">
                    <div class="absolute top-0 right-0 -mr-8 -mt-8 opacity-10 transform rotate-12">
                        <svg class="w-48 h-48 text-white" fill="currentColor" viewBox="0 0 20 20">
                             <path d="M4 4a2 2 0 00-2 2v4a2 2 0 002 2V6h10a2 2 0 00-2-2H4zm2 6a2 2 0 012-2h8a2 2 0 012 2v4a2 2 0 01-2 2H8a2 2 0 01-2-2v-4zm6 4a2 2 0 100-4 2 2 0 000 4z"/>
                        </svg>
                    </div>
                    <h4 class="text-2xl font-bold text-white tracking-tight">Register New Parcel</h4>
                    <p class="text-indigo-100 mt-1 text-sm font-medium">
                        Bus: <span class="bg-indigo-500/30 px-2 py-0.5 rounded text-white">{{ $bus->bus_number }}</span> 
                        <span class="opacity-75 mx-2">|</span> 
                        {{ $bus->campany->name }}
                    </p>
                </div>

                <div class="p-6">
                    @if ($errors->any())
                        <div class="mb-6 p-3 bg-red-50 border-l-4 border-red-500 rounded-md animate-pulse">
                            <div class="flex items-start">
                                <div class="flex-shrink-0">
                                    <svg class="h-4 w-4 text-red-400" fill="currentColor" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
                                    </svg>
                                </div>
                                <div class="ml-3">
                                    <h3 class="text-xs font-medium text-red-800">Correct errors:</h3>
                                    <ul class="mt-1 text-xs text-red-700 list-disc list-inside">
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            </div>
                        </div>
                    @endif

                    <form action="{{ route('vender.parcels.store') }}" method="POST" class="space-y-5">
                        @csrf
                        <input type="hidden" name="bus_id" value="{{ $bus->id }}">

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
                            <!-- Parcel Number -->
                            <div class="group">
                                <label for="parcel_number" class="block text-xs font-bold text-gray-700 mb-1 uppercase tracking-wider">Parcel Number</label>
                                <div class="relative">
                                    <div class="absolute inset-y-0 left-0 pl-2.5 flex items-center pointer-events-none">
                                        <svg class="h-4 w-4 text-gray-400 group-focus-within:text-indigo-500 transition-colors" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 20l4-16m2 16l4-16M6 9h14M4 15h14"/>
                                        </svg>
                                    </div>
                                    <input type="text" name="parcel_number" id="parcel_number"
                                        value="{{ old('parcel_number', 'PCL-' . strtoupper(Str::random(6))) }}" required readonly
                                        class="w-full pl-9 pr-3 py-2 text-sm rounded-lg border border-gray-200 bg-gray-50 text-gray-500 focus:ring-0 focus:border-gray-200 cursor-not-allowed">
                                </div>
                            </div>

                            <!-- Parcel Type -->
                            <div class="group">
                                <label for="parcel_type" class="block text-xs font-bold text-gray-700 mb-1 uppercase tracking-wider">Parcel Type</label>
                                <div class="relative">
                                    <div class="absolute inset-y-0 left-0 pl-2.5 flex items-center pointer-events-none">
                                        <svg class="h-4 w-4 text-gray-400 group-focus-within:text-indigo-500 transition-colors" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"/>
                                        </svg>
                                    </div>
                                    <select name="parcel_type" id="parcel_type" required
                                        class="w-full pl-9 pr-8 py-2 text-sm rounded-lg border border-gray-200 focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition-all shadow-sm hover:border-gray-300 bg-white">
                                        <option value="" disabled selected>Select Type</option>
                                        <option value="Box" {{ old('parcel_type') == 'Box' ? 'selected' : '' }}>Box</option>
                                        <option value="Bag" {{ old('parcel_type') == 'Bag' ? 'selected' : '' }}>Bag</option>
                                        <option value="Envelope" {{ old('parcel_type') == 'Envelope' ? 'selected' : '' }}>Envelope</option>
                                        <option value="Electronic" {{ old('parcel_type') == 'Electronic' ? 'selected' : '' }}>Electronic</option>
                                        <option value="Other" {{ old('parcel_type') == 'Other' ? 'selected' : '' }}>Other</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Dimensions -->
                        <div class="bg-gray-50 rounded-xl p-4 border border-gray-100">
                            <label class="block text-xs font-bold text-gray-700 mb-3 uppercase tracking-wider">Parcel Dimensions & Weight</label>
                            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                                <div class="group">
                                    <label for="weight" class="block text-[10px] font-semibold text-gray-500 mb-1 uppercase">Weight (kg)</label>
                                    <input type="number" name="weight" id="weight" step="0.01"
                                        value="{{ old('weight') }}"
                                        class="w-full px-3 py-1.5 text-sm rounded-lg border border-gray-200 focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition-all bg-white"
                                        placeholder="0.00">
                                </div>
                                <div class="group">
                                    <label for="height" class="block text-[10px] font-semibold text-gray-500 mb-1 uppercase">Height (cm)</label>
                                    <input type="number" name="height" id="height" step="0.01"
                                        value="{{ old('height') }}"
                                        class="w-full px-3 py-1.5 text-sm rounded-lg border border-gray-200 focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition-all bg-white"
                                        placeholder="0.00">
                                </div>
                                <div class="group">
                                    <label for="width" class="block text-[10px] font-semibold text-gray-500 mb-1 uppercase">Width (cm)</label>
                                    <input type="number" name="width" id="width" step="0.01"
                                        value="{{ old('width') }}"
                                        class="w-full px-3 py-1.5 text-sm rounded-lg border border-gray-200 focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition-all bg-white"
                                        placeholder="0.00">
                                </div>
                            </div>
                        </div>

                        <!-- Amount Paid -->
                        <div class="group">
                            <label for="amount_paid" class="block text-xs font-bold text-gray-700 mb-1 uppercase tracking-wider">Amount Paid</label>
                            <div class="relative rounded-lg shadow-sm">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <span class="text-gray-500 font-bold text-xs">Tsh</span>
                                </div>
                                <input type="number" name="amount_paid" id="amount_paid" step="0.01"
                                    value="{{ old('amount_paid') }}" required
                                    class="w-full pl-12 pr-3 py-2 text-sm rounded-lg border border-gray-200 focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition-all font-medium text-gray-900 placeholder-gray-300 hover:border-gray-300"
                                    placeholder="0.00">
                            </div>
                        </div>

                        <!-- Description -->
                        <div class="group">
                            <label for="description" class="block text-xs font-bold text-gray-700 mb-1 uppercase tracking-wider">Description</label>
                            <div class="relative">
                                 <textarea name="description" id="description" rows="3"
                                    class="w-full px-3 py-2 text-sm rounded-lg border border-gray-200 focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition-all resize-none shadow-sm hover:border-gray-300"
                                    placeholder="Brief description...">{{ old('description') }}</textarea>
                            </div>
                        </div>

                        <!-- Actions -->
                        <div class="flex items-center justify-between pt-4 border-t border-gray-100">
                            <a href="{{ route('vender.parcels.find_bus') }}"
                                class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-lg text-gray-700 bg-gray-100 hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-500 transition-colors">
                                <svg class="w-4 h-4 mr-1.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/></svg>
                                Back
                            </a>
                            <button type="submit"
                                class="inline-flex items-center px-6 py-2 border border-transparent text-sm font-bold rounded-lg text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 shadow-md transform hover:-translate-y-0.5 transition-all duration-200">
                                Save Parcel
                                <svg class="ml-1.5 -mr-0.5 w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"/></svg>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
@endsection