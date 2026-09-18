<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\DokterController;
use App\Http\Controllers\JadwalDokterController;
use App\Http\Controllers\PendaftaranPasienController;
use App\Http\Controllers\LaporanController;



Route::post('/register', [AuthController::class, 'register']);
Route::post('/register-multi', [AuthController::class, 'registerMultiple']);

Route::post('/login', [AuthController::class, 'login']);
Route::get('/users', [AuthController::class, 'getAllUsers']);


Route::get('/dokters', [DokterController::class, 'index']);
Route::post('/dokters', [DokterController::class, 'store']);
Route::get('/dokters/{id}', [DokterController::class, 'show']);
Route::put('/dokters/{id}', [DokterController::class, 'update']);
Route::delete('/dokters/{id}', [DokterController::class, 'destroy']);
Route::get('/dokter-by-poli/{poli}', [DokterController::class, 'byPoli']);


Route::get('/jadwal-dokter', [JadwalDokterController::class, 'index']);
Route::post('/jadwal-dokter', [JadwalDokterController::class, 'store']);
Route::get('/jadwal-dokter/dokter/{dokter_id}', [JadwalDokterController::class, 'showByDokter']);
Route::put('/jadwal-dokter/{id}', [JadwalDokterController::class, 'update']);
Route::delete('/jadwal-dokter/{id}', [JadwalDokterController::class, 'destroy']);
Route::get('/status-praktik/{dokter_id}', [JadwalDokterController::class, 'statusPraktikHariIni']);


Route::post('/pendaftaran', [PendaftaranPasienController::class, 'store']);
Route::get('/pendaftaran/check-bpjs', [PendaftaranPasienController::class, 'checkBpjs']);
Route::get('/panggil/{poli}', [PendaftaranPasienController::class, 'panggilBerikutnya']);
Route::get('/antrian/{poli}', [PendaftaranPasienController::class, 'lihatAntrian']);
Route::get('/pendaftaran', [PendaftaranPasienController::class, 'index']);
Route::get('/pendaftaran/hari-ini/{dokterId}', [PendaftaranPasienController::class, 'getPendaftaranHariIni']);


// Statistik untuk dashboard dokter
Route::get('/dashboard-stats/{dokterId}', [PendaftaranPasienController::class, 'dashboardStats']);

// Pasien yang sedang dipanggil
Route::get('/pasien-terkini/{dokterId}', [PendaftaranPasienController::class, 'pasienTerkini']);

// Panggil pasien selanjutnya
Route::post('/panggil-pasien/{id}', [PendaftaranPasienController::class, 'panggilPasien']);

// Selesaikan pemeriksaan pasien
Route::post('/selesaikan-pasien/{id}', [PendaftaranPasienController::class, 'selesaikanPasien']);

Route::post('/kembalikan-pasien/{id}', [PendaftaranPasienController::class, 'kembalikanPasien']);

// Riwayat pendaftaran pasien
Route::get('/pendaftaran/riwayat/{dokterId}', [PendaftaranPasienController::class, 'riwayat']);

Route::get('/laporan/harian/{dokterId}', [LaporanController::class, 'harian']);
Route::get('/laporan/bulanan/{dokterId}', [LaporanController::class, 'bulanan']);

Route::get('/jadwal-dan-slot/{poli}', [PendaftaranPasienController::class, 'jadwalDanSlot']);



