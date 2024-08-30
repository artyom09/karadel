<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Service extends Model
{
    public $timestamps = false;

    use Translatable;
    protected $translatable =
    [
        'title', 'body'
    ];
}
