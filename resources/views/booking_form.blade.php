@extends('test.layouts.marketing')

@section('title', __('all.select_your_journey_points') . ' — ' . __('all.higlink_premium_travel'))

@push('styles')
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
    <link rel="stylesheet" href="https://unpkg.com/leaflet-routing-machine@3.2.12/dist/leaflet-routing-machine.css" />
@endpush

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => 'Book Your Trip',
        'title' => ($car->schedule->from ?? 'Route') . ' ➔ ' . ($car->schedule->to ?? ''),
        'subtitle' => __('all.choose_pickup_dropping_locations'),
        'image' => 'https://images.unsplash.com/photo-1570125909232-e097323dccff?w=1200&q=80',
    ])
@endsection

@section('content')
<section class="page-section page-section--alt">
    <div class="container mx-auto px-4 max-w-5xl">
        @include('test.partials.booking_steps', ['currentStep' => 1])

        @if (session('error'))
            <div class="booking-alert booking-alert--error fade-in" role="alert">
                <i class="fas fa-exclamation-circle mr-2"></i>{{ session('error') }}
            </div>
        @endif

        <div class="booking-card fade-in">
            <div class="booking-card__header">
                <h2 class="booking-card__title">{{ __('all.select_your_journey_points') }}</h2>
                <p class="booking-card__subtitle">{{ __('all.choose_pickup_dropping_locations') }}</p>
            </div>

            <div class="booking-card__body">
                <form id="busSearchForm" method="POST" action="{{ route('store') }}" class="booking-form">
                    @csrf

                    <div class="booking-summary">
                        <div class="booking-summary__item">
                            <span class="booking-summary__icon" aria-hidden="true"><i class="fas fa-bus"></i></span>
                            <div>
                                <p class="booking-summary__label">{{ __('all.bus_operator_label') }}</p>
                                <p class="booking-summary__value">{{ $car->busname->name ?? 'N/A' }}</p>
                            </div>
                        </div>
                        <div class="booking-summary__item">
                            <span class="booking-summary__icon" aria-hidden="true"><i class="fas fa-route"></i></span>
                            <div>
                                <p class="booking-summary__label">{{ __('all.route') }}</p>
                                <p class="booking-summary__value">{{ $car->schedule->from }} ➔ {{ $car->schedule->to }}</p>
                            </div>
                        </div>
                    </div>

                    <input type="hidden" name="bus_id" value="{{ $car->id }}">
                    <input type="hidden" name="route_id" value="{{ $car->route->id }}">
                    <input type="hidden" name="bus_name" value="{{ $car->busname->name }}">
                    <input type="hidden" name="schedule_id" value="{{ $car->schedule->id }}">

                    <div class="booking-grid booking-grid--2">
                        <div class="booking-field">
                            <label for="pickupPoint" class="booking-field__label">
                                <i class="fas fa-map-marker-alt" aria-hidden="true"></i>
                                {{ __('all.pickup_point_label') }}
                            </label>
                            <select class="page-input select2" id="pickupPoint" name="pickup_point">
                                <option value="">{{ __('all.select_pickup_point_placeholder') }}</option>
                                @if (isset($car->filtered_points))
                                    @foreach ($car->filtered_points as $value)
                                        @if ($value->point_mode == 1)
                                            <option value="{{ $value->point }}" {{ request('pickup_point_id') == $value->point ? 'selected' : '' }}>
                                                {{ $value->point }}
                                            </option>
                                        @endif
                                    @endforeach
                                @endif
                            </select>
                        </div>

                        <div class="booking-field">
                            <label for="dropoffPoint" class="booking-field__label">
                                <i class="fas fa-flag-checkered" aria-hidden="true"></i>
                                {{ __('all.dropoff_point_label') }}
                            </label>
                            <select class="page-input select2" id="dropoffPoint" name="dropping_point">
                                <option value="">{{ __('all.select_dropping_point_placeholder') }}</option>
                                @if (isset($car->filtered_points))
                                    @foreach ($car->filtered_points as $value)
                                        @if ($value->point_mode == 2)
                                            <option value="{{ $value->point }}" data-amount="{{ $value->amount }}"
                                                {{ request('dropping_point_id') == $value->point ? 'selected' : '' }}>
                                                {{ $value->point }}
                                            </option>
                                        @endif
                                    @endforeach
                                @endif
                            </select>
                        </div>
                    </div>

                    <div class="booking-field">
                        <label for="routeDistanceDisplay" class="booking-field__label">
                            <i class="fas fa-arrows-alt-h" aria-hidden="true"></i>
                            {{ __('all.route_distance_label') }}
                        </label>
                        <div class="flex">
                            <input type="text" id="routeDistanceDisplay" readonly
                                class="page-input rounded-r-none flex-1"
                                placeholder="{{ __('all.distance_will_be_calculated_placeholder') }}">
                            <span class="inline-flex items-center px-4 bg-gray-100 border border-l-0 border-gray-200 rounded-r-lg text-sm font-semibold text-gray-600">{{ __('all.km') }}</span>
                        </div>
                    </div>

                    <div class="booking-map-card">
                        <div class="booking-map-card__head">
                            <h3 class="booking-map-card__title">
                                <i class="fas fa-map-marked-alt text-[var(--home-primary)] mr-2"></i>
                                {{ __('all.interactive_map_title') }}
                            </h3>
                            <p class="text-sm text-gray-500 mt-1">{{ __('all.select_points_map_search_below_description') }}</p>
                        </div>

                        <div class="booking-map-card__body space-y-4">
                            <div class="booking-grid booking-grid--2">
                                <div class="booking-field mb-0">
                                    <label for="start" class="booking-field__label">
                                        <i class="fas fa-circle text-green-500" aria-hidden="true"></i>
                                        {{ __('all.pickup_location_label') }}
                                    </label>
                                    <input type="text" class="page-input" id="start"
                                        placeholder="{{ __('all.search_pickup_location_placeholder') }}"
                                        value="{{ $car->schedule->from }}">
                                </div>
                                <div class="booking-field mb-0">
                                    <label for="end" class="booking-field__label">
                                        <i class="fas fa-circle text-red-500" aria-hidden="true"></i>
                                        {{ __('all.dropping_location_label') }}
                                    </label>
                                    <input type="text" class="page-input" id="end"
                                        placeholder="{{ __('all.search_dropping_location_placeholder') }}"
                                        value="{{ $car->schedule->to }}">
                                </div>
                            </div>

                            <div class="flex flex-wrap items-center gap-2">
                                <span class="text-sm font-medium text-gray-600">{{ __('all.quick_locations_label') }}</span>
                                <button type="button" class="booking-chip" data-point="Dar es Salaam, Tanzania">Dar es Salaam</button>
                                <button type="button" class="booking-chip" data-point="Dodoma, Tanzania">Dodoma</button>
                                <button type="button" class="booking-chip" data-point="Arusha, Tanzania">Arusha</button>
                                <button type="button" class="booking-chip" data-point="Mwanza, Tanzania">Mwanza</button>
                                <button type="button" class="booking-chip" data-point="Mbeya, Tanzania">Mbeya</button>
                            </div>

                            <div class="flex flex-col sm:flex-row gap-3">
                                <button type="button" id="calculate" class="page-btn flex-1">
                                    <i class="fas fa-calculator"></i> {{ __('all.calculate_distance_button') }}
                                </button>
                                <button type="button" id="clear" class="page-btn page-btn--outline flex-1">
                                    <i class="fas fa-eraser"></i> {{ __('all.clear_points_button') }}
                                </button>
                            </div>

                            <div id="result" class="hidden p-3 bg-green-50 border border-green-100 rounded-lg">
                                <div class="flex items-start gap-2 text-sm text-gray-800">
                                    <i class="fas fa-info-circle text-[var(--home-primary)] mt-0.5"></i>
                                    <div id="result-content"></div>
                                </div>
                            </div>

                            <div id="map"></div>
                        </div>
                    </div>

                    <input type="hidden" name="dropping_point_amount" id="droppingPointAmount">
                    <input type="hidden" name="route_distance" id="routeDistance">

                    <button type="submit" class="page-btn w-full mt-6">
                        <i class="fas fa-arrow-right"></i> {{ __('all.search_available_buses') }}
                    </button>
                </form>
            </div>
        </div>
    </div>
