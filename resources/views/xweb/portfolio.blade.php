@extends('layouts.front')

@section('content')
{{-- <section class="project-section pt_60 pb_60 centred">
    <div class="auto-container">
        <div class="sortable-masonry">
            <div class="filters centred mb_60 d-none">
                <ul class="filter-tabs filter-btns clearfix">
                    <li class="active filter" data-role="button" data-filter=".all">All Works</li>
                </ul>
            </div>
            <div class="items-container row clearfix">
                @foreach($galleries as $photo)
                <div class="col-lg-4 col-md-6 col-sm-12 masonry-item small-column all">
                    <div class="project-block-one">
                        <div class="inner-box image_block_one">
                            <figure class="image-box">
                                @if($photo->image != null)
                                <img src="{{Voyager::image($photo->image)}}" alt>
                                @else
                                <img src="{{ asset('xweb') }}/images/icon-1.png" alt>
                                @endif
                                <div class="content-box ">
                                    <div class="video-box" style="display: contents;">
                                        <a href="{{$photo->youtube_link}}" class="lightbox-image" data-caption=""><i class="icon-16"></i></a>
                                    </div>
                                </div>
                            </figure>
                        </div>
                    </div>
                </div>

                @endforeach
            </div>
        </div>
    </div>
    <br>
    <div class="pagination-area">
        <div aria-label="Page navigation">
            {{$galleries->links()}}
        </div>
    </div>
</section> --}}

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
                    <h2 class="h2__title animate-in-up">@lang('main.portfolio-info')</h2>
                </div>

                <div class="content__block grid-block">
                    <div class="container-fluid px-0 inner__gallery">
                        <div class="row gx-0" itemscope itemtype="http://schema.org/ImageGallery">
                            @foreach($galleries as $gallery)
                            <figure class="col-12 col-md-4 gallery__item grid-item animate-card-2" itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
                                <a href="{{ route('portfolio.show', $gallery->slug) }}" data-image="{{Voyager::image($gallery->image)}}" class="gallery__link g-images" itemprop="contentUrl" data-size="1400x1400"></a>
                                <figcaption class="gallery__descr" itemprop="caption description">
                                    <div class="card__tags d-flex flex-wrap">
                                        <a href="{{ route('portfolio.show', $gallery->slug) }}"><span class="rounded-tag opposite">{{$gallery->getTranslatedAttribute('title',config('app.locale'),config('voyager.multilingual.default'))}}</span></a>
                                    </div>
                                </figcaption>
                            </figure>
                            @endforeach
                        </div>
                        <div class="pagination-area">
                            <div aria-label="Page navigation">
                                {{$galleries->links()}}
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
@endsection
