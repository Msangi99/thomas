<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('special_hire_withdrawal_requests', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->decimal('amount', 14, 2);
            $table->string('payment_method', 100);
            $table->string('payment_number', 255);
            $table->text('notes')->nullable();
            $table->string('status', 32)->default('pending'); // pending, approved, rejected, paid
            $table->text('admin_note')->nullable();
            $table->timestamp('processed_at')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('special_hire_withdrawal_requests');
    }
};
