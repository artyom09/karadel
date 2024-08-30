<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class About extends Model
{
    public $timestamps = false;

    use Translatable;
    protected $translatable =
    [
        'title',
        'info',
        'info_one',
        'info_two',
        'info_three',
        'info_four',
        'info_title',
        'button_name',
        'button_link',
        'image_title',
        'body',
        'descr_four',
        'part_title',
        'part_min_title',
        'part_one',
        'part_two',
        'part_three',
        'part_four',
        'footer_info'
    ];
}
