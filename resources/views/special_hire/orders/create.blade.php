@extends('special_hire.app')

@section('title', 'New Order')
@section('page_title', 'Create New Order')
@section('page_subtitle', 'Book a coaster for a customer — step by step')

@section('content')
<div class="max-w-4xl mx-auto">
    <div class="bg-white rounded-2xl shadow-lg overflow-hidden border border-teal-100/80">
        <div class="px-6 py-4 border-b border-gray-100 bg-gradient-to-r from-teal-50 to-cyan-50">
            <h3 class="text-lg font-bold text-gray-800">New booking</h3>
            <p class="text-sm text-gray-600 mt-1">Complete each step, then review the price before submitting.</p>
        </div>

        @if($coasters->isEmpty())
            <div class="p-6">
                <div class="bg-amber-50 border border-amber-200 rounded-xl p-4 text-amber-900">
                    <p class="font-medium">No available coasters</p>
                    <p class="text-sm mt-1">All coasters are either on hire or under maintenance.</p>
                    <a href="{{ route('special_hire.coasters.create') }}" class="text-sm text-amber-950 underline mt-2 inline-block font-medium">Add a new coaster</a>
                </div>
            </div>
        @else
        <form action="{{ route('special_hire.orders.store') }}" method="POST" class="p-6" id="orderForm">
            @csrf

            <!-- Step indicator -->
            <nav class="mb-8" aria-label="Booking steps">
                <ol class="flex flex-wrap items-center gap-2 sm:gap-0 sm:justify-between text-xs sm:text-sm" id="wizard-steps">
                    @php
                        $labels = ['Vehicle', 'Customer', 'Route', 'Schedule', 'Review'];
                    @endphp
                    @foreach($labels as $i => $label)
                        <li class="flex items-center gap-2 {{ $i > 0 ? 'sm:pl-2' : '' }}">
                            @if($i > 0)
                                <span class="hidden sm:inline w-6 h-0.5 rounded-full bg-gray-200 wizard-connector" data-connector="{{ $i }}"></span>
                            @endif
                            <div class="wizard-step-pill flex items-center gap-2 rounded-full px-3 py-1.5 border-2 transition-colors"
                                 data-step-target="{{ $i }}" aria-current="false">
                                <span class="flex h-7 w-7 items-center justify-center rounded-full text-xs font-bold bg-gray-100 text-gray-500 wizard-step-num">{{ $i + 1 }}</span>
                                <span class="font-semibold text-gray-500 wizard-step-label">{{ $label }}</span>
                            </div>
                        </li>
                    @endforeach
                </ol>
            </nav>

            <!-- Step 0: Coaster -->
            <div class="wizard-pane space-y-6" data-wizard-step="0">
                <h4 class="text-md font-semibold text-gray-800">Select vehicle</h4>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Coaster *</label>
                    <select name="coaster_id" id="coaster_id" required
                            class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500">
                        <option value="">-- Select Coaster --</option>
                        @foreach($coasters as $coaster)
                            <option value="{{ $coaster->id }}"
                                    data-base-price="{{ $coaster->pricing->base_price ?? 0 }}"
                                    data-price-per-km="{{ $coaster->pricing->price_per_km ?? 0 }}"
                                    data-min-km="{{ $coaster->pricing->min_km ?? 10 }}"
                                    {{ old('coaster_id') == $coaster->id ? 'selected' : '' }}>
                                {{ $coaster->name }} ({{ $coaster->plate_number }}) — {{ $coaster->capacity }} seats
                            </option>
                        @endforeach
                    </select>
                    @error('coaster_id')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                </div>
            </div>

            <!-- Step 1: Customer -->
            <div class="wizard-pane space-y-6 hidden" data-wizard-step="1">
                <h4 class="text-md font-semibold text-gray-800">Customer details</h4>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Name *</label>
                        <input type="text" name="customer_name" id="customer_name" value="{{ old('customer_name') }}" required
                               class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500"
                               placeholder="Full name">
                        @error('customer_name')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Phone *</label>
                        <input type="text" name="customer_phone" id="customer_phone" value="{{ old('customer_phone') }}" required
                               class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500"
                               placeholder="+255…">
                        @error('customer_phone')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Email</label>
                        <input type="email" name="customer_email" id="customer_email" value="{{ old('customer_email') }}"
                               class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500"
                               placeholder="customer@email.com">
                        @error('customer_email')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                    </div>
                </div>
            </div>

            <!-- Step 2: Route -->
            <div class="wizard-pane space-y-6 hidden" data-wizard-step="2">
                <h4 class="text-md font-semibold text-gray-800">Route</h4>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Pickup *</label>
                        <input type="text" name="pickup_location" id="pickup_location" value="{{ old('pickup_location') }}" required
                               class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500"
                               placeholder="e.g. Dar es Salaam, Posta">
                        @error('pickup_location')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Drop-off *</label>
                        <input type="text" name="dropoff_location" id="dropoff_location" value="{{ old('dropoff_location') }}" required
                               class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500"
                               placeholder="e.g. Bagamoyo Beach">
                        @error('dropoff_location')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Distance (km) *</label>
                        <input type="number" name="distance_km" id="distance_km" value="{{ old('distance_km', 10) }}" required min="1" step="0.1"
                               class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500">
                        @error('distance_km')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Passengers *</label>
                        <input type="number" name="passengers_count" id="passengers_count" value="{{ old('passengers_count', 1) }}" required min="1" max="100"
                               class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500">
                        @error('passengers_count')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                    </div>
                </div>
            </div>

            <!-- Step 3: Schedule -->
            <div class="wizard-pane space-y-6 hidden" data-wizard-step="3">
                <h4 class="text-md font-semibold text-gray-800">Schedule &amp; notes</h4>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Hire date *</label>
                        <input type="date" name="hire_date" id="hire_date" value="{{ old('hire_date', date('Y-m-d')) }}" required
                               min="{{ date('Y-m-d') }}"
                               class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500">
                        @error('hire_date')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Pickup time *</label>
                        <input type="time" name="hire_time" id="hire_time" value="{{ old('hire_time', '08:00') }}" required
                               class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500">
                        @error('hire_time')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Return date</label>
                        <input type="date" name="return_date" id="return_date" value="{{ old('return_date') }}"
                               class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500">
                        @error('return_date')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Return time</label>
                        <input type="time" name="return_time" id="return_time" value="{{ old('return_time') }}"
                               class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500">
                        @error('return_time')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                    </div>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Purpose</label>
                        <input type="text" name="purpose" id="purpose" value="{{ old('purpose') }}"
                               class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500"
                               placeholder="e.g. Wedding, corporate">
                        @error('purpose')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Notes</label>
                        <input type="text" name="notes" id="notes" value="{{ old('notes') }}"
                               class="w-full px-4 py-2.5 border border-gray-300 rounded-xl focus:ring-2 focus:ring-teal-500 focus:border-teal-500"
                               placeholder="Special requests">
                        @error('notes')<p class="text-red-500 text-sm mt-1">{{ $message }}</p>@enderror
                    </div>
                </div>
            </div>

            <!-- Step 4: Review -->
            <div class="wizard-pane space-y-6 hidden" data-wizard-step="4">
                <h4 class="text-md font-semibold text-gray-800">Review &amp; price</h4>
                <div class="rounded-xl border border-gray-200 bg-gray-50/80 p-4 text-sm space-y-2" id="review-summary">
                    <p><span class="text-gray-500">Customer:</span> <span id="rev-customer" class="font-medium text-gray-900">—</span></p>
                    <p><span class="text-gray-500">Route:</span> <span id="rev-route" class="font-medium text-gray-900">—</span></p>
                    <p><span class="text-gray-500">When:</span> <span id="rev-when" class="font-medium text-gray-900">—</span></p>
                    <p><span class="text-gray-500">Passengers:</span> <span id="rev-passengers" class="font-medium text-gray-900">—</span></p>
                </div>
                <div class="bg-gradient-to-r from-teal-50 to-cyan-50 rounded-xl p-6 border border-teal-100">
                    <h4 class="text-md font-semibold text-gray-800 mb-4">Price estimate</h4>
                    <div class="space-y-2 text-sm" id="priceBreakdown">
                        <div class="flex justify-between">
                            <span class="text-gray-600">Distance (<span id="distanceDisplay">0</span> km × Tsh <span id="rateDisplay">0</span>):</span>
                            <span class="font-medium" id="kmAmountDisplay">Tsh 0</span>
                        </div>
                        <div class="flex justify-between" id="surchargeRow" style="display: none;">
                            <span class="text-gray-600">Surcharge (<span id="surchargeLabel"></span>):</span>
                            <span class="font-medium" id="surchargeDisplay">Tsh 0</span>
                        </div>
                        <hr class="border-teal-200 my-2">
                        <div class="flex justify-between text-lg font-bold text-teal-700">
                            <span>Total:</span>
                            <span id="totalDisplay">Tsh 0</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mt-8 pt-6 border-t border-gray-100 flex flex-wrap items-center justify-between gap-4">
                <a href="{{ route('special_hire.orders') }}" class="px-6 py-2.5 border border-gray-300 text-gray-700 rounded-xl hover:bg-gray-50 font-medium text-sm order-2 sm:order-1">
                    Cancel
                </a>
                <div class="flex gap-3 order-1 sm:order-2 w-full sm:w-auto justify-end">
                    <button type="button" id="wizard-back" class="hidden px-6 py-2.5 border border-gray-300 text-gray-800 rounded-xl hover:bg-gray-50 font-medium text-sm">
                        Back
                    </button>
                    <button type="button" id="wizard-next" class="btn-primary px-6 py-2.5 text-white rounded-xl font-medium text-sm">
                        Continue
                    </button>
                    <button type="submit" id="wizard-submit" class="hidden btn-primary px-6 py-2.5 text-white rounded-xl font-medium text-sm">
                        Create order
                    </button>
                </div>
            </div>
        </form>
        @endif
    </div>
