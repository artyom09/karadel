@extends('layouts.front')

@section('content')
    <div id="content" class="content">
        <div class="content__wrapper">
            <section id="home" class="main intro">
                <div id="headline" class="headline d-flex align-items-start flex-column" data-speed="1">
                    <p class="headline__subtitle animate-headline">
                        <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="13px" height="13px" viewBox="0 0 13 13" fill="currentColor">
                            <path fill="currentColor" d="M5.6,12.6c-0.5-0.8-0.7-2.4-1.7-3.5c-1-1-2.7-1.2-3.5-1.7C-0.1,7-0.1,6,0.4,5.6c0.8-0.5,2.3-0.6,3.5-1.8
                  C5,2.8,5.1,1.2,5.6,0.4C6-0.1,7-0.1,7.4,0.4c0.5,0.8,0.7,2.4,1.8,3.5c1.2,1.2,2.6,1.2,3.5,1.7c0.6,0.4,0.6,1.4,0,1.7
                  C11.8,7.9,10.2,8,9.1,9.1c-1,1-1.2,2.7-1.7,3.5C7,13.1,6,13.1,5.6,12.6z" />
                        </svg>
                        <span>{{$slider->getTranslatedAttribute('min_title',config('app.locale'),config('voyager.multilingual.default'))}}</span>
                    </p>
                    <h1 class="headline__title animate-headline">{{$slider->getTranslatedAttribute('title',config('app.locale'),config('voyager.multilingual.default'))}} <br>
                        {!!   $slider->getTranslatedAttribute('info',config('app.locale'),config('voyager.multilingual.default'))!!}</h1>
                    <div class="headline__btnholder d-flex flex-column flex-sm-row">
                        <a class="btn mobile-vertical btn-default btn-hover btn-hover-accent-mobile animate-headline" href="{{$slider->getTranslatedAttribute('button_link',config('app.locale'),config('voyager.multilingual.default'))}}">
                            <span class="btn-caption">{{$slider->getTranslatedAttribute('button_name',config('app.locale'),config('voyager.multilingual.default'))}}</span>
                            <i class="ph-bold ph-squares-four"></i>
                        </a>
                    </div>
                </div>

                <div class="rotating-btn">
                    <a href="#portfolio" class="rotating-btn__link slide-down">
                        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 120 120" style="enable-background:new 0 0 120 120;" xml:space="preserve" class="animate-rotation" data-value="360">
                            <defs>
                                <path id="textPath" d="M110,59.5c0,27.6-22.4,50-50,50s-50-22.4-50-50s22.4-50,50-50S110,31.9,110,59.5z" />
                            </defs>
                            <g>
                                <use xlink:href="#textPath" fill="none"></use>
                                <text>
                                    <textPath xlink:href="#textPath">Scroll for More * Scroll for More * </textPath>
                                </text>
                            </g>
                        </svg>
                        <i class="ph-bold ph-arrow-down"></i>
                    </a>
                </div>

            </section>

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
                    <h2 class="h2__title animate-in-up">@lang('main.portfolio-info')</h2>
                </div>

                <div class="content__block grid-block">
                    <div class="container-fluid px-0 inner__gallery">
                        <div class="row gx-0" itemscope itemtype="http://schema.org/ImageGallery">
                            @foreach($galleries as $gallery)
                            <figure class="col-12 col-md-4 gallery__item grid-item animate-card-2" itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
                                <a href="{{ route('portfolio.show', $gallery->slug) }}#content" data-image="{{Voyager::image($gallery->image)}}" class="gallery__link g-images" itemprop="contentUrl" data-size="1400x1400"></a>
                                <figcaption class="gallery__descr" itemprop="caption description">
                                    <div class="card__tags d-flex flex-wrap">
                                        <a href="{{ route('portfolio.show', $gallery->slug) }}#content"><span class="rounded-tag opposite">{{$gallery->getTranslatedAttribute('title',config('app.locale'),config('voyager.multilingual.default'))}}</span></a>
                                    </div>
                                </figcaption>
                            </figure>
                            @endforeach
                        </div>
                    </div>
                </div>

            </section>

            <section id="about" class="inner about">
                <div class="content__block section-grid-title">
                    <p class="h2__subtitle animate-in-up">
                        <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="13px" height="13px" viewBox="0 0 13 13" fill="currentColor">
                            <path fill="currentColor" d="M5.6,12.6c-0.5-0.8-0.7-2.4-1.7-3.5c-1-1-2.7-1.2-3.5-1.7C-0.1,7-0.1,6,0.4,5.6c0.8-0.5,2.3-0.6,3.5-1.8
                  C5,2.8,5.1,1.2,5.6,0.4C6-0.1,7-0.1,7.4,0.4c0.5,0.8,0.7,2.4,1.8,3.5c1.2,1.2,2.6,1.2,3.5,1.7c0.6,0.4,0.6,1.4,0,1.7
                  C11.8,7.9,10.2,8,9.1,9.1c-1,1-1.2,2.7-1.7,3.5C7,13.1,6,13.1,5.6,12.6z" />
                        </svg>
                        <span>{{$about_us->getTranslatedAttribute('title',config('app.locale'),config('voyager.multilingual.default'))}}</span>
                    </p>
                    <h2 class="h2__title animate-in-up">{{$about_us->getTranslatedAttribute('info_title',config('app.locale'),config('voyager.multilingual.default'))}} </h2>
                </div>

                <div class="content__block grid-block">
                    <div class="achievements d-flex flex-column flex-md-row align-items-md-stretch">
                        <div class="achievements__item d-flex flex-column grid-item animate-card-3">
                            <div class="achievements__card">
                                <p class="achievements__number">{{ $about_us->descr_one }}+</p>
                                <p class="achievements__descr">{{$about_us->getTranslatedAttribute('info_one',config('app.locale'),config('voyager.multilingual.default'))}}</p>
                            </div>
                        </div>
                        <div class="achievements__item d-flex flex-column grid-item animate-card-3">
                            <div class="achievements__card">
                                <p class="achievements__number">{{ $about_us->descr_two }}+</p>
                                <p class="achievements__descr">{{$about_us->getTranslatedAttribute('info_two',config('app.locale'),config('voyager.multilingual.default'))}}</p>
                            </div>
                        </div>
                        <div class="achievements__item d-flex flex-column grid-item animate-card-3">
                            <div class="achievements__card">
                                <p class="achievements__number">{{ $about_us->descr_three }}+</p>
                                <p class="achievements__descr">{{$about_us->getTranslatedAttribute('info_three',config('app.locale'),config('voyager.multilingual.default'))}}</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="content__block grid-block block-large">
                    <div class="container-fluid p-0">
                        <div class="row g-0 justify-content-between">

                            <div class="col-12 col-xl-8 grid-item about-descr">
                                <p class="about-descr__text animate-in-up">
                                    {!! $about_us->getTranslatedAttribute('info',config('app.locale'),config('voyager.multilingual.default')) !!}
                                </p>
                                <p class="about-descr__text animate-in-up">
                                    {!! $about_us->getTranslatedAttribute('body',config('app.locale'),config('voyager.multilingual.default')) !!}
                                </p>
                            </div>

                            <div class="col-12 col-xl-4 grid-item about-info">
                                <div class="about-info__item animate-in-up">
                                    <h6>
                                        <small class="top">@lang('main.phone')</small>
                                        <a class="text-link-bold" href="tel:{{ $header_contacts->phone }}">{{ $header_contacts->phone }}</a>
                                    </h6>
                                </div>
                                <div class="about-info__item animate-in-up">
                                    <h6>
                                        <small class="top">@lang('main.email')</small>
                                        <a class="text-link-bold" href="mailto:{{ $header_contacts->email }}">{{ $header_contacts->email }}</a>
                                    </h6>
                                </div>
                                <div class="about-info__item animate-in-up">
                                    <h6>
                                        <small class="top">@lang('main.address')</small>
                                        <a class="text-link-bold" href="#" target="_blank">{{$header_contacts->getTranslatedAttribute('address',config('app.locale'),config('voyager.multilingual.default'))}}</a>
                                    </h6>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="content__block grid-block">
                    <div class="container-fluid p-0">
                        <div class="row g-0 align-items-stretch cards">
                            <div class="col-12 col-md-6 cards__item grid-item animate-card-2">
                                <div class="cards__card d-flex flex-column">
                                    <div class="cards__descr">
                                        <a href="{{ route('reservation') }}#reserv">
                                        <h4 class="cards__title animate-in-up">{{$slider->getTranslatedAttribute('part_title_one',config('app.locale'),config('voyager.multilingual.default'))}}</h4>
                                        <div class="cards__tags d-flex flex-wrap animate-in-up">
                                            <span class="rounded-tag tag-outline">{{$slider->getTranslatedAttribute('part_min_info_one',config('app.locale'),config('voyager.multilingual.default'))}}</span>
                                        </div>
                                        <p class="small cards__text animate-in-up">{{$slider->getTranslatedAttribute('part_info_one',config('app.locale'),config('voyager.multilingual.default'))}}</p>
                                        </a>
                                    </div>
                                    <div class="cards__image d-flex animate-in-up">
                                        <a href="{{ route('reservation') }}#reserv">
                                            <img src="{{ Voyager::image($slider->part_image_one) }}" alt="@lang('main.photo-studio')">
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-6 cards__item grid-item animate-card-2">
                                <div class="cards__card d-flex flex-column">
                                    <div class="cards__descr">
                                        <a href="{{ route('reservation') }}#reserv">
                                        <h4 class="cards__title animate-in-up">{{$slider->getTranslatedAttribute('part_title_two',config('app.locale'),config('voyager.multilingual.default'))}}</h4>
                                        <div class="cards__tags d-flex flex-wrap animate-in-up">
                                            <span class="rounded-tag tag-outline">{{$slider->getTranslatedAttribute('part_min_info_two',config('app.locale'),config('voyager.multilingual.default'))}}</span>
                                        </div>
                                        <p class="small cards__text animate-in-up">{{$slider->getTranslatedAttribute('part_info_two',config('app.locale'),config('voyager.multilingual.default'))}}</p>
                                        </a>
                                    </div>
                                    <div class="cards__image d-flex animate-in-up">
                                        <a href="{{ route('reservation') }}#reserv">
                                            <img src="{{ Voyager::image($slider->part_image_two) }}" alt="@lang('main.photo-studio')">
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section id="resume" class="inner resume">
                <div class="content__block section-title">
                    <p class="h2__subtitle animate-in-up">
                        <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="13px" height="13px" viewBox="0 0 13 13" fill="currentColor">
                            <path fill="currentColor" d="M5.6,12.6c-0.5-0.8-0.7-2.4-1.7-3.5c-1-1-2.7-1.2-3.5-1.7C-0.1,7-0.1,6,0.4,5.6c0.8-0.5,2.3-0.6,3.5-1.8
                  C5,2.8,5.1,1.2,5.6,0.4C6-0.1,7-0.1,7.4,0.4c0.5,0.8,0.7,2.4,1.8,3.5c1.2,1.2,2.6,1.2,3.5,1.7c0.6,0.4,0.6,1.4,0,1.7
                  C11.8,7.9,10.2,8,9.1,9.1c-1,1-1.2,2.7-1.7,3.5C7,13.1,6,13.1,5.6,12.6z" />
                        </svg>
                        <span>@lang('main.reviews-title')</span>
                    </p>
                    <h2 class="h2__title animate-in-up">@lang('main.reviews-info')</h2>
                </div>

                <div class="content__block">
                    <div class="testimonials-slider">
                        <div class="swiper-testimonials">
                            <div class="swiper-wrapper">
                                @foreach($reviews as $review)
                                <div class="swiper-slide">
                                    <div class="testimonials-card animate-in-up">
                                        <div class="testimonials-card__tauthor d-flex animate-in-up">
                                            <div class="tauthor__avatar">
                                                @if($review->image != null)
                                                <img src="{{ Voyager::image($review->image) }}" alt="Review">
                                                @else
                                                <img src="/xweb/img/user.png" alt="Review">
                                                @endif
                                            </div>
                                            <div class="tauthor__info d-flex flex-column justify-content-center">
                                                <p class="tauthor__name">{{$review->getTranslatedAttribute('name',config('app.locale'),config('voyager.multilingual.default'))}}</p>
                                                <div class="tauthor__rating d-flex">
                                                    <i class="ph-fill ph-star"></i>
                                                    <i class="ph-fill ph-star"></i>
                                                    <i class="ph-fill ph-star"></i>
                                                    <i class="ph-fill ph-star"></i>
                                                    <i class="ph-fill ph-star"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="testimonials-card__descr animate-in-up">
                                            <p>{{$review->getTranslatedAttribute('review',config('app.locale'),config('voyager.multilingual.default'))}}</p>
                                        </div>
                                        @if($review->link != null)
                                        <div class="testimonials-card__btnholder animate-in-up">
                                            <a class="btn mobile-vertical btn-line btn-transparent slide-right" href="{{$review->getTranslatedAttribute('link',config('app.locale'),config('voyager.multilingual.default'))}}">
                                                <span class="btn-caption">@lang('main.view-images')</span>
                                                <i class="ph-bold ph-arrow-right"></i>
                                            </a>
                                        </div>
                                        @endif
                                    </div>
                                </div>
                                @endforeach
                            </div>
                            <div class="swiper-button-prev mxd-slider-btn-square mxd-slider-btn-square-prev animate-in-up">
                                <a class="btn btn-square btn-square-s btn-outline slide-left" href="#0">
                                    <i class="ph-bold ph-caret-left"></i>
                                </a>
                            </div>
                            <div class="swiper-button-next mxd-slider-btn-square mxd-slider-btn-square-next animate-in-up">
                                <a class="btn btn-square btn-square-s btn-outline slide-right" href="#0">
                                    <i class="ph-bold ph-caret-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section id="reservation" class="inner contact">

                <div class="content__block block-large">
                    <p class="h2__subtitle animate-in-up">
                        <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="13px" height="13px" viewBox="0 0 13 13" fill="currentColor">
                            <path fill="currentColor" d="M5.6,12.6c-0.5-0.8-0.7-2.4-1.7-3.5c-1-1-2.7-1.2-3.5-1.7C-0.1,7-0.1,6,0.4,5.6c0.8-0.5,2.3-0.6,3.5-1.8
                  C5,2.8,5.1,1.2,5.6,0.4C6-0.1,7-0.1,7.4,0.4c0.5,0.8,0.7,2.4,1.8,3.5c1.2,1.2,2.6,1.2,3.5,1.7c0.6,0.4,0.6,1.4,0,1.7
                  C11.8,7.9,10.2,8,9.1,9.1c-1,1-1.2,2.7-1.7,3.5C7,13.1,6,13.1,5.6,12.6z" />
                        </svg>
                        <span>@lang('main.reservation')</span>
                    </p>
                    <h2 class="h2__title animate-in-up">{{$about_us->getTranslatedAttribute('part_one',config('app.locale'),config('voyager.multilingual.default'))}}</h2>
                    <p class="h2__text animate-in-up">
                        {{$about_us->getTranslatedAttribute('part_two',config('app.locale'),config('voyager.multilingual.default'))}}
                    </p>
                    <p class="h2__text animate-in-up">
                        {{$about_us->getTranslatedAttribute('part_three',config('app.locale'),config('voyager.multilingual.default'))}}
                    </p>

                     <div class="headline__btnholder d-flex flex-column flex-sm-row">
                        <a class="btn mobile-vertical btn-default btn-hover btn-hover-accent-mobile animate-headline" href="{{ route('reservation') }}" style="translate: none; rotate: none; scale: none; opacity: 1; transform: translate(0px, 0px);">
                            <span class="btn-caption">@lang('main.photo-shoot')</span>
                            <i class="ph-bold ph-squares-four"></i>
                        </a>
                    </div>
                </div>

                 <div class="content__block">
                    <div class="teaser">
                        <p class="teaser__text animate-in-up">
                            {{$about_us->getTranslatedAttribute('part_four',config('app.locale'),config('voyager.multilingual.default'))}}
                        </p>
                    </div>
                </div>
            </section>
        </div>
    </div>
@endsection
