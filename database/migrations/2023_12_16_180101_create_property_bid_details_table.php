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
        Schema::create('property_bid_details', function (Blueprint $table) {
            $table->id();
            $table->string('name', 50);
            $table->string('email', 100);
            $table->string('phone', 20);
            $table->string('amount', 20);
            $table->unsignedBigInteger('project_id')->default(0);
            $table->unsignedBigInteger('property_id')->default(0);
            $table->string('ip_address', 50)->default(0);
            $table->text('content');
            $table->string('status', 20)->default('unread');
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
        Schema::dropIfExists('property_bid_details');
    }
};
