<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Application;
use App\Models\Desa;
class VillageController extends Controller
{
    public function index()
    {
        return view('desamap', [
            'title' => 'Peta Desa',
            'desas' => Desa::all(),
        ]);

    }
    public function coba()
    {
        return view('admin.maps.desamap', [
            'app' => Application::all(),
            'title' => 'Peta Desa',
            'desas' => Desa::all(),
        ]);

    }
}
