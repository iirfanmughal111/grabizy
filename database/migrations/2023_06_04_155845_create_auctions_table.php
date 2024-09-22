<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAuctionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('auctions', function (Blueprint $table) {
            $table->id();
            $table->integer('product_id')->default(0);
            $table->integer('bid_price')->default(0);
            $table->integer('start_dateTime')->default(0);
            $table->integer('end_dateTime')->default(0);
            $table->integer('min_increament')->default(0);
            $table->integer('is_active')->default(0);
            $table->integer('bid_count')->default(0);

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
        Schema::dropIfExists('auctions');
    }
}
