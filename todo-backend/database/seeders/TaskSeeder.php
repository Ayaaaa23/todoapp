<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Task;

class TaskSeeder extends Seeder
{
    public function run()
    {
        Task::create([
            'title' => 'Example Task',
            'description' => 'This is an example task.',
            'completed' => false,
        ]);
    }
}
