<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\News;
use App\Models\Service;

class NewsController extends Controller
{
    public function news() {
        $newses = News::orderBy('created_at', 'asc')->paginate(2);
        $news_services = Service::orderBy('order', 'asc')->get();
        $footer_news = News::orderBy('id', 'desc')->take(3)->get();
        return view('xweb.news', [
            'newses'  => $newses,
            'news_services' => $news_services,
            'footer_news'  => $footer_news,
        ]);
    }

    public function show($slug) {
        $single_news = News::where('slug', $slug)->firstOrFail();
        $bar_newses = News::get(['title', 'slug']);
        $footer_news = News::orderBy('id', 'desc')->take(3)->get();
        $news_services = Service::orderBy('order', 'asc')->get();
        $images = json_decode($single_news->images);
        $files = json_decode($single_news->files);
        return view('xweb.news-single', [
            'single_news'  => $single_news,
            'bar_newses'  => $bar_newses,
            'footer_news'  => $footer_news,
            'images'  => $images,
            'files'  => $files,
            'news_services' => $news_services,
        ]);
    }
}
