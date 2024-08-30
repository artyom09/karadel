<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use App\Http\Controllers\UrlController;
use App\Models\About;
use App\Models\ContactUs;
use App\Models\News;
use Illuminate\Support\Facades\View;
use App\Models\Program;
use Illuminate\Pagination\Paginator;



class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Paginator::useBootstrap();

        Schema::defaultStringLength(191);
        $header_contacts = ContactUs::where('id', 1)->first();
        $footer_programs = Program::orderBy('created_at', 'asc')->take(5)->get();
        $footer_news = News::orderBy('created_at', 'asc')->take(3)->get();
        $about_us = About::where('id', 1)->first();
        // Languages
        $iso = UrlController::geturl();
        $languages = UrlController::languages();
        $set_lang = UrlController::set_language();
        View::share('languages', $languages);
        View::share('set_lang', $set_lang);
        View::share('iso', $iso);
        View::share('footer_programs', $footer_programs);
        View::share('header_contacts', $header_contacts);
        View::share('about_us', $about_us);
        View::share('footer_news', $footer_news);
    }
}
