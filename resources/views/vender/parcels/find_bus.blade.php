@extends('vender.app')

@section('title', 'Find Bus for Parcel')

@section('content')
<div class="vendor-dash fade-in">
    <header class="vendor-dash__header">
        <div class="vendor-dash__welcome">
            <p class="vendor-dash__eyebrow">{{ __('all.highlink_isgc') }}</p>
            <h1 class="vendor-dash__title">Assign parcel to bus</h1>
            <p class="vendor-dash__subtitle">Search by bus number or company name</p>
        </div>
        <div class="vendor-dash__actions">
            <a href="{{ route('vender.parcels.index') }}" class="page-btn page-btn--outline">
                <i class="fas fa-arrow-left"></i> {{ __('all.parcels') }}
            </a>
        </div>
    </header>

    <section class="vendor-table-card">
        <div class="vendor-table-card__head">
            <div class="vendor-table-card__title-wrap">
                <h3>Find bus</h3>
                <p>{{ $buses->count() }} {{ $buses->count() === 1 ? 'bus' : 'buses' }} found</p>
            </div>
        </div>

        <div class="vendor-table-toolbar">
            <form action="{{ route('vender.parcels.find_bus') }}" method="GET" class="flex flex-1 flex-wrap items-center gap-2 w-full">
                <div class="vendor-search-wrap flex-1 min-w-[14rem]">
                    <i class="fas fa-search"></i>
                    <input type="text" name="query" value="{{ request('query') }}" class="page-input text-sm border-0 shadow-none bg-transparent w-full" placeholder="Bus number or company name…">
                </div>
                <button type="submit" class="page-btn">Search</button>
            </form>
        </div>

        @if($buses->isEmpty())
            <div class="vendor-table-empty">
                <i class="fas fa-bus"></i>
                <h4>No buses found</h4>
                <p>Try a different bus number or company name.</p>
            </div>
        @else
            <div class="vendor-parcel-grid">
                @foreach ($buses as $bus)
                    <article class="vendor-parcel-bus-card">
                        <div class="vendor-parcel-bus-card__head">
                            <div>
                                <h3 class="vendor-parcel-bus-card__title">{{ $bus->bus_number }}</h3>
                                <p class="vendor-parcel-bus-card__company">{{ $bus->campany->name }}</p>
                            </div>
                            <span class="vendor-status vendor-status--other">{{ $bus->bus_type ?: 'Standard' }}</span>
                        </div>

                        <div class="vendor-parcel-bus-card__meta">
                            @if($bus->route)
                                <span><i class="fas fa-route"></i> {{ $bus->route->from }} → {{ $bus->route->to }}</span>
                            @endif
                            @if($bus->schedule)
                                <span>
                                    <i class="fas fa-clock"></i>
                                    {{ \Carbon\Carbon::parse($bus->schedule->schedule_date)->format('d M Y') }}
                                    · {{ $bus->schedule->start }}
                                </span>
                            @endif
                        </div>

                        <a href="{{ route('vender.parcels.create', $bus->id) }}" class="page-btn page-btn--outline w-full text-center">
                            Select this bus <i class="fas fa-arrow-right"></i>
                        </a>
                    </article>
                @endforeach
            </div>
        @endif
    </section>
</div>
@endsection
