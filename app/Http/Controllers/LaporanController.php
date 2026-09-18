<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class LaporanController extends Controller
{
    public function harian($dokterId)
{
    $today = now()->toDateString();
    $startOfWeek = now()->startOfWeek();

    return response()->json([
        'hari_ini' => DB::table('pendaftaran_pasiens')
            ->where('dokter_id', $dokterId)
            ->where(function($query) use ($today) {
                $query->whereDate('waktu_daftar', $today) // daftar hari ini
                      ->orWhereDate('tanggal_janji', $today); // daftar kemarin tapi janji hari ini
            })
            ->count(),

        'minggu_ini' => DB::table('pendaftaran_pasiens')
            ->where('dokter_id', $dokterId)
            ->whereBetween('waktu_daftar', [$startOfWeek, now()])
            ->count()
    ]);
}



    public function bulanan(Request $request, $dokterId)
{
    $bulan = $request->query('bulan'); // Format: MM-YYYY

    if (!$bulan) {
        return response()->json(['error' => 'Parameter bulan wajib diisi'], 400);
    }

    [$month, $year] = explode('-', $bulan);

    try {
        $start = Carbon::createFromDate($year, $month)->startOfMonth();
        $end = Carbon::createFromDate($year, $month)->endOfMonth();
    } catch (\Exception $e) {
        return response()->json(['error' => 'Format bulan tidak valid'], 400);
    }

    $pendaftaran = DB::table('pendaftaran_pasiens')
        ->where('dokter_id', $dokterId)
        ->whereBetween('created_at', [$start, $end])
        ->get();

    $total = $pendaftaran->count();

    $hariAktif = $pendaftaran->groupBy(function ($item) {
        return Carbon::parse($item->created_at)->toDateString();
    })->count();

    $rata2 = $hariAktif > 0 ? round($total / $hariAktif, 1) : 0;

    $keluhanGrouped = $pendaftaran->groupBy('keluhan');
    $keluhanCounts = collect($keluhanGrouped)->map(fn($group) => count($group));
    $terbanyak = $keluhanCounts->sortDesc()->take(1);

    $keluhanText = $terbanyak->isNotEmpty()
        ? $terbanyak->keys()->first() . " (" . round(($terbanyak->values()->first() / max($total, 1)) * 100, 1) . "%)"
        : "Tidak ada data";

    return response()->json([
        'bulan_text' => $start->translatedFormat('F Y'),
        'total_pasien' => $total,
        'hari_aktif' => $hariAktif,
        'rata_pasien' => $rata2,
        'keluhan_terbanyak' => $keluhanText
    ]);
}

}
