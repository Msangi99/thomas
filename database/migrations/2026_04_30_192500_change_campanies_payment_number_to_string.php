<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (Schema::hasTable('campanies') && Schema::hasColumn('campanies', 'payment_number')) {
            DB::statement("ALTER TABLE `campanies` MODIFY `payment_number` VARCHAR(255) NULL");
        }
    }

    public function down(): void
    {
        if (Schema::hasTable('campanies') && Schema::hasColumn('campanies', 'payment_number')) {
            DB::statement("ALTER TABLE `campanies` MODIFY `payment_number` INT(11) NULL");
        }
    }
};
