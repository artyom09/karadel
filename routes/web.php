<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\IndexController;
use App\Http\Controllers\ContactUsController;
use App\Http\Controllers\AboutUsController;
use App\Http\Controllers\ServicesController;
use App\Http\Controllers\NewsController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\Voyager\VoyagerMessageController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
    Route::post('add-archive',  [VoyagerMessageController::class, 'addArchive']);
    Route::get('archives',      [VoyagerMessageController::class, 'ArchiveMessage']);
});

Route::group(['prefix' => LaravelLocalization::setLocale()], function()
{
	/** ADD ALL LOCALIZED ROUTES INSIDE THIS GROUP **/

    Route::get('/',                 [IndexController::class, 'home']);

    Route::get('about-us',          [AboutUsController::class, 'aboutUs'])->name('about-us');
    Route::get('/portfolio',         [AboutUsController::class, 'portfolio'])->name('portfolio');
    Route::get('/portfolio/{slug}',  [AboutUsController::class, 'portfolioSingle'])->name('portfolio.show');

    // Route::get('contact-us',        [ContactUsController::class, 'contactUs'])->name('contact-us');
    // Route::post('contact-us',       [ContactUsController::class, 'message'])->name('message');

    Route::get('reservation',       [ContactUsController::class, 'reservation'])->name('reservation');
    Route::post('reserv',           [ContactUsController::class, 'reserv'])->name('reserv');

    // Route::get('/page/{slug}',      [AboutUsController::class, 'page'])->name('page');
});



