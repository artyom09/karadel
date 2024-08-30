<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Counter extends Model
{
    public $timestamps = false;

    use Translatable;
    protected $translatable =
    [
        'title', 'count', 'link'
    ];
}
