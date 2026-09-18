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
        $table->text('keluhan')->nullable()->after('poli');
    });
}

public function down()
{
    Schema::table('pendaftaran_pasiens', function (Blueprint $table) {
        $table->dropColumn('keluhan');
    });
}

};
