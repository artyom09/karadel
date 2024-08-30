<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;
use Illuminate\Support\Carbon;

class News extends Model
{
    use Translatable;
    protected $translatable =
    [
        'title', 'excerpt', 'body',
    ];

    public function getDate($date) {
        return Carbon::parse($date)->translatedFormat('d F Y');
    }
}
