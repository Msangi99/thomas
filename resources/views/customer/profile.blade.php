@extends('customer.app')

@section('title', __('customer_sidebar.Profile'))

@section('page_hero')
    @include('test.partials.page_hero', [
        'eyebrow' => __('all.highlink_isgc'),
        'title' => __('customer_sidebar.Profile'),
        'subtitle' => __('all.profile_information'),
    ])
@endsection

@section('content')
<section class="page-section page-section--alt">
    <div class="container mx-auto px-4 max-w-2xl">
        <div class="customer-panel fade-in">
            <div class="customer-panel__header">
                <h3 class="text-lg flex items-center gap-2">
                    <i class="fas fa-user"></i>
                    {{ __('customer/profile.update_profile') }}
                </h3>
            </div>

            <div class="customer-panel__body">
                <form action="{{ route('customer.profile.update') }}" method="POST" class="space-y-5">
                    @csrf

                    <div>
                        <label for="name" class="block text-sm font-semibold text-gray-700 mb-1 uppercase tracking-wide">
                            {{ __('customer/profile.name') }}
                        </label>
                        <input type="text" id="name" name="name" value="{{ old('name', auth()->user()->name) }}"
                               class="page-input" required>
                        @error('name')
                            <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                        @enderror
                    </div>

                    <div>
                        <label for="email" class="block text-sm font-semibold text-gray-700 mb-1 uppercase tracking-wide">
                            {{ __('customer/profile.email') }}
                        </label>
                        <input type="email" id="email" name="email" value="{{ old('email', auth()->user()->email) }}"
                               class="page-input" required>
                        @error('email')
                            <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                        @enderror
                    </div>

                    <div>
                        <label for="contact" class="block text-sm font-semibold text-gray-700 mb-1 uppercase tracking-wide">
                            {{ __('customer/profile.contact') }}
                        </label>
                        <input type="text" id="contact" name="contact" value="{{ old('contact', auth()->user()->contact ?? '') }}"
                               class="page-input">
                        @error('contact')
                            <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                        @enderror
                    </div>

                    <div>
                        <label for="password" class="block text-sm font-semibold text-gray-700 mb-1 uppercase tracking-wide">
                            {{ __('customer/profile.password') }}
                        </label>
                        <input type="password" id="password" name="password" class="page-input">
                        @error('password')
                            <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                        @enderror
                    </div>

                    <div class="pt-2">
                        <button type="submit" class="page-btn w-full">
                            <i class="fas fa-save"></i>
                            {{ __('customer/profile.update_profile_button') }}
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
@endsection
