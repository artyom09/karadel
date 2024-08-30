<?php

namespace App\Http\Controllers;

use App\Models\Slider;
use App\Models\About;
use App\Models\Partner;
use App\Models\Product;
use App\Models\Project;
use App\Models\Review;
use App\Models\Program;
use App\Models\News;
use Illuminate\Http\Request;

class IndexController extends Controller
{
    public function home() {
        $slider = Slider::where('id', 1)->first();
        $about_us = About::where('id', 1)->first();
        $galleries = Project::inRandomOrder()->take(6)->get();
        $reviews = Review::get();
        return view('xweb.home', [
            'slider'   => $slider,
            'about_us'  => $about_us,
            'reviews' => $reviews,
            'galleries' => $galleries
        ]);
    }
}
