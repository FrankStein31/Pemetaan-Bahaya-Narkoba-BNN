<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Application;
use App\Models\Patient;
use App\Models\Warga; // Pastikan model Warga sudah dibuat

class AdminWargaController extends Controller
{
    // Menampilkan daftar warga
    public function index()
    {
        return view('admin.wargas.index', [
            'app' => Application::all(),
            'title' => 'Data Warga',
            'wargas' => Warga::latest()->paginate(10)
            // 'patients' => Patient::where('queue_number_id', null)->where('late_queue_number', null)->latest()->paginate(10)
        ]);
        // $warga = Warga::all(); // Mengambil semua data warga dari database
        // return view('admin.warga.index', compact('warga'));
    }

    // Menampilkan form tambah warga
    public function create()
    {
        // return view('admin.warga.create');
    }

    // Menyimpan data warga baru
    public function store(Request $request)
    {
        $request->validate([
            'nik' => 'required|unique:wargas|max:16',
            'nama' => 'required|string|max:255',
            'alamat' => 'required|string',
            'jk' => 'required|in:Laki-Laki,Perempuan',
            'dsn_id' => 'required|string',
            'ds_id' => 'required|string',
            'kec_id' => 'required|string',
        ]);
// dd($tes);
        Warga::create($request->all());

        return back()->with('notificationMessage', 'Berhasil menambah warga!');
    }

    // Menampilkan detail warga tertentu
    public function show($id)
    {
        // $warga = Warga::findOrFail($id);
        // return view('admin.warga.show', compact('warga'));
    }

    // Menampilkan form edit warga
    public function edit($id)
    {
        // $warga = Warga::findOrFail($id);
        // return view('admin.warga.edit', compact('warga'));
    }

    // Memperbarui data warga
    public function update(Request $request, $id)
    {
        // $request->validate([
        //     'nama' => 'required|string|max:255',
        //     'alamat' => 'required|string',
        //     'no_telp' => 'required|numeric',
        // ]);

        // $warga = Warga::findOrFail($id);
        // $warga->update($request->all());

        // return redirect()->route('admin.warga.index')->with('success', 'Data warga berhasil diperbarui!');
    }

    // Menghapus warga
    public function destroy($id)
    {
        // $warga = Warga::findOrFail($id);
        // $warga->delete();

        // return redirect()->route('admin.warga.index')->with('success', 'Data warga berhasil dihapus!');
    }
}
