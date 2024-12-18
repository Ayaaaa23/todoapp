<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddDoneColumnToItemsTable extends Migration
{
    public function up()
    {
        Schema::table('items', function (Blueprint $table) {
            $table->boolean('done')->default(false); // Ajoute la colonne 'done'
            $table->timestamp('completed_at')->nullable(); // Ajoute la colonne 'completed_at'
        });
    }

    public function down()
    {
        Schema::table('items', function (Blueprint $table) {
            $table->dropColumn(['done', 'completed_at']); // Supprime les colonnes en cas de rollback
        });
    }
}
