<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public function getUserInfo() 
    { 
        if (Auth::check()) { 
            return response()->json([ 
                'name' => Auth::user()->name, 
            ]); 
        } else { 
            return response()->json([ 
                'error' => 'Unauthorized', 
            ], 401); 
        } 
    }

    public function register(Request $request)
    {
        // Validation des données de la requête
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        // Création de l'utilisateur
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        return response()->json(['message' => 'User registered successfully', 'user' => $user], 201);
    }
}
