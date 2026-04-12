@extends('special_hire.app')

@section('title', 'Create driver')
@section('page_title', 'Create driver')
@section('page_subtitle', 'Link a new driver account to one of your buses')

@section('content')
<div class="max-w-xl mx-auto">
    <div class="bg-white rounded-2xl shadow-lg border border-gray-100 p-6">
        <p class="text-sm text-gray-600 mb-6">Choose the coaster first, then set login details for the driver app.</p>

        <form method="POST" action="{{ route('special_hire.drivers.store') }}" class="space-y-5">
            @csrf

            <div>
                <label for="coaster_id" class="block text-sm font-medium text-gray-700 mb-1">Bus (coaster)</label>
                <select name="coaster_id" id="coaster_id" required
                    class="w-full rounded-xl border-gray-300 shadow-sm focus:ring-teal-500 focus:border-teal-500">
                    <option value="">— Select —</option>
                    @foreach($coasters as $c)
                        <option value="{{ $c->id }}" {{ (string) old('coaster_id') === (string) $c->id ? 'selected' : '' }}
                            @if($c->driver_user_id) disabled @endif>
                            {{ $c->name }} @if($c->plate_number)({{ $c->plate_number }})@endif
                            @if($c->driver_user_id) — has driver @endif
                        </option>
                    @endforeach
                </select>
                @error('coaster_id')
                    <p class="text-red-600 text-xs mt-1">{{ $message }}</p>
                @enderror
            </div>

            <div>
                <label for="name" class="block text-sm font-medium text-gray-700 mb-1">Driver name</label>
                <input type="text" name="name" id="name" value="{{ old('name') }}" required
                    class="w-full rounded-xl border-gray-300 shadow-sm focus:ring-teal-500 focus:border-teal-500">
                @error('name')<p class="text-red-600 text-xs mt-1">{{ $message }}</p>@enderror
            </div>

            <div>
                <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email (login)</label>
                <input type="email" name="email" id="email" value="{{ old('email') }}" required
                    class="w-full rounded-xl border-gray-300 shadow-sm focus:ring-teal-500 focus:border-teal-500">
                @error('email')<p class="text-red-600 text-xs mt-1">{{ $message }}</p>@enderror
            </div>

            <div>
                <label for="phone" class="block text-sm font-medium text-gray-700 mb-1">Phone</label>
                <input type="text" name="phone" id="phone" value="{{ old('phone') }}" required
                    class="w-full rounded-xl border-gray-300 shadow-sm focus:ring-teal-500 focus:border-teal-500">
                @error('phone')<p class="text-red-600 text-xs mt-1">{{ $message }}</p>@enderror
            </div>

            <div>
                <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                <input type="password" name="password" id="password" required minlength="6"
                    class="w-full rounded-xl border-gray-300 shadow-sm focus:ring-teal-500 focus:border-teal-500">
                @error('password')<p class="text-red-600 text-xs mt-1">{{ $message }}</p>@enderror
            </div>

            <div class="flex gap-3 pt-2">
                <button type="submit" class="btn-primary flex-1 py-3 rounded-xl text-white font-semibold text-sm">
                    Create &amp; assign
                </button>
                <a href="{{ route('special_hire.coasters') }}" class="px-4 py-3 rounded-xl border border-gray-300 text-gray-700 text-sm font-medium hover:bg-gray-50">
                    Cancel
                </a>
            </div>
        </form>
    </div>
</div>
@endsection
