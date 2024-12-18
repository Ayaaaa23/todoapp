<?php
namespace App\Http\Controllers;

use App\Models\Task;
use Illuminate\Http\Request;

class TaskController extends Controller
{
    public function index()
    {
        return Task::all();
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'color' => 'nullable|string',
            'priority' => 'nullable|string',
        ]);

        return Task::create($request->all());
    }

    public function show($id)
    {
        return Task::find($id);
    }

    public function update(Request $request, $id)
    {
        $task = Task::find($id);

        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'color' => 'nullable|string',
            'priority' => 'nullable|string',
            'done' => 'boolean',
        ]);

        $task->update($request->all());

        return $task;
    }

    public function destroy($id)
    {
        return Task::destroy($id);
    }
}
