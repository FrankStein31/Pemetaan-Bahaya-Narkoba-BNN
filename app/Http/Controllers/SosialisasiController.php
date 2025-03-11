<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Sosialisasi;
use App\Models\Application;
use Illuminate\Support\Facades\Storage;

class SosialisasiController extends Controller {
    // Tampilkan data di dashboard user
    
    public function indexuser(){
        $sosialisasi = Sosialisasi::where('status', 'aktif')->latest()->first();
return view('masyarakat.dashboard.index', compact('sosialisasi'));
    }
    
    public function index() {
        
        // $sosialisasi = Sosialisasi::latest()->get();
        // return view('admin.sosialisasi.create', compact('sosialisasi'));

        return view('admin.sosialisasi.index', [
            'app' => Application::all(),
            'sosialisasi' => Sosialisasi::paginate(10),
            'title' => 'Sosialisasi'
        ]);
    }
    public function store(Request $request) {
        $request->validate([
            'judul' => 'required|max:255',
            'deskripsi' => 'required|max:255',
            'gambar' => 'required|image|mimes:jpeg,png,jpg|max:2048',
            'status' => 'required|in:aktif,nonaktif',
        ]);
    
        // Simpan dengan nama asli dan replace jika ada yang sama
        $gambar = $request->file('gambar');
        $namaFile = $gambar->getClientOriginalName(); // Ambil nama asli file
        $path = 'sosialisasi/' . $namaFile; // Path penyimpanan di storage
    
        // Simpan file ke storage/public/sosialisasi dengan nama asli
        $gambar->storeAs('sosialisasi', $namaFile, 'public');
    
        // Simpan ke database
        Sosialisasi::create([
            'judul' => $request->judul,
            'deskripsi' => $request->deskripsi,
            'gambar' => $path, // Simpan path untuk digunakan di tampilan
            'status' => $request->status,
        ]);
    
        return back()->with('tambahSosialisasiSukses', 'Sosialisasi berhasil diunggah!');
    }
    
    public function deleteSosialisasi(Request $request)
{
    $idSosialisasi = decrypt($request->codeSosialisasi);
    Sosialisasi::destroy($idSosialisasi);
    return back()->with('deleteSosialisasi', 'Sosialisasi berhasil dihapus!');
}

    // Hapus data
    public function destroy($id) {
        $sosialisasi = Sosialisasi::findOrFail($id);
        Storage::disk('public')->delete($sosialisasi->gambar);
        $sosialisasi->delete();

        return back()->with('success', 'Brosur berhasil dihapus!');
    }

    public function toggleStatus($id) {
        $sosialisasi = Sosialisasi::findOrFail($id);
        $sosialisasi->status = $sosialisasi->status === 'aktif' ? 'nonaktif' : 'aktif';
        $sosialisasi->save();
    
        return back()->with('success', 'Status brosur diperbarui!');
    }

// public function editSosialisasi(Request $request)
// {
//     $idSosialisasi = decrypt($request->code);
    
//     try {
//         $validatedData = $request->validate([
//             'judul' => 'required|string|max:255|unique:sosialisasi,judul,'.$idSosialisasi,
//             'deskripsi' => 'required|string|max:255',
//             'gambar' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
//         ]);
        

//         $sosialisasi = Sosialisasi::findOrFail($idSosialisasi);

//         // Siapkan data update
//         $dataToUpdate = [
//             'judul' => $validatedData['judul'],
//             'deskripsi' => $validatedData['deskripsi'],
//         ];

//     // Hapus gambar lama
//     if ($request->hasFile('gambar')) {
//         // Hapus gambar lama jika ada
//         if ($sosialisasi->gambar && Storage::exists('public/' . $sosialisasi->gambar)) {
//             Storage::delete('public/' . $sosialisasi->gambar);
//         }

//         // Simpan gambar baru
//         $image = $request->file('gambar');
//         $imageName = time() . '_' . $image->getClientOriginalName();
//         $path = 'sosialisasi/' . $imageName; // Path penyimpanan

//         $image->storeAs('public/sosialisasi', $imageName); // Simpan ke storage/public/sosialisasi
//         $dataToUpdate['gambar'] = $path;
//     }

//         $sosialisasi->update($dataToUpdate);
        
//         return back()->with('editSosialisasiSuccess', 'Data sosialisasi berhasil diperbarui!');

//     } catch (ValidationException $e) {
//         return back()->withErrors($e->validator)
//                      ->withInput()
//                      ->with('editing_sosialisasi', true);
//     }
// }


public function editSosialisasi(Request $request)
{
    $idSosialisasi = decrypt($request->code);
    
    try {
        $validatedData = $request->validate([
            'judul' => 'required|string|max:255|unique:sosialisasi,judul,'.$idSosialisasi,
            'deskripsi' => 'required|string|max:255',
            'gambar' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        $sosialisasi = Sosialisasi::findOrFail($idSosialisasi);

        // Siapkan data update
        $dataToUpdate = [
            'judul' => $validatedData['judul'],
            'deskripsi' => $validatedData['deskripsi'],
        ];

        // Upload gambar jika ada
        if ($request->hasFile('gambar') && $request->file('gambar')->isValid()) {
            // Hapus gambar lama jika ada
            if ($sosialisasi->gambar && Storage::exists('public/' . $sosialisasi->gambar)) {
                Storage::delete('public/' . $sosialisasi->gambar);
            }

            // Simpan gambar baru
            $image = $request->file('gambar');
            $imageName = time() . '_' . $image->getClientOriginalName();
            $path = 'sosialisasi/' . $imageName; // Path penyimpanan

            $image->storeAs('public/sosialisasi', $imageName); // Simpan ke storage/public/sosialisasi
            $dataToUpdate['gambar'] = $path;
        }

        $sosialisasi->update($dataToUpdate);
        
        return back()->with('editSosialisasi', 'Data sosialisasi berhasil diperbarui!');

    } catch (ValidationException $e) {
        return back()->withErrors($e->validator)
                     ->withInput()
                     ->with('editing_sosialisasi', true);
    }
}

//     public function edit($id)
// {
//     $item = ModelAnda::findOrFail($id); // Pastikan mengambil data sesuai ID
//     return view('nama_view', compact('item'));
// }
    
}
