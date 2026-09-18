<?php

namespace App\Http\Controllers;

use App\Models\JadwalDokter;
use App\Models\Dokter;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;


class JadwalDokterController extends Controller
{
    // Menampilkan semua jadwal dokter
    public function index()
    {
        return JadwalDokter::with('dokter')->get();
    }

    // Menambahkan jadwal ke dokter
    public function store(Request $request)
    {
        $validated = $request->validate([
            'dokter_id' => 'required|exists:dokters,id',
            'hari' => 'required|in:Senin,Selasa,Rabu,Kamis,Jumat,Sabtu,Minggu',
            'jam_mulai' => 'required|date_format:H:i',
            'jam_selesai' => 'required|date_format:H:i|after:jam_mulai',
        ]);

        $jadwal = JadwalDokter::create($validated);

        return response()->json([
            'message' => 'Jadwal berhasil ditambahkan',
            'jadwal' => $jadwal
        ]);
    }

    // Menampilkan semua jadwal untuk 1 dokter
    public function showByDokter($dokter_id)
    {
        $dokter = Dokter::with('jadwal')->findOrFail($dokter_id);
        return response()->json([
            'dokter' => $dokter->nama,
            'jadwal' => $dokter->jadwal
        ]);
    }

    // Update jadwal tertentu
    public function update(Request $request, $id)
    {
        $jadwal = JadwalDokter::findOrFail($id);

        $validated = $request->validate([
            'hari' => 'sometimes|in:Senin,Selasa,Rabu,Kamis,Jumat,Sabtu,Minggu',
            'jam_mulai' => 'sometimes|date_format:H:i',
            'jam_selesai' => 'sometimes|date_format:H:i|after:jam_mulai',
        ]);

        $jadwal->update($validated);

        return response()->json(['message' => 'Jadwal berhasil diperbarui']);
    }

    // Hapus jadwal
    public function destroy($id)
    {
        $jadwal = JadwalDokter::findOrFail($id);
        $jadwal->delete();

        return response()->json(['message' => 'Jadwal berhasil dihapus']);
    }

    public function statusPraktikHariIni($dokter_id)
    {
        $hariIni = Carbon::now()->locale('id')->isoFormat('dddd'); // contoh: 'Sabtu'
        $now = Carbon::now();

        $jadwal = JadwalDokter::where('dokter_id', $dokter_id)
            ->where('hari', $hariIni)
            ->first();

        if (!$jadwal) {
            return response()->json([
                'status' => 'Tidak Ada Jadwal',
                'hari' => $hariIni,
                'jam_mulai' => null,
                'jam_selesai' => null,
                'waktu_tersisa' => null
            ]);
        }

        $jamMulai = Carbon::today()->setTimeFromTimeString($jadwal->jam_mulai);
        $jamSelesai = Carbon::today()->setTimeFromTimeString($jadwal->jam_selesai);
        $status = '';
        $waktuTersisa = null;

        if ($now->between($jamMulai, $jamSelesai)) {
            $status = 'Praktik Aktif';
            $waktuTersisa = $now->diff($jamSelesai)->format('%h jam %i menit');
        } elseif ($now->lt($jamMulai)) {
            $status = 'Belum Mulai';
            $waktuTersisa = $now->diff($jamMulai)->format('%h jam %i menit lagi');
        } else {
            $status = 'Selesai';
            $waktuTersisa = '0';
        }

        return response()->json([
            'status' => $status,
            'hari' => $hariIni,
            'jam_mulai' => $jadwal->jam_mulai,
            'jam_selesai' => $jadwal->jam_selesai,
            'waktu_tersisa' => $waktuTersisa
        ]);
    }
}
