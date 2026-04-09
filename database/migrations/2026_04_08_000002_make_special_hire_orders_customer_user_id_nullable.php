<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Walk-in / admin-created orders have no linked customer user; column must allow NULL.
     */
    public function up(): void
    {
        if (Schema::getConnection()->getDriverName() !== 'mysql') {
            return;
        }

        try {
            Schema::table('special_hire_orders', function (Blueprint $table) {
                $table->dropForeign(['customer_user_id']);
            });
        } catch (\Throwable $e) {
            // Foreign key name may differ or already removed
        }

        DB::statement('ALTER TABLE special_hire_orders MODIFY customer_user_id BIGINT UNSIGNED NULL');

        Schema::table('special_hire_orders', function (Blueprint $table) {
            $table->foreign('customer_user_id')
                ->references('id')
                ->on('users')
                ->nullOnDelete();
        });
    }

    public function down(): void
    {
        // Intentionally empty: forcing NOT NULL again fails if any row has NULL customer_user_id.
    }
};
