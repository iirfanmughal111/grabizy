<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('title')->default('Title not available');
            $table->text('short_description')->nullable();
            $table->text('description')->nullable();
            $table->string('featured_image')->nullable();
            $table->binary('prod_gallery')->nullable();
            $table->binary('tags')->nullable();
            $table->integer('category_id')->nullable();
            $table->integer('sale_price')->nullable();
            $table->integer('regular_price')->nullable();
            $table->integer('shipping_id')->nullable();
            $table->string('sku')->nullable();
            $table->integer('disp_order')->nullable();
            $table->integer('is_visible')->default(0);
            $table->integer('weight')->default(0);
            $table->integer('order_count')->default(0);
            $table->integer('cart_count')->default(0);
            $table->integer('wishList_count')->default(0);

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
        Schema::dropIfExists('products');
    }
}
