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
        Schema::create('advertisement_images', function (Blueprint $table) {
            $table->id();
            $table->foreignId('advertisement_package_id');
            $table->string('slider_image_path')->nullable();
            $table->string('new_project_image_path')->nullable();
            $table->string('new_sale_image_path')->nullable();
            $table->string('secondary_image_path')->nullable();
            $table->string('leasing_image_path')->nullable();
            $table->string('holiday_homes_image_path')->nullable();
            $table->integer('property_id')->unsigned()->default(0);
            $table->integer('user_id')->unsigned()->default(0);
            $table->string('status', 60)->default('pending');
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
        Schema::dropIfExists('advertisement_images');
    }
};
