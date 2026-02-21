<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('parcels', function (Blueprint $table) {
            $table->decimal('weight', 8, 2)->nullable()->after('amount_paid');
            $table->decimal('height', 8, 2)->nullable()->after('weight');
            $table->decimal('width', 8, 2)->nullable()->after('height');
            $table->string('status')->default('pending')->after('width');
        });

        Schema::table('buses', function (Blueprint $table) {
            $table->boolean('accept_parcels')->default(true)->after('total_seats');
        });

        Schema::table('campanies', function (Blueprint $table) {
            $table->decimal('commission_amount', 10, 2)->default(0)->after('percentage');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('parcels', function (Blueprint $table) {
            $table->dropColumn(['weight', 'height', 'width', 'status']);
        });

        Schema::table('buses', function (Blueprint $table) {
            $table->dropColumn('accept_parcels');
        });

        Schema::table('campanies', function (Blueprint $table) {
            $table->dropColumn('commission_amount');
        });
    }
};