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
        Schema::table('pendaftaran_pasiens', function (Blueprint $table) {
        $table->date('tanggal_janji')->nullable()->after('waktu_daftar');
    });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('pendaftaran_pasiens', function (Blueprint $table) {
            //
        });
    }
};
