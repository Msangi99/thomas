<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            if (!Schema::hasColumn('users', 'special_hire_platform_percent')) {
                $table->decimal('special_hire_platform_percent', 5, 2)->default(0);
            }
        });

        Schema::table('vender_balances', function (Blueprint $table) {
            if (!Schema::hasColumn('vender_balances', 'sell_cash_amount')) {
                $table->decimal('sell_cash_amount', 14, 2)->default(0);
            }
        });

        Schema::table('special_hire_orders', function (Blueprint $table) {
            if (!Schema::hasColumn('special_hire_orders', 'deposit_amount')) {
                $table->decimal('deposit_amount', 12, 2)->nullable();
            }
            if (!Schema::hasColumn('special_hire_orders', 'balance_amount')) {
                $table->decimal('balance_amount', 12, 2)->nullable();
            }
            if (!Schema::hasColumn('special_hire_orders', 'deposit_paid_at')) {
                $table->timestamp('deposit_paid_at')->nullable();
            }
            if (!Schema::hasColumn('special_hire_orders', 'balance_paid_at')) {
                $table->timestamp('balance_paid_at')->nullable();
            }
            if (!Schema::hasColumn('special_hire_orders', 'owner_accepted_at')) {
                $table->timestamp('owner_accepted_at')->nullable();
            }
            if (!Schema::hasColumn('special_hire_orders', 'passenger_seats')) {
                $table->json('passenger_seats')->nullable();
            }
            if (!Schema::hasColumn('special_hire_orders', 'clickpesa_deposit_ref')) {
                $table->string('clickpesa_deposit_ref', 64)->nullable();
            }
            if (!Schema::hasColumn('special_hire_orders', 'clickpesa_balance_ref')) {
                $table->string('clickpesa_balance_ref', 64)->nullable();
            }
            if (!Schema::hasColumn('special_hire_orders', 'platform_commission_percent')) {
                $table->decimal('platform_commission_percent', 5, 2)->nullable();
            }
            if (!Schema::hasColumn('special_hire_orders', 'platform_commission_amount')) {
                $table->decimal('platform_commission_amount', 12, 2)->nullable();
            }
        });
    }

    public function down(): void
    {
        Schema::table('special_hire_orders', function (Blueprint $table) {
            $table->dropColumn([
                'deposit_amount',
                'balance_amount',
                'deposit_paid_at',
                'balance_paid_at',
                'owner_accepted_at',
                'passenger_seats',
                'clickpesa_deposit_ref',
                'clickpesa_balance_ref',
                'platform_commission_percent',
                'platform_commission_amount',
            ]);
        });

        Schema::table('vender_balances', function (Blueprint $table) {
            $table->dropColumn('sell_cash_amount');
        });

        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn('special_hire_platform_percent');
        });
    }
};
