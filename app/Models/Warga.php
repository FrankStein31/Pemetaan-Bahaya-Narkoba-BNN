<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Warga extends Model
{
    use HasFactory;

    protected $table = 'wargas';

    protected $fillable = [
        'nik', 'nama', 'alamat', 'jk', 'dsn_id', 'ds_id', 'kec_id'
    ];
    
}
