<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('settings', function (Blueprint $table) {
            $table->id();
            $table->string('site_title')->nullable();
            $table->string('site_tag_line')->nullable();
            $table->string('site_logo')->nullable();
            $table->text('privacy_policy')->nullable();
            $table->integer('send_mail')->default(0);
            $table->integer('prod_per_page')->default(12);
            $table->integer('items_per_page')->default(10);
            $table->text('about_page')->nullable();
            $table->string('meta_desc')->nullable();

            $table->string('login_page')->nullable();
            $table->string('register_page')->nullable();
            $table->string('twitter_link')->nullable();
            $table->string('instagram_link')->nullable();
            $table->string('facebook_link')->nullable();
            $table->string('whatsapp_link')->nullable();
            $table->string('shop_address')->nullable();
            $table->string('shop_email')->nullable();
            $table->string('shop_contact')->nullable();



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
        Schema::dropIfExists('settings');
    }
}
