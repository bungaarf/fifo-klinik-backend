<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::table('pendaftaran_pasiens', function (Blueprint $table) {
            $table->enum('tipe_pendaftaran', ['BPJS', 'Umum'])->after('poli');
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
