@extends('layouts.front')

@section('content')
    <div id="content" class="content">
        <div class="content__wrapper">
         <section id="contact" class="inner contact">

                <div class="content__block block-large">
                    <p class="h2__subtitle animate-in-up">
                        <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="13px" height="13px" viewBox="0 0 13 13" fill="currentColor">
                            <path fill="currentColor" d="M5.6,12.6c-0.5-0.8-0.7-2.4-1.7-3.5c-1-1-2.7-1.2-3.5-1.7C-0.1,7-0.1,6,0.4,5.6c0.8-0.5,2.3-0.6,3.5-1.8
                  C5,2.8,5.1,1.2,5.6,0.4C6-0.1,7-0.1,7.4,0.4c0.5,0.8,0.7,2.4,1.8,3.5c1.2,1.2,2.6,1.2,3.5,1.7c0.6,0.4,0.6,1.4,0,1.7
                  C11.8,7.9,10.2,8,9.1,9.1c-1,1-1.2,2.7-1.7,3.5C7,13.1,6,13.1,5.6,12.6z" />
                        </svg>
                        <span>@lang('main.reservation')</span>
                    </p>
                    <p class="h2__text animate-in-up">
                        {{$about_us->getTranslatedAttribute('part_two',config('app.locale'),config('voyager.multilingual.default'))}}
                    </p>
                    <p class="h2__text animate-in-up">
                        {{$about_us->getTranslatedAttribute('part_title',config('app.locale'),config('voyager.multilingual.default'))}}
                    </p>
                </div>

                <div class="content__block grid-block block-grid-large">
                    <div class="form-container">

                        <div class="form__reply centered text-center">
                            <i class="ph-bold ph-smiley reply__icon"></i>
                            <p class="reply__title">Done!</p>
                            <span class="reply__text">Thanks for your message. I'll get back as soon as possible.</span>
                        </div>

                       <form class="form contact-form" action="{{ route('reserv') }}" id="contacts-form" method="post">
                            @csrf
                            <div class="content__block grid-block">
                                <p class="h2__subtitle animate-in-up" id="dropdown-toggle-photos" style="cursor: pointer;">
                                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="13px" height="13px" viewBox="0 0 13 13" fill="currentColor">
                                        <path fill="currentColor" d="M5.6,12.6c-0.5-0.8-0.7-2.4-1.7-3.5c-1-1-2.7-1.2-3.5-1.7C-0.1,7-0.1,6,0.4,5.6c0.8-0.5,2.3-0.6,3.5-1.8
                                        C5,2.8,5.1,1.2,5.6,0.4C6-0.1,7-0.1,7.4,0.4c0.5,0.8,0.7,2.4,1.8,3.5c1.2,1.2,2.6,1.2,3.5,1.7c0.6,0.4,0.6,1.4,0,1.7
                                        C11.8,7.9,10.2,8,9.1,9.1c-1,1-1.2,2.7-1.7,3.5C7,13.1,6,13.1,5.6,12.6z"></path>
                                    </svg>
                                    <span>@lang('main.choose-photo-zone')</span>
                                    <span id="dropdown-icon-photos" class="dropdown-icon">&#9650;</span>
                                </p>
                                <div class="container-fluid px-0 inner__gallery" id="dropdown-content-photos">
                                    <div class="row gx-0">
                                        @foreach($photozonas as $photozona)
                                        <figure class="col-12 col-md-3 gallery__item grid-item mt-3 animate-card-2">
                                            <input type="checkbox" name="selected_photos[photozone][]" value="{{ $photozona->id }}" id="photo-{{ $photozona->id }}" class="gallery__checkbox">
                                            <label for="photo-{{ $photozona->id }}" class="gallery__label">
                                                <img src="{{Voyager::image($photozona->photo)}}" class="gallery__link r-images">
                                            </label>
                                        </figure>
                                        @endforeach
                                    </div>
                                </div>
                            </div>

                            <div class="content__block grid-block mt-40">
                                <p class="h2__subtitle animate-in-up" id="dropdown-toggle-accessories" style="cursor: pointer;">
                                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="13px" height="13px" viewBox="0 0 13 13" fill="currentColor">
                                        <path fill="currentColor" d="M5.6,12.6c-0.5-0.8-0.7-2.4-1.7-3.5c-1-1-2.7-1.2-3.5-1.7C-0.1,7-0.1,6,0.4,5.6c0.8-0.5,2.3-0.6,3.5-1.8
                                        C5,2.8,5.1,1.2,5.6,0.4C6-0.1,7-0.1,7.4,0.4c0.5,0.8,0.7,2.4,1.8,3.5c1.2,1.2,2.6,1.2,3.5,1.7c0.6,0.4,0.6,1.4,0,1.7
                                        C11.8,7.9,10.2,8,9.1,9.1c-1,1-1.2,2.7-1.7,3.5C7,13.1,6,13.1,5.6,12.6z"></path>
                                    </svg>
                                    <span>@lang('main.choose-accessories')</span>
                                    <span id="dropdown-icon-accessories" class="dropdown-icon">&#9650;</span>
                                </p>
                                <div class="container-fluid px-0 inner__gallery" id="dropdown-content-accessories">
                                    <div class="row gx-0">
                                        @foreach($accessories as $accessory)
                                        <figure class="col-12 col-md-3 gallery__item grid-item mt-3 animate-card-2">
                                            <input type="checkbox" name="selected_photos[accessory][]" value="{{ $accessory->id }}" id="accessory-{{ $accessory->id }}" class="gallery__checkbox">
                                            <label for="accessory-{{ $accessory->id }}" class="gallery__label">
                                                <img src="{{Voyager::image($accessory->photo)}}" class="gallery__link r-images">
                                            </label>
                                        </figure>
                                        @endforeach
                                    </div>
                                </div>
                            </div>

                            <div class="content__block grid-block mt-40">
                                <p class="h2__subtitle animate-in-up" id="dropdown-toggle-clothes" style="cursor: pointer;">
                                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="13px" height="13px" viewBox="0 0 13 13" fill="currentColor">
                                        <path fill="currentColor" d="M5.6,12.6c-0.5-0.8-0.7-2.4-1.7-3.5c-1-1-2.7-1.2-3.5-1.7C-0.1,7-0.1,6,0.4,5.6c0.8-0.5,2.3-0.6,3.5-1.8
                                        C5,2.8,5.1,1.2,5.6,0.4C6-0.1,7-0.1,7.4,0.4c0.5,0.8,0.7,2.4,1.8,3.5c1.2,1.2,2.6,1.2,3.5,1.7c0.6,0.4,0.6,1.4,0,1.7
                                        C11.8,7.9,10.2,8,9.1,9.1c-1,1-1.2,2.7-1.7,3.5C7,13.1,6,13.1,5.6,12.6z"></path>
                                    </svg>
                                    <span>@lang('main.choose-clothes')</span>
                                    <span id="dropdown-icon-clothes" class="dropdown-icon">&#9650;</span>
                                </p>
                                <div class="container-fluid px-0 inner__gallery" id="dropdown-content-clothes">
                                    <div class="row gx-0">
                                        @foreach($clothes as $clothe)
                                        <figure class="col-12 col-md-3 gallery__item grid-item mt-3 animate-card-2">
                                            <input type="checkbox" name="selected_photos[clothe][]" value="{{ $clothe->id }}" id="clothe-{{ $clothe->id }}" class="gallery__checkbox">
                                            <label for="clothe-{{ $clothe->id }}" class="gallery__label">
                                                <img src="{{Voyager::image($clothe->photo)}}" class="gallery__link r-images">
                                            </label>
                                        </figure>
                                        @endforeach
                                    </div>
                                </div>
                            </div>

                            <div class="container-fluid p-0 mt-40">
                                <div class="row gx-0">
                                    <div class="col-12 col-md-6 form__item animate-in-up">
                                        <input type="text" name="name" placeholder="@lang('main.name')*" required>
                                    </div>
                                    <div class="col-12 col-md-6 form__item animate-in-up">
                                        <input type="tel" name="phone" placeholder="@lang('main.phone')*" required>
                                    </div>
                                    <div class="col-12 col-md-6 form__item animate-in-up">
                                        <input type="text" name="address" placeholder="@lang('main.address')" required>
                                    </div>
                                    <div class="col-12 col-md-6 form__item animate-in-up">
                                        <input type="datetime-local" name="date" placeholder="Օր / Ժամ" required>
                                    </div>
                                    <div class="col-12 form__item animate-in-up">
                                        <textarea name="message" placeholder="@lang('main.օther-notes')" required></textarea>
                                    </div>
                                    <div class="col-12 form__item animate-in-up">
                                        <button class="btn btn-default btn-hover btn-hover-accent" type="submit">
                                            <span class="btn-caption">@lang('main.make-request')</span>
                                            <i class="ph-bold ph-paper-plane-tilt"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>

            </section>
        </div>
    </div>
@endsection
