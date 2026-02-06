@extends('vender.app')

@section('title', 'Add New Parcel')

@section('content')
    <div class="container mx-auto px-4 py-8">
        <div class="max-w-3xl mx-auto">
            <div class="bg-white shadow-xl rounded-2xl overflow-hidden">
                <div class="bg-gradient-to-r from-blue-600 to-blue-800 px-8 py-6">
                    <h4 class="text-2xl font-bold text-white">Add New Parcel</h4>
                    <p class="text-blue-100 mt-1">Assigning to Bus: <span
                            class="font-semibold">{{ $bus->bus_number }}</span> ({{ $bus->campany->name }})</p>
                </div>

                <div class="p-8">
                    @if ($errors->any())
                        <div class="mb-6 p-4 bg-red-50 border-l-4 border-red-500 rounded-lg">
                            <div class="flex">
                                <div class="flex-shrink-0">
                                    <svg class="h-5 w-5 text-red-400" fill="currentColor" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd"
                                            d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z"
                                            clip-rule="evenodd" />
                                    </svg>
                                </div>
                                <div class="ml-3">
                                    <h3 class="text-sm font-medium text-red-800">Please correct the following errors:</h3>
                                    <ul class="mt-2 text-sm text-red-700 list-disc list-inside">
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            </div>
                        </div>
                    @endif

                    <form action="{{ route('vender.parcels.store') }}" method="POST" class="space-y-6">
                        @csrf
                        <input type="hidden" name="bus_id" value="{{ $bus->id }}">

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label for="parcel_number" class="block text-sm font-medium text-gray-700 mb-1">Parcel
                                    Number *</label>
                                <input type="text" name="parcel_number" id="parcel_number"
                                    value="{{ old('parcel_number', 'PCL-' . strtoupper(Str::random(6))) }}" required
                                    class="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all"
                                    placeholder="e.g. PCL-123456">
                            </div>

                            <div>
                                <label for="parcel_type" class="block text-sm font-medium text-gray-700 mb-1">Parcel Type
                                    *</label>
                                <select name="parcel_type" id="parcel_type" required
                                    class="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all">
                                    <option value="" disabled selected>Select Tag Type</option>
                                    <option value="Box" {{ old('parcel_type') == 'Box' ? 'selected' : '' }}>Box</option>
                                    <option value="Bag" {{ old('parcel_type') == 'Bag' ? 'selected' : '' }}>Bag</option>
                                    <option value="Envelope" {{ old('parcel_type') == 'Envelope' ? 'selected' : '' }}>Envelope
                                    </option>
                                    <option value="Electronic" {{ old('parcel_type') == 'Electronic' ? 'selected' : '' }}>
                                        Electronic</option>
                                    <option value="Other" {{ old('parcel_type') == 'Other' ? 'selected' : '' }}>Other</option>
                                </select>
                            </div>
                            </div>
                            
                            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                                <div>
                                    <label for="weight" class="block text-sm font-medium text-gray-700 mb-1">Weight (kg)</label>
                                    <input type="number" name="weight" id="weight" step="0.01"
                                        value="{{ old('weight') }}"
                                        class="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all"
                                        placeholder="0.00">
                                </div>
                                <div>
                                    <label for="height" class="block text-sm font-medium text-gray-700 mb-1">Height (cm)</label>
                                    <input type="number" name="height" id="height" step="0.01"
                                        value="{{ old('height') }}"
                                        class="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all"
                                        placeholder="0.00">
                                </div>
                                <div>
                                    <label for="width" class="block text-sm font-medium text-gray-700 mb-1">Width (cm)</label>
                                    <input type="number" name="width" id="width" step="0.01"
                                        value="{{ old('width') }}"
                                        class="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all"
                                        placeholder="0.00">
                                </div>
                            </div>
                        </div>

                        <div>
                            <label for="amount_paid" class="block text-sm font-medium text-gray-700 mb-1">Amount Paid (TZS)
                                *</label>
                            <div class="relative">
                                <span
                                    class="absolute left-4 top-1/2 -translate-y-1/2 text-gray-500 font-semibold">Tsh.</span>
                                <input type="number" name="amount_paid" id="amount_paid" step="0.01"
                                    value="{{ old('amount_paid') }}" required
                                    class="w-full pl-14 pr-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all"
                                    placeholder="0.00">
                            </div>
                        </div>

                        <div>
                            <label for="description"
                                class="block text-sm font-medium text-gray-700 mb-1">Description</label>
                            <textarea name="description" id="description" rows="4"
                                class="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all"
                                placeholder="Briefly describe the contents of the parcel...">{{ old('description') }}</textarea>
                        </div>

                        <div class="flex items-center justify-end space-x-4 pt-4">
                            <a href="{{ route('vender.parcels.find_bus') }}"
                                class="px-6 py-3 text-gray-600 font-semibold hover:text-gray-800 transition-colors">
                                Back
                            </a>
                            <button type="submit"
                                class="px-10 py-3 bg-blue-600 text-white rounded-xl font-bold hover:bg-blue-700 transition-all shadow-lg transform active:scale-95">
                                Save & Assign Parcel
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection