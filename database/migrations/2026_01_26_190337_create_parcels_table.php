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
        Schema::create('parcels', function (Blueprint $table) {
            $table->id();
            $table->string('parcel_number')->unique();
            $table->string('parcel_type');
            $table->text('description')->nullable();
            $table->decimal('amount_paid', 10, 2);
            $table->unsignedBigInteger('bus_id');
            $table->unsignedBigInteger('vender_id');
            $table->timestamps();

            $table->foreign('bus_id')->references('id')->on('buses')->onDelete('cascade');
            $table->foreign('vender_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('parcels');
    }
};
