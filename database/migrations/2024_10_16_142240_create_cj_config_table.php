<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCjConfigTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cj_config', function (Blueprint $table) {
            $table->id();
            $table->string('email')->nullable();
            $table->string('password')->nullable();
            $table->string('api')->nullable();
            $table->text('token')->nullable();
            $table->string('token_expiry')->nullable();
            $table->text('refreshToken')->nullable();
            $table->string('refreshToken_expiry')->nullable();
            $table->string('base_url')->nullable();
            $table->string('exchangerate_url')->nullable();
            $table->string('exchangerate_api')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cj_config');
    }
}
