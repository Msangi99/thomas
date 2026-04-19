<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasColumn('bookings', 'system_service_fee')) {
            Schema::table('bookings', function (Blueprint $table) {
                $table->decimal('system_service_fee', 10, 2)->default(0)->after('government_levy');
            });
        }
    }

    public function down(): void
    {
        Schema::table('bookings', function (Blueprint $table) {
            $table->dropColumn('system_service_fee');
        });
    }
};
