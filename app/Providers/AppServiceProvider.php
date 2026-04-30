<?php

namespace App\Providers;

use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // Production often misses `php artisan storage:link`; coaster photos are stored under storage/app/public.
        if (PHP_OS_FAMILY !== 'Windows') {
            $target = storage_path('app/public');
            $link = public_path('storage');
            if (! File::isDirectory($target)) {
                try {
                    File::makeDirectory($target, 0755, true);
                } catch (\Throwable $e) {
                    Log::warning('Could not create storage/app/public', ['error' => $e->getMessage()]);
                }
            }
            if (! File::exists($link)) {
                try {
                    symlink($target, $link);
                } catch (\Throwable $e) {
                    Log::warning('Could not create public/storage symlink — run: php artisan storage:link', ['error' => $e->getMessage()]);
                }
            }
        }
    }
}
