<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddApprovalStatusIdColumnToAbsentPermissionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('absent_permissions', function (Blueprint $table) {
            $table->foreignId('approval_status_id')
                ->after('is_approved')
                ->nullable()
                ->references('id')
                ->on('approval_statuses');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('absent_permissions', function (Blueprint $table) {
            $table->removeColumn('approval_status_id');
        });
    }
}
