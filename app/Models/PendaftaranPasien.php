<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;


class PendaftaranPasien extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'dokter_id',
        'poli',
        'tipe_pendaftaran', // Tambahkan kolom tipe_pendaftaran
        'keluhan',
        'waktu_daftar',
        'waktu_pemeriksaan', // Tambahkan kolom waktu_pemeriksaan
        'tanggal_janji',
        'nomor_antrian', // ini penting
        'status'
    ];

    // Relasi ke user
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // Relasi ke dokter
    public function dokter()
    {
        return $this->belongsTo(Dokter::class);
    }
}
