<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dokter extends Model
{
    use HasFactory;

    protected $fillable = [
        'nama',
        'spesialisasi'
    ];

    // Relasi ke jadwal dokter
    public function jadwal()
    {
        return $this->hasMany(JadwalDokter::class);
    }

    // Relasi ke pendaftaran pasien
    public function pendaftarans()
    {
        return $this->hasMany(PendaftaranPasien::class);
    }

    public function user()
{
    return $this->belongsTo(User::class);
}

}
