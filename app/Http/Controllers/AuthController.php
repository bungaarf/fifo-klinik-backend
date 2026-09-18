<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class AuthController extends Controller
{
    // API Register
    public function register(Request $request)
    {
        $validated = $request->validate([
            'nama' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6',
            'jenis_kelamin' => 'required|in:Laki-laki,Perempuan',
            'tempat_lahir' => 'required',
            'tanggal_lahir' => 'required|date',
            'alamat' => 'required',
            'nik' => 'required|unique:users',
            'no_telp' => 'required',
        ]);

        $user = User::create([
            ...$validated,
            'password' => Hash::make($request->password),
        ]);

        Auth::login($user); // login menggunakan session

        return response()->json([
            'message' => 'Registrasi berhasil',
            'user' => $user
        ], 201);
    }

    // API Login
    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        if (!Auth::attempt($credentials)) {
            return response()->json(['message' => 'Email atau password salah'], 401);
        }

        $user = Auth::user();
        $dokter = $user->dokter;

        return response()->json([
            'message' => 'Login berhasil',
            'user' => $user,
            'dokter_id' => $dokter ? $dokter->id : null
        ]);
    }


    // API Logout
    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return response()->json(['message' => 'Logout berhasil']);
    }

    // API Get All Users
    public function getAllUsers()
    {
        $users = User::all();

        return response()->json([
            'message' => 'Data user berhasil diambil',
            'data' => $users
        ]);
    }

    public function registerMultiple(Request $request)
{
    $request->validate([
        '*.nama' => 'required',
        '*.email' => 'required|email|unique:users,email',
        '*.password' => 'required|min:6',
        '*.jenis_kelamin' => 'required|in:Laki-laki,Perempuan',
        '*.tempat_lahir' => 'required',
        '*.tanggal_lahir' => 'required|date',
        '*.alamat' => 'required',
        '*.nik' => 'required|unique:users,nik',
        '*.no_telp' => 'required',
    ]);

    $usersData = [];

    foreach ($request->all() as $user) {
        $usersData[] = [
            'nama' => $user['nama'],
            'email' => $user['email'],
            'password' => Hash::make($user['password']),
            'jenis_kelamin' => $user['jenis_kelamin'],
            'tempat_lahir' => $user['tempat_lahir'],
            'tanggal_lahir' => $user['tanggal_lahir'],
            'alamat' => $user['alamat'],
            'nik' => $user['nik'],
            'no_telp' => $user['no_telp'],
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }

    User::insert($usersData);

    return response()->json([
        'message' => 'Berhasil menambahkan ' . count($usersData) . ' user',
        'total' => count($usersData)
    ], 201);
}

}
