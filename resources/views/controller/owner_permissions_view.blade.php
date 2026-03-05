@extends('layouts.admin')

@section('title', __('local_bus_owners.view_local_bus_owner_permissions'))

@section('content')
<div class="container mx-auto px-4 py-6">
    <h2 class="text-2xl font-semibold text-gray-800 mb-6">{{ __('local_bus_owners.view_local_bus_owner_permissions') }}</h2>

    <div class="bg-white shadow-md rounded-lg p-6">
        <p class="text-gray-600">{{ __('local_bus_owners.this_page_will_display_permissions') }}</p>
        <p class="text-gray-600 mt-2">{{ __('local_bus_owners.you_can_list_all_local_bus_owners') }}</p>
        <!-- Future implementation: Table or list of local bus owners and their permissions -->
    </div>
</div>
@endsection
