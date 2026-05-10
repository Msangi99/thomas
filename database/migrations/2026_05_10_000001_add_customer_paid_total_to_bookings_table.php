<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Total amount charged to the customer at payment time (before settlement overwrites `amount` with bus-owner share).
     */
    public function up(): void
    {
        if (!Schema::hasColumn('bookings', 'customer_paid_total')) {
            Schema::table('bookings', function (Blueprint $table) {
                $table->decimal('customer_paid_total', 15, 2)->nullable()->after('amount');
            });
        }
    }

    public function down(): void
    {
        if (Schema::hasColumn('bookings', 'customer_paid_total')) {
            Schema::table('bookings', function (Blueprint $table) {
                $table->dropColumn('customer_paid_total');
            });
        }
    }
};
