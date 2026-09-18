<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Models\Dokter;
use App\Models\PendaftaranPasien;
use App\Models\User;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;





class PendaftaranPasienController extends Controller
{

    protected function invalidJson($request, ValidationException $exception): JsonResponse
    {
        return response()->json([
            'message' => 'Validasi gagal.',
            'errors' => $exception->errors(),
        ], $exception->status);
    }

    public function index()
    {
        // Method ini bisa digunakan untuk menampilkan daftar pendaftaran pasien
        $pendaftaran = PendaftaranPasien::with('user', 'dokter')->get();
        return response()->json($pendaftaran);
    }

    public function getPendaftaranHariIni($dokterId)
    {
        $hariIni = Carbon::today();

        $pendaftaranHariIni = PendaftaranPasien::with(['user', 'dokter'])
            ->where('dokter_id', $dokterId)
            ->whereDate('tanggal_janji', $hariIni)
            ->orderBy('nomor_antrian', 'asc')
            ->get();

        return response()->json([
            'tanggal' => $hariIni->toDateString(),
            'total' => $pendaftaranHariIni->count(),
            'data' => $pendaftaranHariIni
        ]);
    }


    public function store(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'tipe_pendaftaran' => 'required|in:BPJS,Umum',
            'poli' => 'required|in:Umum,Gigi,KIA',
            'keluhan' => 'required|string',
            'tanggal_janji' => 'required|date|after_or_equal:today',
            'dokter_id' => 'required|exists:dokters,id',
        ], [
            'tanggal_janji.after_or_equal' => 'Tanggal janji tidak boleh di hari yang telah lewat.'
        ]);

        $tanggalJanji = Carbon::parse($request->tanggal_janji);
        if ($tanggalJanji->lt(Carbon::today())) {
            return response()->json([
                'message' => 'Tanggal janji tidak boleh di hari yang telah lewat.'
            ], 422);
        }

        $mapping = [
            'Umum' => ['spesialisasi' => 'Dokter Umum', 'prefix' => 'PU'],
            'Gigi' => ['spesialisasi' => 'Dokter Gigi', 'prefix' => 'PG'],
            'KIA'  => ['spesialisasi' => 'Kebidanan', 'prefix' => 'PK'],
        ];

        $prefix = $mapping[$request->poli]['prefix'];

        // ✅ Ambil dokter dari request
        $dokter = Dokter::find($request->dokter_id);
        if (!$dokter) {
            return response()->json(['message' => 'Dokter tidak ditemukan'], 404);
        }

        // Cek jadwal dokter
        $hariJanji = ucfirst(strtolower($tanggalJanji->locale('id')->isoFormat('dddd')));
        $jadwalHariItu = $dokter->jadwal()
            ->whereRaw('LOWER(hari) = ?', [strtolower($hariJanji)])
            ->first();

        if (!$jadwalHariItu) {
            return response()->json([
                'message' => "Dokter tidak praktik pada hari $hariJanji"
            ], 403);
        }

        // ✅ Validasi jam praktik jika hari ini
        if ($tanggalJanji->isToday()) {
            if (!$jadwalHariItu->jam_mulai || !$jadwalHariItu->jam_selesai) {
                return response()->json([
                    'message' => 'Jam praktik belum lengkap. Silakan hubungi admin.'
                ], 500);
            }

            try {
                $jamMulai = Carbon::createFromFormat('H:i:s', $jadwalHariItu->jam_mulai);
                $jamSelesai = Carbon::createFromFormat('H:i:s', $jadwalHariItu->jam_selesai);
            } catch (\Exception $e) {
                return response()->json([
                    'message' => 'Format jam praktik tidak valid. Silakan hubungi admin.'
                ], 500);
            }

            $sekarang = Carbon::now();

            if ($sekarang->gte($jamSelesai)) {
                return response()->json([
                    'message' => 'Jam praktik dokter untuk hari ini telah selesai. Silakan pilih hari lain.'
                ], 403);
            }
        }

        // ✅ Tambahan validasi: BPJS hanya boleh 1 kali per hari
        if ($request->tipe_pendaftaran === 'BPJS') {
            $sudahBooking = PendaftaranPasien::where('user_id', $request->user_id)
                ->whereDate('tanggal_janji', $request->tanggal_janji)
                ->exists();

            if ($sudahBooking) {
                return response()->json([
                    'message' => 'Pendaftaran BPJS hanya diperbolehkan 1 kali per hari.'
                ], 422);
            }
        }

        $kuotaPerPoli = [
            'Umum' => 20,
            'Gigi' => 20,
            'KIA'  => 20,
        ];

        $maksimalPasienPerHari = $kuotaPerPoli[$request->poli];

        // Hitung pasien per dokter per hari
        $jumlahPasien = PendaftaranPasien::where('dokter_id', $dokter->id)
            ->whereDate('tanggal_janji', $request->tanggal_janji)
            ->count();

        if ($jumlahPasien >= $maksimalPasienPerHari) {
            return response()->json([
                'message' => 'Kuota pasien untuk tanggal tersebut sudah penuh. Silakan pilih tanggal lain.'
            ], 409);
        }

        // ✅ Nomor antrian unik per dokter
        $prefixDokter = $prefix . $dokter->id;
        $nomorAntrian = $prefixDokter . '-' . str_pad($jumlahPasien + 1, 2, '0', STR_PAD_LEFT);

        $pendaftaran = PendaftaranPasien::create([
            'user_id' => $request->user_id,
            'dokter_id' => $dokter->id,
            'poli' => $request->poli,
            'tipe_pendaftaran' => $request->tipe_pendaftaran,
            'keluhan' => $request->keluhan,
            'waktu_daftar' => now(),
            'tanggal_janji' => $request->tanggal_janji,
            'status' => 'menunggu',
            'nomor_antrian' => $nomorAntrian,
        ]);

        return response()->json([
            'message' => 'Pendaftaran berhasil',
            'booking' => [
                'poli' => $request->poli,
                'tipe_pendaftaran' => $request->tipe_pendaftaran,
                'tanggal_janji' => $request->tanggal_janji,
                'nomor_antrian' => $nomorAntrian,
                'status' => 'menunggu',
                'keluhan' => $request->keluhan,
                'dokter' => [
                    'id' => $dokter->id,
                    'nama' => $dokter->nama
                ]
            ]
        ]);
    }






    public function jadwalDanSlot($poli)
    {
        $mapping = [
            'Umum' => 'Dokter Umum',
            'Gigi' => 'Dokter Gigi',
            'KIA'  => 'Kebidanan',
        ];

        if (!isset($mapping[$poli])) {
            return response()->json(['message' => 'Poli tidak valid'], 400);
        }

        $spesialisasi = $mapping[$poli];

        // Ambil semua dokter beserta jadwalnya
        $dokters = Dokter::with('jadwal')
            ->where('spesialisasi', $spesialisasi)
            ->get();

        if ($dokters->isEmpty()) {
            return response()->json(['message' => 'Tidak ada dokter untuk poli ini'], 404);
        }

        // Minggu berjalan: Senin sampai Sabtu
        $startOfWeek = Carbon::now()->startOfWeek(Carbon::MONDAY);
        $endOfWeek   = $startOfWeek->copy()->addDays(6); // Sabtu

        $hasil = [];

        foreach ($dokters as $dokter) {
            foreach ($dokter->jadwal as $jadwal) {
                // Loop tanggal dari Senin sampai Sabtu
                for ($date = $startOfWeek->copy(); $date->lte($endOfWeek); $date->addDay()) {

                    // Nama hari dalam Bahasa Indonesia, misal: Senin, Selasa, ...
                    $hariCarbon = ucfirst(strtolower($date->locale('id')->isoFormat('dddd')));
                    $hariDb     = ucfirst(strtolower($jadwal->hari));

                    // Hanya tambahkan jika harinya cocok
                    if ($hariCarbon === $hariDb) {
                        $jumlahPasien = PendaftaranPasien::where('dokter_id', $dokter->id)
                            ->whereDate('tanggal_janji', $date->toDateString())
                            ->count();

                        // Pakai kuota dari DB jika ada, default 2
                        $kuota = $jadwal->kuota_harian ?? 20;

                        $hasil[] = [
                            'dokter_id'   => $dokter->id,
                            'nama_dokter' => $dokter->nama,
                            'hari'        => $hariDb,
                            'tanggal'     => $date->format('Y-m-d'),
                            'jam_mulai'   => $jadwal->jam_mulai,
                            'jam_selesai' => $jadwal->jam_selesai,
                            'sisa_slot'   => max($kuota - $jumlahPasien, 0)
                        ];
                    }
                }
            }
        }

        return response()->json([
            'jadwal' => $hasil
        ]);
    }


    public function panggilBerikutnya($poli)
    {
        $mapping = [
            'Umum' => 'Dokter Umum',
            'Gigi' => 'Dokter Gigi',
            'KIA'  => 'Kebidanan',
        ];

        $spesialisasi = $mapping[$poli];

        // Ambil dokter
        $dokter = Dokter::where('spesialisasi', $spesialisasi)->first();

        if (!$dokter) {
            return response()->json(['message' => 'Dokter tidak ditemukan'], 404);
        }

        // FIFO: ambil pasien paling awal yang masih menunggu
        $pasien = PendaftaranPasien::where('dokter_id', $dokter->id)
            ->where('status', 'menunggu')
            ->orderBy('waktu_daftar')
            ->first();

        if (!$pasien) {
            return response()->json(['message' => 'Tidak ada pasien menunggu']);
        }

        $pasien->update(['status' => 'diperiksa']);

        return response()->json([
            'message' => 'Pasien dipanggil',
            'pasien' => $pasien->user->nama,
            'poli' => $pasien->poli,
            'keluhan' => $pasien->keluhan,
            'jam' => $pasien->waktu_daftar,
        ]);
    }


    public function lihatAntrian(Request $request, $poli)
    {
        $mapping = [
            'Umum' => 'Dokter Umum',
            'Gigi' => 'Dokter Gigi',
            'KIA'  => 'Kebidanan',
        ];

        // Ambil semua dokter di poli ini
        $dokterIds = Dokter::where('spesialisasi', $mapping[$poli])->pluck('id');

        if ($dokterIds->isEmpty()) {
            return response()->json(['message' => 'Dokter tidak ditemukan'], 404);
        }

        $antrian = PendaftaranPasien::whereIn('dokter_id', $dokterIds)
            ->where('status', 'menunggu')
            ->when($request->filled('tanggal_janji'), function ($query) use ($request) {
                $query->whereDate('tanggal_janji', $request->tanggal_janji);
            })
            ->orderBy('waktu_daftar')
            ->with(['user', 'dokter']) // sekalian ambil nama dokternya
            ->get();

        return response()->json($antrian);
    }



    public function dashboardStats($dokterId)
    {
        $pasien = PendaftaranPasien::where('dokter_id', $dokterId)->get();

        return response()->json([
            'total' => $pasien->count(),
            'menunggu' => $pasien->whereIn('status', ['menunggu', 'Menunggu'])->count(),
            'diperiksa' => $pasien->whereIn('status', ['diperiksa', 'Diperiksa'])->count(),
            'selesai' => $pasien->whereIn('status', ['selesai', 'Selesai'])->count(),
        ]);
    }



    public function pasienTerkini($dokterId)
    {
        $pasien = PendaftaranPasien::where('dokter_id', $dokterId)
            ->where('status', 'diperiksa')
            ->orderBy('waktu_daftar', 'desc')
            ->first();

        return response()->json($pasien);
    }


    public function panggilPasien($id)
    {
        // Temukan pendaftaran berdasarkan ID
        $pendaftaran = PendaftaranPasien::findOrFail($id);

        $pendaftaran->waktu_pemeriksaan = Carbon::now();

        // Set semua pasien yang sedang 'dipanggil' jadi 'selesai'
        PendaftaranPasien::where('status', 'dipanggil')->update(['status' => 'selesai']);

        // Panggil pasien ini
        $pendaftaran->status = 'diperiksa';
        $pendaftaran->save();

        return response()->json([
            'message' => "Pasien dengan nomor antrian {$pendaftaran->nomor_antrian} telah dipanggil dan statusnya berubah dari 'menunggu' menjadi 'diperiksa'.",
            'id' => $pendaftaran->id,
            'nama' => $pendaftaran->user->nama,
            'status' => $pendaftaran->status,
            'poli' => $pendaftaran->poli,
            'keluhan' => $pendaftaran->keluhan,
            'dokter' => $pendaftaran->dokter ? $pendaftaran->dokter->nama : 'Tidak diketahui',
            'tanggal_janji' => $pendaftaran->tanggal_janji,
            'nomor_antrian' => $pendaftaran->nomor_antrian,
            'waktu_pemeriksaan' => $pendaftaran->waktu_pemeriksaan
        ]);
    }


    // Route: POST /api/panggil-pasien/{dokterId}
    public function callPasien($dokterId)
    {
        $pasien = PendaftaranPasien::where('dokter_id', $dokterId)
            ->where('status', 'menunggu')
            ->orderBy('waktu_daftar', 'asc')
            ->first();

        if ($pasien) {
            $pasien->status = 'diperiksa';
            $pasien->save();

            return response()->json([
                'message' => 'Pasien berhasil dipanggil',
                'data' => $pasien
            ]);
        }

        return response()->json([
            'message' => 'Tidak ada pasien dalam antrian'
        ], 404);
    }

    // Route: POST /api/selesaikan-pasien/{id}
    public function selesaikanPasien($id)
    {
        $pasien = PendaftaranPasien::find($id);

        if ($pasien && $pasien->status == 'diperiksa') {
            $pasien->status = 'selesai';
            $pasien->save();

            return response()->json([
                'message' => 'Pemeriksaan selesai',
                'data' => $pasien
            ]);
        }

        return response()->json([
            'message' => 'Pasien tidak ditemukan atau belum diperiksa'
        ], 404);
    }

    public function kembalikanPasien($id)
    {
        $pendaftaran = PendaftaranPasien::findOrFail($id);

        if ($pendaftaran->status === 'diperiksa') {
            $pendaftaran->status = 'menunggu'; // atau 'antri' sesuai konvensimu
            $pendaftaran->save();

            return response()->json([
                'message' => 'Pasien berhasil dikembalikan ke antrian.',
            ]);
        }

        return response()->json([
            'message' => 'Status tidak valid untuk dikembalikan.',
        ], 400);
    }

    public function riwayat($dokterId)
    {
        $riwayat = PendaftaranPasien::where('status', 'selesai')
            ->where('dokter_id', $dokterId) // filter berdasarkan dokter_id
            ->orderBy('tanggal_janji', 'desc')
            ->get()
            ->map(function ($item) {
                return [
                    'tanggal' => $item->tanggal_janji,
                    'nama' => $item->user->nama ?? '-', // dari relasi user
                    'keluhan' => $item->keluhan,
                    'waktu_pemeriksaan' => $item->waktu_pemeriksaan,
                ];
            });

        return response()->json($riwayat);
    }

    public function checkBpjs(Request $request)
{
    $userId = $request->query('user_id');
    $tanggalJanji = $request->query('tanggal_janji');

    $exists = DB::table('pendaftaran_pasiens')
        ->where('user_id', $userId)
        ->where('tipe_pendaftaran', 'BPJS')
        ->whereDate('tanggal_janji', $tanggalJanji) // ✅ cek tanggal janji, bukan created_at
        ->exists();

    return response()->json(['exists' => $exists]);
}

}
