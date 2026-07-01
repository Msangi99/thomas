@extends('vender.app')

@section('title', 'Add New Parcel')

@section('content')
<div class="vendor-dash fade-in">
    <header class="vendor-dash__header">
        <div class="vendor-dash__welcome">
            <p class="vendor-dash__eyebrow">{{ __('all.highlink_isgc') }}</p>
            <h1 class="vendor-dash__title">Register new parcel</h1>
            <p class="vendor-dash__subtitle">{{ $bus->bus_number }} · {{ $bus->campany->name }}</p>
        </div>
        <div class="vendor-dash__actions">
            <a href="{{ route('vender.parcels.find_bus') }}" class="page-btn page-btn--outline">
                <i class="fas fa-arrow-left"></i> Back
            </a>
        </div>
    </header>

    <div class="vendor-parcel-form-card">
        @if ($errors->any())
            <div class="booking-alert booking-alert--error mb-6" role="alert">
                <ul class="list-disc list-inside text-sm mb-0">
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <form action="{{ route('vender.parcels.store') }}" method="POST" class="space-y-5">
            @csrf
            <input type="hidden" name="bus_id" value="{{ $bus->id }}">

            <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
                <div class="vendor-form-field">
                    <label for="parcel_number">Parcel number</label>
                    <input type="text" name="parcel_number" id="parcel_number"
                        value="{{ old('parcel_number', 'PCL-' . strtoupper(Str::random(6))) }}" required readonly
                        class="page-input bg-gray-50">
                </div>
                <div class="vendor-form-field">
                    <label for="parcel_type">Parcel type</label>
                    <select name="parcel_type" id="parcel_type" required class="page-input">
                        <option value="" disabled {{ old('parcel_type') ? '' : 'selected' }}>Select type</option>
                        @foreach (['Box', 'Bag', 'Envelope', 'Electronic', 'Other'] as $type)
                            <option value="{{ $type }}" {{ old('parcel_type') == $type ? 'selected' : '' }}>{{ $type }}</option>
                        @endforeach
                    </select>
                </div>
            </div>

            <div class="vendor-parcel-form-card__section">
                <p class="text-sm font-semibold text-gray-700 mb-3">Dimensions &amp; weight</p>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                    <div class="vendor-form-field">
                        <label for="weight">Weight (kg)</label>
                        <input type="number" name="weight" id="weight" step="0.01" value="{{ old('weight') }}" class="page-input" placeholder="0.00">
                    </div>
                    <div class="vendor-form-field">
                        <label for="height">Height (cm)</label>
                        <input type="number" name="height" id="height" step="0.01" value="{{ old('height') }}" class="page-input" placeholder="0.00">
                    </div>
                    <div class="vendor-form-field">
                        <label for="width">Width (cm)</label>
                        <input type="number" name="width" id="width" step="0.01" value="{{ old('width') }}" class="page-input" placeholder="0.00">
                    </div>
                </div>
            </div>

            <div class="vendor-form-field">
                <label for="amount_paid">Amount paid ({{ $currency }})</label>
                <input type="number" name="amount_paid" id="amount_paid" step="0.01" value="{{ old('amount_paid') }}" required class="page-input" placeholder="0.00">
            </div>

            <div class="vendor-form-field">
                <label for="description">Description</label>
                <textarea name="description" id="description" rows="3" class="page-input resize-none" placeholder="Brief description…">{{ old('description') }}</textarea>
            </div>

            <div class="flex items-center justify-between pt-4 border-t border-gray-100">
                <a href="{{ route('vender.parcels.find_bus') }}" class="page-btn page-btn--outline">
                    <i class="fas fa-arrow-left"></i> Back
                </a>
                <button type="submit" class="page-btn">
                    Save parcel <i class="fas fa-check"></i>
                </button>
            </div>
        </form>
    </div>
</div>
@endsection
