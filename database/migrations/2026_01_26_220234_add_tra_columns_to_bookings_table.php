<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('bookings', function (Blueprint $table) {
            $table->string('tra_status')->nullable()->default('pending');
            $table->string('tra_rct_num')->nullable();
            $table->string('tra_z_num')->nullable();
            $table->string('tra_vnum')->nullable();
            $table->text('tra_qr_url')->nullable(); // Text because URLs can be long
            $table->text('tra_response')->nullable();
            $table->text('tra_error')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('bookings', function (Blueprint $table) {
            $table->dropColumn([
                'tra_status', 'tra_rct_num', 'tra_z_num', 
                'tra_vnum', 'tra_qr_url', 'tra_response', 'tra_error'
            ]);
        });
    }
};
