<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class ContactUs extends Model
{
    public $timestamps = false;

    use Translatable;
    protected $translatable =
    [
        'address', 'working_hours'
    ];
}
