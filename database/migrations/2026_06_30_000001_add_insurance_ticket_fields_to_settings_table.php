<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('settings', function (Blueprint $table) {
            if (!Schema::hasColumn('settings', 'insurance_company')) {
                $table->string('insurance_company', 255)->nullable()->after('local');
            }
            if (!Schema::hasColumn('settings', 'insurance_policy_local')) {
                $table->string('insurance_policy_local', 255)->nullable()->after('insurance_company');
            }
            if (!Schema::hasColumn('settings', 'insurance_policy_foreign')) {
                $table->string('insurance_policy_foreign', 255)->nullable()->after('insurance_policy_local');
            }
        });
    }

    public function down(): void
    {
        Schema::table('settings', function (Blueprint $table) {
            $columns = ['insurance_company', 'insurance_policy_local', 'insurance_policy_foreign'];
            foreach ($columns as $column) {
                if (Schema::hasColumn('settings', $column)) {
                    $table->dropColumn($column);
                }
            }
        });
    }
};
