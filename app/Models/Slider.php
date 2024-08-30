<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Slider extends Model
{
    public $timestamps = false;

    use Translatable;
    protected $translatable =
    [
        'title', 'min_title', 'button_name', 'info', 'button_link'
    ];
}
