<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasColumn('bookings', 'government_levy')) {
            Schema::table('bookings', function (Blueprint $table) {
                $table->decimal('government_levy', 10, 2)->default(0)->after('vat');
            });
        }
    }

    public function down(): void
    {
        Schema::table('bookings', function (Blueprint $table) {
            $table->dropColumn('government_levy');
        });
    }
};
