<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class JawabanStrukturProses extends Model
{
    public function mapping()
    {
        return $this->belongsTo(Mapping_responden::class, 'mapping_id',);
    }
    protected $table = 'jawaban_struktur_proses';
}
