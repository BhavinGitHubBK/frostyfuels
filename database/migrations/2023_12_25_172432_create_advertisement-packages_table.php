<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('advertisement_packages', function (Blueprint $table) {
            $table->id();
            $table->string('name', 50);
            $table->string('advertisement_package_code', 50);
            $table->double('price', 15, 2)->unsigned()->default(0.00);
            $table->foreignId('currency_id')->unsigned()->default(0);;
            $table->tinyInteger('order')->default(0);
            $table->integer('account_limit')->unsigned()->nullable();
            $table->tinyInteger('is_default')->unsigned()->default(0);
            $table->integer('percent_save')->unsigned()->default(0);
            $table->integer('number_of_listings')->unsigned()->default(0);
            $table->string('status', 60)->default('published');
            $table->integer('number_of_days')->unsigned()->default(0);
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
        Schema::dropIfExists('advertisement_packages');
    }
};
