@extends('layouts.front')

@section('content')
    <div id="content" class="content">
        <div class="content__wrapper">
            <section id="portfolio" class="inner inner-first portfolio">
                <div class="content__block section-grid-title">
                    <p class="h2__subtitle animate-in-up">
                        <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="13px" height="13px" viewBox="0 0 13 13" fill="currentColor">
                            <path fill="currentColor" d="M5.6,12.6c-0.5-0.8-0.7-2.4-1.7-3.5c-1-1-2.7-1.2-3.5-1.7C-0.1,7-0.1,6,0.4,5.6c0.8-0.5,2.3-0.6,3.5-1.8
                  C5,2.8,5.1,1.2,5.6,0.4C6-0.1,7-0.1,7.4,0.4c0.5,0.8,0.7,2.4,1.8,3.5c1.2,1.2,2.6,1.2,3.5,1.7c0.6,0.4,0.6,1.4,0,1.7
                  C11.8,7.9,10.2,8,9.1,9.1c-1,1-1.2,2.7-1.7,3.5C7,13.1,6,13.1,5.6,12.6z" />
                        </svg>
                        <span>@lang('main.portfolio')</span>
                    </p>
                    <h2 class="h2__title animate-in-up">{{$gallery->getTranslatedAttribute('title',config('app.locale'),config('voyager.multilingual.default'))}}</h2>
                </div>

                <div class="content__block grid-block">
                    <div class="container-fluid px-0 inner__gallery">
                        <div class="row gx-0 my-gallery" itemscope itemtype="http://schema.org/ImageGallery">

                            <figure class="col-12 col-md-4 gallery__item grid-item animate-card-2" itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
                                <a href="{{Voyager::image($gallery->image)}}" data-image="{{Voyager::image($gallery->image)}}" class="gallery__link g-images" itemprop="contentUrl" data-size="1400x1400">
                                    <img src="{{Voyager::image($gallery->image)}}" class="gallery__image" itemprop="thumbnail" alt="Image description">
                                </a>
                                <figcaption class="gallery__descr" itemprop="caption description">
                                    <h5>{{$gallery->getTranslatedAttribute('title',config('app.locale'),config('voyager.multilingual.default'))}}</h5>
                                    <p class="small">{{$gallery->getTranslatedAttribute('info',config('app.locale'),config('voyager.multilingual.default'))}}</p>
                                </figcaption>
                            </figure>

                            @foreach($images as $image)
                            <figure class="col-12 col-md-4 gallery__item grid-item animate-card-2" itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
                                <a href="{{Voyager::image($image)}}" data-image="{{Voyager::image($image)}}" class="gallery__link g-images" itemprop="contentUrl" data-size="1400x1400">
                                    <img src="{{Voyager::image($image)}}" class="gallery__image" itemprop="thumbnail" alt="Image description">
                                </a>
                                <figcaption class="gallery__descr" itemprop="caption description">
                                    <h5>{{$gallery->getTranslatedAttribute('title',config('app.locale'),config('voyager.multilingual.default'))}}</h5>
                                    <p class="small">{{$gallery->getTranslatedAttribute('info',config('app.locale'),config('voyager.multilingual.default'))}}</p>
                                </figcaption>
                            </figure>
                            @endforeach
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
@endsection
