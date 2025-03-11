<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Application;
use App\Models\Kecamatan;
use App\Models\Desa;
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
            'wargas' => Warga::with('kecamatan', 'desa')->latest()->paginate(8), // Eager loading kecamatan
            'kecamatans' => Kecamatan::all(), // Ambil semua kecamatan
            'desas' => Desa::all(), // Ambil semua desa
        ]);
    }

    // Menampilkan form tambah warga
    public function create()
    {
        // $kecamatans = Kecamatan::all(); // Ambil semua data kecamatan
        // return view('warga.create', compact('kecamatans'));
    }

    // Menyimpan data warga baru
    public function store(Request $request)
    {
        $request->validate(
            [
                'nik' => 'required|digits:16|unique:wargas',
                'nama' => 'required|string|max:255',
                'alamat' => 'required|string',
                'jk' => 'required|in:Laki-Laki,Perempuan',
                'desa_id' => 'required|string',
                'kecamatan_id' => 'required|string',
            ],
            [
                'nik.required' => 'NIK wajib diisi.',
                'nik.digits' => 'NIK harus terdiri dari 16 digit.',
                'nik.unique' => 'NIK sudah terdaftar.',
                'nama.required' => 'Nama wajib diisi.',
                'alamat.required' => 'Alamat wajib diisi.',
                'jk.required' => 'Jenis kelamin wajib dipilih.',
                'desa_id.required' => 'Desa wajib dipilih.',
                'kecamatan_id.required' => 'Kecamatan wajib dipilih.',
            ],
        );

        // Menambahkan nilai default untuk status_narkoba
        $data = $request->only(['nik', 'nama', 'alamat', 'jk', 'desa_id', 'kecamatan_id']);
        $data['status_narkoba'] = 'Belum Diketahui';

        Warga::create($data);

        return back()->with('tambahwargaBerhasil', 'Berhasil menambah warga!');
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
    public function deleteWarga(Request $request)
    {
        $idWarga = decrypt($request->codeWarga);
        Warga::destroy($idWarga);
        return back()->with('deleteWarga', 'Warga berhasil dihapus!');
    }

    public function editWarga(Request $request)
{
    $idWarga = decrypt($request->code);
    
    try {
        $validatedData = $request->validate([
            'nik' => 'required|digits:16|unique:wargas,nik,'.$idWarga,
            'nama' => 'required|string|max:255',
            'alamat' => 'required|string',
            'jk' => 'required|in:Laki-Laki,Perempuan',
            'desa' => 'required|string',       // Sesuaikan dengan nama di form
            'kecamatan' => 'required|string',  // Sesuaikan dengan nama di form
            'status_narkoba' => 'required|string',
        ]);
        
        // Konversi nama field agar sesuai dengan database jika diperlukan
        $dataToUpdate = [
            'nik' => $validatedData['nik'],
            'nama' => $validatedData['nama'],
            'alamat' => $validatedData['alamat'],
            'jk' => $validatedData['jk'],
            'desa_id' => $validatedData['desa'],         // Konversi ke nama kolom di database
            'kecamatan_id' => $validatedData['kecamatan'], // Konversi ke nama kolom di database
            'status_narkoba' => $validatedData['status_narkoba'],
        ];
        
        Warga::where('id', $idWarga)->update($dataToUpdate);
        return back()->with('editWargaSuccess', 'Data warga berhasil diupdate!');
        
    } catch (ValidationException $e) {
        return back()->withErrors($e->validator)
                     ->withInput()
                     ->with('editing_warga', true); // Tambahkan flag ini
    }
}
    public function getDesaByKecamatan($kecamatan_id)
{
    $desas = Desa::where('kecamatan_id', $kecamatan_id)->get();
    return response()->json($desas);
}

    

}
