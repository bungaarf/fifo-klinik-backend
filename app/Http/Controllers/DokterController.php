<?php

namespace App\Http\Controllers;

use App\Models\Dokter;
use Illuminate\Http\Request;

class DokterController extends Controller
{
    // Ambil semua dokter
    public function index()
    {
        return Dokter::with('jadwal')->get();
    }

    // Tambah dokter baru
    public function store(Request $request)
    {
        $validated = $request->validate([
            'nama' => 'required|string',
            'spesialisasi' => 'required|string',
        ]);

        $dokter = Dokter::create($validated);

        return response()->json([
            'message' => 'Dokter berhasil ditambahkan',
            'dokter' => $dokter
        ]);
    }

    // Tampilkan 1 dokter
    public function show($id)
    {
        $dokter = Dokter::with('jadwal')->findOrFail($id);
        return response()->json($dokter);
    }

    // Update dokter
    public function update(Request $request, $id)
    {
        $dokter = Dokter::findOrFail($id);

        $validated = $request->validate([
            'nama' => 'sometimes|string',
            'spesialisasi' => 'sometimes|string',
        ]);

        $dokter->update($validated);

        return response()->json(['message' => 'Dokter berhasil diupdate']);
    }

    // Hapus dokter
    public function destroy($id)
    {
        $dokter = Dokter::findOrFail($id);
        $dokter->delete();

        return response()->json(['message' => 'Dokter berhasil dihapus']);
    }

    // Ambil dokter berdasarkan poli
    public function byPoli($poli)
    {
        return Dokter::with('jadwal')
            ->where('spesialisasi', 'LIKE', "%$poli%")
            ->get();
    }
}
