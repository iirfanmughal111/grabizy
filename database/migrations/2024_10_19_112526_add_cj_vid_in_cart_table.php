<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddCjVidInCartTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('cart', function (Blueprint $table) {
            $table->string('cj_vId', 255)->nullable()->after('id');
            $table->string('cj_vTitle', 255)->nullable()->after('cj_vId');
            $table->string('cj_vImg', 255)->nullable()->after('cj_vTitle');
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('cart', function (Blueprint $table) {
            $table->string('cj_vId');
            $table->string('cj_vTitle');
            $table->string('cj_vImg');
        });
    }
}
