<?php

namespace App\Http\Controllers;

use App\Models\About;
use App\Models\Counter;
use App\Models\Page;
use App\Models\Project;
use App\Models\Review;
use App\Models\Partner;
use Illuminate\Http\Request;

class AboutUsController extends Controller
{
    public function aboutUs() {
        $about_us = About::where('id', 1)->first();
        $counters = Counter::inRandomOrder()->take(4)->get();
        $galleries = Project::get();
        $reviews = Review::get();
        $partners = Partner::get();
        return view('xweb.about-us', [
            'about_us' => $about_us,
            'counters'  => $counters,
            'galleries' => $galleries,
            'reviews' => $reviews,
            'partners' => $partners
        ]);
    }

    public function portfolio() {
        $galleries = Project::paginate(12);

        return view('xweb.portfolio', [
            'galleries' => $galleries,
        ]);
    }

    public function portfolioSingle($slug) {
        $gallery =  Project::where('slug', $slug)->firstOrFail();
        $images = json_decode($gallery->other_images);
        return view('xweb.portfolio-single', [
            'gallery' => $gallery,
            'images' => $images
        ]);
    }

    public function page($slug) {
        $page = Page::where('slug', $slug)->firstOrFail();

        return view('xweb.pages', [
            'page' => $page,
        ]);
    }
}
