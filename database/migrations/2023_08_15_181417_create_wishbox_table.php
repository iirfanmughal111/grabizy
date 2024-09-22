<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWishboxTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('wishbox', function (Blueprint $table) {
            $table->id();
            $table->string('wish_title')->nullable();
            $table->string('wish_description')->nullable();
            $table->binary('wish_gallery')->nullable();
            $table->integer('user_id')->nullable();
            $table->integer('is_complete')->default(0);
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
        Schema::dropIfExists('wishbox');
    }
}