</div>

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function() {
    var form = document.getElementById('orderForm');
    if (!form) return;

    var totalSteps = 5;
    var step = 0;
    var coasterSelect = document.getElementById('coaster_id');
    var distanceInput = document.getElementById('distance_km');
    var hireDateInput = document.getElementById('hire_date');
    var hireTimeInput = document.getElementById('hire_time');
    var btnBack = document.getElementById('wizard-back');
    var btnNext = document.getElementById('wizard-next');
    var btnSubmit = document.getElementById('wizard-submit');

    function showStep(s) {
        step = s;
        document.querySelectorAll('.wizard-pane').forEach(function (pane) {
            var ps = parseInt(pane.getAttribute('data-wizard-step'), 10);
            pane.classList.toggle('hidden', ps !== step);
        });
        btnBack.classList.toggle('hidden', step === 0);
        btnNext.classList.toggle('hidden', step === totalSteps - 1);
        btnSubmit.classList.toggle('hidden', step !== totalSteps - 1);

        document.querySelectorAll('.wizard-step-pill').forEach(function (pill) {
            var t = parseInt(pill.getAttribute('data-step-target'), 10);
            var num = pill.querySelector('.wizard-step-num');
            var lbl = pill.querySelector('.wizard-step-label');
            var active = t === step;
            var done = t < step;
            pill.setAttribute('aria-current', active ? 'step' : 'false');
            pill.classList.remove('border-teal-500', 'bg-teal-50', 'border-gray-200', 'bg-white');
            if (active) {
                pill.classList.add('border-teal-500', 'bg-teal-50');
                num.classList.remove('bg-gray-100', 'text-gray-500', 'bg-teal-600', 'text-white');
                num.classList.add('bg-teal-600', 'text-white');
                lbl.classList.remove('text-gray-500');
                lbl.classList.add('text-teal-900');
            } else if (done) {
                pill.classList.add('border-gray-200', 'bg-white');
                num.classList.remove('bg-gray-100', 'text-gray-500');
                num.classList.add('bg-teal-100', 'text-teal-800');
                lbl.classList.remove('text-gray-500');
                lbl.classList.add('text-gray-800');
            } else {
                pill.classList.add('border-gray-200', 'bg-white');
                num.classList.remove('bg-teal-600', 'text-white', 'bg-teal-100', 'text-teal-800');
                num.classList.add('bg-gray-100', 'text-gray-500');
                lbl.classList.remove('text-teal-900', 'text-gray-800');
                lbl.classList.add('text-gray-500');
            }
        });

        document.querySelectorAll('.wizard-connector').forEach(function (el) {
            var i = parseInt(el.getAttribute('data-connector'), 10);
            el.classList.toggle('bg-teal-400', i <= step);
            el.classList.toggle('bg-gray-200', i > step);
        });

        if (step === totalSteps - 1) {
            fillReview();
            calculatePrice();
        }
    }

    function fillReview() {
        var name = (document.getElementById('customer_name') || {}).value || '';
        var phone = (document.getElementById('customer_phone') || {}).value || '';
        document.getElementById('rev-customer').textContent = name ? (name + (phone ? ' · ' + phone : '')) : '—';
        var pu = (document.getElementById('pickup_location') || {}).value || '';
        var dr = (document.getElementById('dropoff_location') || {}).value || '';
        document.getElementById('rev-route').textContent = (pu && dr) ? (pu + ' → ' + dr) : '—';
        var hd = (document.getElementById('hire_date') || {}).value || '';
        var ht = (document.getElementById('hire_time') || {}).value || '';
        document.getElementById('rev-when').textContent = (hd && ht) ? (hd + ' at ' + ht) : '—';
        var p = (document.getElementById('passengers_count') || {}).value || '';
        document.getElementById('rev-passengers').textContent = p || '—';
    }

    function validateStep(s) {
        var pane = document.querySelector('.wizard-pane[data-wizard-step="' + s + '"]');
        if (!pane) return true;
        var fields = pane.querySelectorAll('input[required], select[required]');
        for (var i = 0; i < fields.length; i++) {
            if (!fields[i].reportValidity()) return false;
        }
        return true;
    }

    function calculatePrice() {
        if (!coasterSelect || !distanceInput || !hireDateInput || !hireTimeInput) return;
        var selectedOption = coasterSelect.options[coasterSelect.selectedIndex];
        if (!selectedOption.value) {
            resetPriceDisplay();
            return;
        }
        var pricePerKm = parseFloat(selectedOption.dataset.pricePerKm) || 0;
        var minKm = parseFloat(selectedOption.dataset.minKm) || 10;
        var distance = Math.max(parseFloat(distanceInput.value) || 0, minKm);
        var kmAmount = distance * pricePerKm;
        var surchargePercent = 0;
        var surchargeLabels = [];
        var hireDate = new Date(hireDateInput.value);
        var dayOfWeek = hireDate.getDay();
        if (dayOfWeek === 0 || dayOfWeek === 6) {
            surchargePercent += 15;
            surchargeLabels.push('Weekend +15%');
        }
        var parts = (hireTimeInput.value || '0:0').split(':');
        var hireHour = parseInt(parts[0], 10);
        if (hireHour >= 18 || hireHour < 6) {
            surchargePercent += 20;
            surchargeLabels.push('Night +20%');
        }
        var surchargeAmount = (kmAmount * surchargePercent) / 100;
        var total = kmAmount + surchargeAmount;
        document.getElementById('distanceDisplay').textContent = distance.toFixed(1);
        document.getElementById('rateDisplay').textContent = numberFormat(pricePerKm);
        document.getElementById('kmAmountDisplay').textContent = 'Tsh ' + numberFormat(kmAmount);
        var sr = document.getElementById('surchargeRow');
        if (surchargePercent > 0) {
            sr.style.display = 'flex';
            document.getElementById('surchargeLabel').textContent = surchargeLabels.join(', ');
            document.getElementById('surchargeDisplay').textContent = 'Tsh ' + numberFormat(surchargeAmount);
        } else {
            sr.style.display = 'none';
        }
        document.getElementById('totalDisplay').textContent = 'Tsh ' + numberFormat(total);
    }

    function resetPriceDisplay() {
        document.getElementById('distanceDisplay').textContent = '0';
        document.getElementById('rateDisplay').textContent = '0';
        document.getElementById('kmAmountDisplay').textContent = 'Tsh 0';
        document.getElementById('surchargeRow').style.display = 'none';
        document.getElementById('totalDisplay').textContent = 'Tsh 0';
    }

    function numberFormat(num) {
        return num.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }

    btnNext.addEventListener('click', function () {
        if (!validateStep(step)) return;
        if (step < totalSteps - 1) showStep(step + 1);
    });
    btnBack.addEventListener('click', function () {
        if (step > 0) showStep(step - 1);
    });

    if (coasterSelect) {
        coasterSelect.addEventListener('change', calculatePrice);
        distanceInput.addEventListener('input', calculatePrice);
        hireDateInput.addEventListener('change', calculatePrice);
        hireTimeInput.addEventListener('change', calculatePrice);
    }

    showStep(0);
});
</script>
@endpush
@endsection
