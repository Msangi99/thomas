@extends('system.app')

@section('title', 'Command')

@section('content')
<div class="max-w-6xl mx-auto space-y-8">
    <div class="flex flex-col sm:flex-row sm:items-end sm:justify-between gap-4">
        <div>
            <h1 class="text-2xl font-bold text-slate-900 tracking-tight">Artisan command center</h1>
            <p class="text-slate-600 mt-1 text-sm">Run whitelisted <code class="text-xs bg-slate-100 px-1.5 py-0.5 rounded text-indigo-800">php artisan</code> tasks. Destructive commands (rollback, wipe) are not exposed.</p>
        </div>
        <a href="{{ route('system.index') }}" class="inline-flex items-center justify-center text-sm font-medium text-indigo-700 hover:text-indigo-900 border border-indigo-200 rounded-lg px-4 py-2 bg-white shadow-sm hover:bg-indigo-50 transition-colors focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
            &larr; Dashboard
        </a>
    </div>

    @php
        $ok = session('command_ok');
        $err = session('command_err');
    @endphp
    @if($ok)
        <div class="rounded-xl border border-emerald-200 bg-emerald-50/90 p-4 shadow-sm" role="status">
            <p class="text-sm font-semibold text-emerald-900">Completed (exit {{ $ok['exit_code'] }})</p>
            <pre class="mt-2 text-xs text-emerald-950 bg-white/80 border border-emerald-100 rounded-lg p-3 overflow-x-auto whitespace-pre-wrap font-mono">{{ $ok['output'] ?: '—' }}</pre>
        </div>
    @endif
    @if($err)
        <div class="rounded-xl border border-red-200 bg-red-50/90 p-4 shadow-sm" role="alert">
            <p class="text-sm font-semibold text-red-900">Failed (exit {{ $err['exit_code'] }})</p>
            <pre class="mt-2 text-xs text-red-950 bg-white/80 border border-red-100 rounded-lg p-3 overflow-x-auto whitespace-pre-wrap font-mono">{{ $err['output'] ?: '—' }}</pre>
        </div>
    @endif

    <div class="grid gap-6 lg:grid-cols-2">
        <section class="rounded-xl border border-slate-200 bg-white shadow-sm overflow-hidden">
            <div class="px-5 py-4 border-b border-slate-100 bg-slate-50/80">
                <h2 class="text-lg font-semibold text-slate-900">Config &amp; cache</h2>
                <p class="text-xs text-slate-600 mt-0.5">Config, routes, views, application cache, events.</p>
            </div>
            <div class="p-5 grid sm:grid-cols-2 gap-3">
                @foreach ([
                    ['config_cache', 'Config cache', 'config:cache'],
                    ['config_clear', 'Config clear', 'config:clear'],
                    ['route_cache', 'Route cache', 'route:cache'],
                    ['route_clear', 'Route clear', 'route:clear'],
                    ['view_cache', 'View cache', 'view:cache'],
                    ['view_clear', 'View clear', 'view:clear'],
                    ['cache_clear', 'Cache clear', 'cache:clear'],
                    ['event_cache', 'Event cache', 'event:cache'],
                    ['event_clear', 'Event clear', 'event:clear'],
                ] as [$key, $label, $cmd])
                    <form action="{{ route('system.commands.run') }}" method="post" class="contents">
                        @csrf
                        <input type="hidden" name="action" value="{{ $key }}">
                        <button type="submit" class="w-full text-left rounded-lg border border-slate-200 px-3 py-3 hover:border-indigo-300 hover:bg-indigo-50/60 transition-colors focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-1">
                            <span class="block text-sm font-medium text-slate-900">{{ $label }}</span>
                            <span class="block text-xs text-slate-500 mt-0.5 font-mono">{{ $cmd }}</span>
                        </button>
                    </form>
                @endforeach
            </div>
        </section>

        <section class="rounded-xl border border-slate-200 bg-white shadow-sm overflow-hidden">
            <div class="px-5 py-4 border-b border-slate-100 bg-slate-50/80">
                <h2 class="text-lg font-semibold text-slate-900">Optimize</h2>
                <p class="text-xs text-slate-600 mt-0.5">Laravel optimize bundles common caches.</p>
            </div>
            <div class="p-5 grid sm:grid-cols-2 gap-3">
                @foreach ([
                    ['optimize', 'Optimize', 'optimize'],
                    ['optimize_clear', 'Optimize clear', 'optimize:clear'],
                    ['migrate_status', 'Migration status', 'migrate:status'],
                ] as [$key, $label, $cmd])
                    <form action="{{ route('system.commands.run') }}" method="post" class="contents">
                        @csrf
                        <input type="hidden" name="action" value="{{ $key }}">
                        <button type="submit" class="w-full text-left rounded-lg border border-slate-200 px-3 py-3 hover:border-indigo-300 hover:bg-indigo-50/60 transition-colors focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-1">
                            <span class="block text-sm font-medium text-slate-900">{{ $label }}</span>
                            <span class="block text-xs text-slate-500 mt-0.5 font-mono">{{ $cmd }}</span>
                        </button>
                    </form>
                @endforeach
            </div>
            <div class="px-5 pb-5">
                <form action="{{ route('system.commands.run') }}" method="post" class="flex flex-wrap items-center gap-3">
                    @csrf
                    <input type="hidden" name="action" value="migrate_all">
                    <button type="submit" class="inline-flex items-center px-4 py-2.5 rounded-lg bg-indigo-600 text-white text-sm font-medium shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
                        Run all pending migrations
                    </button>
                    <span class="text-xs text-slate-500">Equivalent to <code class="bg-slate-100 px-1 rounded">migrate --force</code></span>
                </form>
            </div>
        </section>
    </div>

    <section class="rounded-xl border border-slate-200 bg-white shadow-sm overflow-hidden">
        <div class="px-5 py-4 border-b border-slate-100 bg-slate-50/80 flex flex-col sm:flex-row sm:items-center sm:justify-between gap-2">
            <div>
                <h2 class="text-lg font-semibold text-slate-900">Migrations</h2>
                <p class="text-xs text-slate-600 mt-0.5">Status from the last page load; refresh after runs. Run a single file with <code class="bg-slate-100 px-1 rounded">--path</code>.</p>
            </div>
        </div>
        <div class="p-5 space-y-4">
            <div>
                <h3 class="text-xs font-semibold uppercase tracking-wide text-slate-500 mb-2">migrate:status</h3>
                @if($migrateStatusExit !== 0)
                    <p class="text-sm text-amber-800 mb-2">Status command returned exit code {{ $migrateStatusExit }} (database may be unreachable).</p>
                @endif
                <pre class="text-xs bg-slate-900 text-slate-100 rounded-lg p-4 overflow-x-auto max-h-56 overflow-y-auto font-mono whitespace-pre-wrap">{{ $migrateStatusOutput ?: '—' }}</pre>
            </div>
            <div>
                <h3 class="text-xs font-semibold uppercase tracking-wide text-slate-500 mb-2">Migration files</h3>
                <div class="border border-slate-200 rounded-lg overflow-hidden max-h-96 overflow-y-auto">
                    <table class="min-w-full text-sm">
                        <thead class="bg-slate-100 text-slate-700 sticky top-0">
                            <tr>
                                <th class="text-left font-semibold px-4 py-2">File</th>
                                <th class="text-right font-semibold px-4 py-2 w-40">Action</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100">
                            @forelse($migrationFiles as $file)
                                <tr class="hover:bg-slate-50/80">
                                    <td class="px-4 py-2 font-mono text-xs text-slate-800 break-all">{{ $file }}</td>
                                    <td class="px-4 py-2 text-right">
                                        <form action="{{ route('system.commands.run') }}" method="post" class="inline">
                                            @csrf
                                            <input type="hidden" name="action" value="migrate_file">
                                            <input type="hidden" name="migration" value="{{ $file }}">
                                            <button type="submit" class="text-xs font-medium text-indigo-700 hover:text-indigo-900 px-2 py-1 rounded-md hover:bg-indigo-50 focus:outline-none focus:ring-2 focus:ring-indigo-500">
                                                Migrate
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="2" class="px-4 py-6 text-center text-slate-500">No migration files found.</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
</div>
@endsection