</section>
@endsection

@push('scripts')
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
    <script src="https://unpkg.com/leaflet-routing-machine@3.2.12/dist/leaflet-routing-machine.js"></script>
    <script>
        $(function () {
            $('.select2').select2({
                placeholder: @json(__('all.select_a_point_placeholder')),
                allowClear: true,
                width: '100%'
            });
        });

        document.getElementById('dropoffPoint').addEventListener('change', function () {
            var selectedOption = this.options[this.selectedIndex];
            var amount = selectedOption.getAttribute('data-amount');
            document.getElementById('droppingPointAmount').value = amount || '';

            const selectedValue = this.value;
            let hiddenInput = document.getElementById('hiddenDropoffPoint');
            if (!hiddenInput) {
                hiddenInput = document.createElement('input');
                hiddenInput.type = 'hidden';
                hiddenInput.id = 'hiddenDropoffPoint';
                hiddenInput.name = 'hidden_dropping_point';
                document.getElementById('busSearchForm').appendChild(hiddenInput);
            }
            hiddenInput.value = selectedValue;
        });

        let map, startMarker, endMarker, routingControl, activeInput;

        map = L.map('map').setView([-6.7924, 39.2083], 6);
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '© OpenStreetMap contributors'
        }).addTo(map);

        function createMarkerIcon(color) {
            return L.divIcon({
                className: 'custom-icon',
                html: `<div style="background-color:${color}; width:24px; height:24px; border-radius:50%; border:3px solid white; box-shadow: 0 0 5px rgba(0,0,0,0.3);"></div>`,
                iconSize: [30, 30]
            });
        }

        function updateMarker(marker, latlng, inputId) {
            if (marker) {
                marker.setLatLng(latlng);
            } else {
                const color = inputId === 'start' ? '#10B981' : '#EF4444';
                marker = L.marker(latlng, {
                    icon: createMarkerIcon(color),
                    draggable: true
                }).addTo(map).on('dragend', function () {
                    const position = marker.getLatLng();
                    document.getElementById(inputId).value = `${position.lat.toFixed(6)}, ${position.lng.toFixed(6)}`;
                    if ((inputId === 'start' && endMarker) || (inputId === 'end' && startMarker)) {
                        calculateDistance();
                    }
                });
                if (inputId === 'start') startMarker = marker;
                else endMarker = marker;
            }
            return marker;
        }

        function haversineKm(lat1, lon1, lat2, lon2) {
            var R = 6371, dLat = (lat2 - lat1) * Math.PI / 180, dLon = (lon2 - lon1) * Math.PI / 180;
            var a = Math.sin(dLat/2)*Math.sin(dLat/2) + Math.cos(lat1*Math.PI/180)*Math.cos(lat2*Math.PI/180)*Math.sin(dLon/2)*Math.sin(dLon/2);
            return R * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
        }

        function setDistanceResult(calculatedDistanceKm, durationSec, startLatLng, endLatLng, isFallback) {
            const resultDiv = document.getElementById('result');
            const resultContent = document.getElementById('result-content');
            if (resultDiv) resultDiv.classList.remove('hidden');
            if (resultContent) {
                var durationStr = durationSec != null ? Math.floor(durationSec/60) + ' min ' + (durationSec%60) + ' sec' : '–';
                resultContent.innerHTML = (isFallback ? '<p class="text-amber-700 text-sm mb-2">Route service unavailable; showing straight-line distance.</p>' : '') +
                    '<div class="grid grid-cols-2 gap-2"><div><span class="font-medium">{{ __('all.distance_label') }}</span> ' + calculatedDistanceKm + ' km</div><div><span class="font-medium">{{ __('all.duration_label') }}</span> ' + durationStr + '</div></div>';
            }
            var rd = document.getElementById('routeDistance'), rdd = document.getElementById('routeDistanceDisplay');
            if (rd) rd.value = calculatedDistanceKm;
            if (rdd) rdd.value = calculatedDistanceKm;
        }

        function calculateDistance() {
            if (!startMarker || !endMarker) return;
            const startLatLng = startMarker.getLatLng();
            const endLatLng = endMarker.getLatLng();

            if (routingControl) { map.removeControl(routingControl); routingControl = null; }

            routingControl = L.Routing.control({
                waypoints: [L.latLng(startLatLng.lat, startLatLng.lng), L.latLng(endLatLng.lat, endLatLng.lng)],
                routeWhileDragging: true,
                showAlternatives: false,
                addWaypoints: false,
                draggableWaypoints: false,
                fitSelectedRoutes: true,
                lineOptions: { styles: [{ color: '#2E3093', opacity: 0.8, weight: 6 }] },
                createMarker: function () { return null; }
            }).addTo(map);

            routingControl.on('routesfound', function (e) {
                const routes = e.routes;
                const distance = routes[0].summary.totalDistance;
                const duration = routes[0].summary.totalTime;
                setDistanceResult((distance/1000).toFixed(2), duration, startLatLng, endLatLng, false);
            });

            routingControl.on('routingerror', function () {
                map.removeControl(routingControl);
                routingControl = null;
                var fallbackKm = haversineKm(startLatLng.lat, startLatLng.lng, endLatLng.lat, endLatLng.lng).toFixed(2);
                setDistanceResult(fallbackKm, null, startLatLng, endLatLng, true);
            });

            map.fitBounds(L.latLngBounds(startLatLng, endLatLng));
        }

        function geocodePlace(place, inputId, retryCount) {
            retryCount = retryCount || 0;
            if (!place) return Promise.resolve();
            const input = document.getElementById(inputId);
            input.classList.add('bg-blue-50');
            return fetch('https://nominatim.openstreetmap.org/search?format=json&q=' + encodeURIComponent(place) + '&limit=1', {
                headers: { 'Accept': 'application/json', 'User-Agent': 'HighlinkBooking/1.0' }
            })
                .then(response => response.json())
                .then(data => {
                    if (data && data.length > 0) {
                        const lat = parseFloat(data[0].lat);
                        const lon = parseFloat(data[0].lon);
                        const latlng = L.latLng(lat, lon);
                        document.getElementById(inputId).value = `${lat.toFixed(6)}, ${lon.toFixed(6)}`;
                        if (inputId === 'start') startMarker = updateMarker(startMarker, latlng, 'start');
                        else endMarker = updateMarker(endMarker, latlng, 'end');
                        if (startMarker && endMarker) calculateDistance();
                        else map.setView(latlng, 12);
                    } else {
                        showAlert(@json(__('all.error_no_results_found')) + ' "' + place + '"', 'error');
                        document.getElementById(inputId).value = '';
                    }
                })
                .catch(function () {
                    if (retryCount < 1) {
                        return new Promise(r => setTimeout(r, 1100)).then(() => geocodePlace(place, inputId, 1));
                    }
                    showAlert(@json(__('all.error_geocoding_place_name_try_again')), 'error');
                    document.getElementById(inputId).value = '';
                })
                .finally(function () { input.classList.remove('bg-blue-50'); });
        }

        function showAlert(message, type) {
            const alertDiv = document.createElement('div');
            alertDiv.className = 'fixed top-20 right-4 p-4 rounded-lg shadow-lg text-white z-50 ' + (type === 'error' ? 'bg-red-500' : 'bg-[var(--home-primary)]');
            alertDiv.innerHTML = '<div class="flex items-center gap-2"><i class="fas ' + (type === 'error' ? 'fa-exclamation-circle' : 'fa-info-circle') + '"></i><span>' + message + '</span></div>';
            document.body.appendChild(alertDiv);
            setTimeout(function () {
                alertDiv.remove();
            }, 3000);
        }

        function handleInputChange(inputId) {
            const input = document.getElementById(inputId);
            input.addEventListener('change', function () {
                const value = this.value.trim();
                if (!value.match(/^-?\d+\.\d+,\s*-?\d+\.\d+$/)) geocodePlace(value, inputId);
            });
            input.addEventListener('keypress', function (e) {
                if (e.key === 'Enter') {
                    const value = this.value.trim();
                    if (!value.match(/^-?\d+\.\d+,\s*-?\d+\.\d+$/)) geocodePlace(value, inputId);
                }
            });
        }

        document.getElementById('start').addEventListener('focus', function () {
            activeInput = 'start';
        });
        document.getElementById('end').addEventListener('focus', function () {
            activeInput = 'end';
        });

        map.on('click', function (e) {
            if (!activeInput) return;
            const latlng = e.latlng;
            document.getElementById(activeInput).value = `${latlng.lat.toFixed(6)}, ${latlng.lng.toFixed(6)}`;
            if (activeInput === 'start') startMarker = updateMarker(startMarker, latlng, 'start');
            else endMarker = updateMarker(endMarker, latlng, 'end');
            if (startMarker && endMarker) calculateDistance();
        });

        document.getElementById('calculate').addEventListener('click', function () {
            const startValue = document.getElementById('start').value.trim();
            const endValue = document.getElementById('end').value.trim();
            const coordRegex = /^-?\d+\.\d+,\s*-?\d+\.\d+$/;

            function setStart() {
                if (!startValue) return Promise.resolve();
                if (startValue.match(coordRegex)) {
                    const parts = startValue.split(',').map(c => parseFloat(c.trim()));
                    startMarker = updateMarker(startMarker, L.latLng(parts[0], parts[1]), 'start');
                    return Promise.resolve();
                }
                return geocodePlace(startValue, 'start');
            }
            function setEnd() {
                if (!endValue) return Promise.resolve();
                if (endValue.match(coordRegex)) {
                    const parts = endValue.split(',').map(c => parseFloat(c.trim()));
                    endMarker = updateMarker(endMarker, L.latLng(parts[0], parts[1]), 'end');
                    return Promise.resolve();
                }
                return geocodePlace(endValue, 'end');
            }

            setStart().then(function () { return new Promise(r => setTimeout(r, 1100)); }).then(setEnd).then(function () {
                if (startMarker && endMarker) {
                    map.invalidateSize();
                    setTimeout(calculateDistance, 200);
                }
            });
        });

        document.getElementById('clear').addEventListener('click', function () {
            if (startMarker) { map.removeLayer(startMarker); startMarker = null; }
            if (endMarker) { map.removeLayer(endMarker); endMarker = null; }
            if (routingControl) { map.removeControl(routingControl); routingControl = null; }
            document.getElementById('start').value = '';
            document.getElementById('end').value = '';
            document.getElementById('result').classList.add('hidden');
            activeInput = null;
            document.getElementById('routeDistance').value = '';
            document.getElementById('routeDistanceDisplay').value = '';
        });

        document.querySelectorAll('[data-point]').forEach(function (btn) {
            btn.addEventListener('click', function () {
                if (!activeInput) {
                    showAlert('Please click on either Pickup or Dropping input field first', 'error');
                    return;
                }
                geocodePlace(this.getAttribute('data-point'), activeInput);
            });
        });

        document.getElementById('pickupPoint').addEventListener('change', function () {
            if (this.value) {
                document.getElementById('start').value = this.value;
                geocodePlace(this.value, 'start');
            }
        });

        document.getElementById('dropoffPoint').addEventListener('change', function () {
            if (this.value) {
                document.getElementById('end').value = this.value;
                geocodePlace(this.value, 'end');
            }
        });

        handleInputChange('start');
        handleInputChange('end');

        window.addEventListener('load', function () {
            setTimeout(function () { map.invalidateSize(); }, 300);
            const fromValue = @json($car->schedule->from);
            const toValue = @json($car->schedule->to);
            if (fromValue) {
                document.getElementById('start').value = fromValue;
                geocodePlace(fromValue, 'start');
            }
            if (toValue) {
                setTimeout(function () {
                    document.getElementById('end').value = toValue;
                    geocodePlace(toValue, 'end');
                }, 1200);
            }
        });
    </script>
@endpush
