<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ItemController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\TaskController;

Route::post('/register', [UserController::class, 'register']);
Route::post('/forgot-password', [AuthController::class, 'forgotPassword']);
Route::post('/login', [AuthController::class, 'login']); 
Route::middleware('auth:sanctum')->post('/logout', [AuthController::class, 'logout']);
Route::middleware('auth:sanctum')->get('/user', [UserController::class, 'getUserInfo']);
Route::apiResource('tasks', TaskController::class);
Route::get('/items', [ItemController::class, 'index']);
Route::prefix('/item')->group(function() {
    Route::post('/store', [ItemController::class, 'store']);
    Route::put('/{id}', [ItemController::class, 'update']);
    Route::delete('/{id}', [ItemController::class, 'destroy']);
});
