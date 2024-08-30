<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Product extends Model
{
    use Translatable;
    protected $translatable =
    [
        'title', 'info', 'descr',
    ];

    public function getBrandName($data) {;
       $brand = Brand::where('id', $data)->first();
       return $brand;
    }
}
