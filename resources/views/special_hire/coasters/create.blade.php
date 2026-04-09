@extends('special_hire.app')

@section('title', 'Add Coaster')
@section('page_title', 'Add New Coaster')
@section('page_subtitle', 'Add a new coaster to your fleet')

@section('content')
<div class="max-w-3xl mx-auto">
    <div class="bg-white rounded-2xl shadow-lg overflow-hidden">
        <div class="px-6 py-4 border-b border-gray-100">
            <h3 class="text-lg font-bold text-gray-800">Coaster Details</h3>
        </div>

        <form action="{{ route('special_hire.coasters.store') }}" method="POST" enctype="multipart/form-data" class="p-6 space-y-6">
            @csrf

            <!-- Vehicle Info -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Coaster Name *</label>
                    <input type="text" name="name" value="{{ old('name') }}" required
                           class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500"
                           placeholder="e.g., Coaster Premium A">
                    @error('name')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Plate Number *</label>
                    <input type="text" name="plate_number" value="{{ old('plate_number') }}" required
                           class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500"
                           placeholder="e.g., T 123 ABC">
                    @error('plate_number')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Capacity (Seats) *</label>
                    <input type="number" name="capacity" value="{{ old('capacity', 30) }}" required min="1" max="100"
                           class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500">
                    @error('capacity')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Model</label>
                    <input type="text" name="model" value="{{ old('model') }}"
                           class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500"
                           placeholder="e.g., Toyota Coaster 2022">
                    @error('model')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Color</label>
                    <input type="text" name="color" value="{{ old('color') }}"
                           class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500"
                           placeholder="e.g., White">
                    @error('color')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                </div>

                <div class="md:col-span-2">
                    <div class="rounded-xl border-2 border-dashed border-teal-200 bg-teal-50/50 p-5">
                        <label class="block text-sm font-medium text-gray-800 mb-1" for="coaster-image-input">Vehicle photo</label>
                        <p class="text-xs text-gray-600 mb-3">Optional. JPEG, PNG, or WebP, up to 2&nbsp;MB.</p>
                        <div id="coaster-image-preview" class="hidden mb-4">
                            <img id="coaster-image-preview-img" src="" alt="" class="max-h-40 rounded-lg border border-gray-200 shadow-sm object-cover">
                        </div>
                        <input type="file" name="image" id="coaster-image-input" accept="image/jpeg,image/png,image/webp,image/jpg"
                               class="block w-full text-sm text-gray-700 file:mr-4 file:py-2.5 file:px-4 file:rounded-lg file:border-0 file:text-sm file:font-medium file:bg-teal-600 file:text-white hover:file:bg-teal-700 file:cursor-pointer cursor-pointer">
                        @error('image')<p class="text-red-600 text-sm mt-2">{{ $message }}</p>@enderror
                    </div>
                </div>
            </div>

            <!-- Driver Info -->
            <div class="border-t border-gray-100 pt-6">
                <h4 class="text-md font-semibold text-gray-800 mb-4">Driver Information</h4>
                <p class="text-sm text-gray-600 mb-2">Add driver contact and credentials to create the driver&rsquo;s login.</p>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Driver Name</label>
                        <input type="text" name="driver_name" value="{{ old('driver_name') }}"
                               class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500"
                               placeholder="e.g., John Doe">
                        @error('driver_name')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Driver Contact</label>
                        <input type="text" name="driver_contact" value="{{ old('driver_contact') }}"
                               class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500"
                               placeholder="e.g., +255712345678">
                        @error('driver_contact')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Driver Email</label>
                        <input type="email" name="driver_email" value="{{ old('driver_email') }}"
                               class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500"
                               placeholder="e.g., driver@example.com">
                        @error('driver_email')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Driver Password</label>
                        <input type="password" name="driver_password"
                               class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500"
                               placeholder="Minimum 6 characters">
                        @error('driver_password')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                    </div>
                </div>
            </div>

            <!-- Features -->
            <div class="border-t border-gray-100 pt-6">
                <label class="block text-sm font-medium text-gray-700 mb-2">Features & Amenities</label>
                <textarea name="features" rows="3"
                          class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500"
                          placeholder="e.g., Air Conditioning, WiFi, TV, Reclining Seats">{{ old('features') }}</textarea>
                @error('features')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
            </div>

            <!-- Pricing -->
            <div class="border-t border-gray-100 pt-6">
                <h4 class="text-md font-semibold text-gray-800 mb-4">Pricing (Per KM)</h4>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Base Price (Tsh) - <span class="text-xs text-gray-500">Leave as 0 for distance-only pricing</span></label>
                        <input type="number" name="base_price" value="{{ old('base_price', 0) }}" required min="0" step="1000"
                               class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500">
                        @error('base_price')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Price per KM (Tsh) *</label>
                        <input type="number" name="price_per_km" value="{{ old('price_per_km', 2500) }}" required min="0" step="100"
                               class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500">
                        @error('price_per_km')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Minimum KM *</label>
                        <input type="number" name="min_km" value="{{ old('min_km', 10) }}" required min="1"
                               class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500">
                        @error('min_km')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Weekend Surcharge (%)</label>
                        <input type="number" name="weekend_surcharge_percent" value="{{ old('weekend_surcharge_percent', 15) }}" min="0" max="100" step="0.01"
                               class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500">
                        @error('weekend_surcharge_percent')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Night Surcharge (%)</label>
                        <input type="number" name="night_surcharge_percent" value="{{ old('night_surcharge_percent', 20) }}" min="0" max="100" step="0.01"
                               class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500">
                        @error('night_surcharge_percent')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                    </div>
                </div>
            </div>

            <!-- Submit -->
            <div class="border-t border-gray-100 pt-6 flex items-center justify-end space-x-4">
                <a href="{{ route('special_hire.coasters') }}" class="px-6 py-2.5 border border-gray-300 text-gray-700 rounded-xl hover:bg-gray-50 transition-colors font-medium">
                    Cancel
                </a>
                <button type="submit" class="btn-primary px-6 py-2.5 text-white rounded-xl font-medium">
                    Add Coaster
                </button>
            </div>
        </form>
    </div>
</div>
@push('scripts')
<script>
(function () {
    var input = document.getElementById('coaster-image-input');
    if (!input) return;
    input.addEventListener('change', function () {
        var file = input.files && input.files[0];
        var wrap = document.getElementById('coaster-image-preview');
        var img = document.getElementById('coaster-image-preview-img');
        if (!wrap || !img) return;
        if (!file) {
            wrap.classList.add('hidden');
            img.removeAttribute('src');
            return;
        }
        img.src = URL.createObjectURL(file);
        img.alt = 'Preview';
        wrap.classList.remove('hidden');
    });
})();
</script>
@endpush
@endsection

