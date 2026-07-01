<form action="{{ route('booking_info') }}" method="post" class="flex flex-col sm:flex-row gap-3 items-stretch sm:items-end">
    @csrf
    <div class="flex-1">
        <label for="bookingSearch" class="block text-sm font-semibold text-gray-700 mb-1.5">
            {{ __('all.email_or_phone_number') }}
        </label>
        <input
            id="bookingSearch"
            type="text"
            name="data"
            class="page-input @error('data') border-red-400 @enderror"
            placeholder="{{ __('all.enter_email_phone_number') }}"
            value="{{ old('data', $searchQuery ?? '') }}"
            required
            autocomplete="email tel"
        >
        @error('data')
            <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
        @enderror
        <p class="mt-1.5 text-xs text-gray-500">{{ __('all.booking_lookup_hint') }}</p>
    </div>
    <button type="submit" class="page-btn sm:shrink-0">
        <i class="fas fa-search" aria-hidden="true"></i> {{ __('all.search_button') }}
    </button>
</form>
