<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sosialisasi extends Model {
    use HasFactory;

    protected $table = 'sosialisasi';

    protected $fillable = [
        'judul',
        'deskripsi',
        'gambar',
        'status',
    ];
}
