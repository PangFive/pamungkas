<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Acces extends Model
{
	protected $table = 'access';
    // Initialize
    protected $fillable = [
        'user', 'kelola_akun', 'penilaian', 'struktur_proses', 'pencapaian_tujuan',
    ];
}
