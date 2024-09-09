@php
function activeMenu($uri = '')
{
    $active = '';
    if (Request::is(Request::segment(1) . '/' . $uri . '/*') || Request::is(Request::segment(1) . '/' . $uri) || Request::is($uri)) {
        $active = 'current';
    }
    return $active;
}
@endphp

    {{-- <div id="loader" class="loader">
        <div id="loaderContent" class="loader__content">
            <div class="loader__shadow"></div>
            <div class="loader__box"></div>
        </div>
    </div> --}}

    <header id="header" class="header d-flex justify-content-between">
        <div class="header__navigation">
            <nav id="menu" class="menu">
                <ul class="menu__list d-flex justify-content-start">
                    <li class="menu__item">
                        <a class="menu__link btn" @if(Route::currentRouteName() == null) href="#home" @else href="/{{config('app.locale')}}" @endif>
                            <span class="menu__caption">@lang('main.home')</span>
                            <i class="ph-bold ph-house-simple"></i>
                        </a>
                    </li>
                    <li class="menu__item">
                        <a class="menu__link btn" href="{{ route('portfolio') }}">
                            <span class="menu__caption">@lang('main.portfolio')</span>
                            <i class="ph-bold ph-squares-four"></i>
                        </a>
                    </li>
                    <li class="menu__item">
                        <a class="menu__link btn" @if(Route::currentRouteName() == null) href="#about" @else  href="/{{config('app.locale')}}#about" @endif>
                            <span class="menu__caption">@lang('main.about-us')</span>
                            <i class="ph-bold ph-user"></i>
                        </a>
                    </li>
                    {{-- <li class="menu__item">
                        <a class="menu__link btn" href="#resume">
                            <span class="menu__caption">Resume</span>
                            <i class="ph-bold ph-article"></i>
                        </a>
                    </li> --}}
                    <li class="menu__item">
                        <a class="menu__link btn" @if(Route::currentRouteName() == null) href="#reservation" @else  href="/{{config('app.locale')}}#reservation" @endif>
                            <span class="menu__caption">@lang('main.reservation')</span>
                            <i class="ph-bold ph-envelope"></i>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="header__controls d-flex justify-content-end">
            <button id="color-switcher" class="color-switcher header__switcher btn" type="button" role="switch" aria-label="light/dark mode" aria-checked="true"></button>

            @foreach($languages as $language)
                <a href="/{{$language->iso}}{{$set_lang}}">
                    @if(strtoupper($language->iso) == 'HY')
                    <img src="/xweb/img/hy.png" class="m-hold-img-lang">
                    @elseif(strtoupper($language->iso) == 'RU')
                    <img src="/xweb/img/ru.png" class="m-hold-img-lang">
                    @elseif(strtoupper($language->iso) == 'EN')
                    <img src="/xweb/img/en.png" class="m-hold-img-lang">
                    @endif
                </a>
            @endforeach
        </div>
    </header>


    <div class="gradient-background">
        <div class="blur"></div>
        <div class="blur"></div>
        <div class="blur"></div>
    </div>

    <div id="avatar" class="avatar">
        <div class="avatar__container d-flex flex-column justify-content-lg-between">

            <div class="avatar__block">
                <div class="avatar__logo d-flex align-items-center">
                    <a @if(Route::currentRouteName() == null) href="#home" @else href="/{{config('app.locale')}}" @endif>
                    <div class="logo__image">
                        <!-- Your Logo Here!!! -->
                        <!--<img src="{{ asset('xweb') }}/img/logo.svg" alt="Braxton - Personal Portfolio & Resume HTML Template Logo">-->
                        <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="85px" height="85px" viewBox="0 0 85 85" style="enable-background:new 0 0 85 85;" xml:space="preserve" class="gradient-fill">
                            <style type="text/css">
                                .gradient-fill {
                                    fill: url(#gradientFill);
                                }

                            </style>
                            <g>
                                <linearGradient id="gradientFill" gradientUnits="userSpaceOnUse" x1="9.9604" y1="75.0338" x2="75.0387" y2="9.9555">
                                    <stop offset="0" style="stop-color:var(--accent)" />
                                    <stop offset="1" style="stop-color:var(--secondary)" />
                                </linearGradient>
                                <path class="gradient-fill" d="M51,0H34C15.2,0,0,15.2,0,34v17c0,14.3,8.9,26.6,21.4,31.6c0,0,0,0,0,0l0,0C25.3,84.1,29.5,85,34,85h17
                    c6,0,11.7-1.6,16.6-4.3c0.1-0.1,0.2-0.1,0.3-0.2C78.1,74.6,85,63.6,85,51V34C85,15.2,69.8,0,51,0z M83,51c0,10.7-5.3,20.2-13.4,26
                    v-2.5v-3.9h3.9v-3.9h-3.9v-3.9h3.9v-3.9h-3.9H67v-3.9V51h-3.9v3.9v3.9h2.6v3.9v3.9v3.9h-3.9h-3.9v3.9h3.9h3.9v3.9v1
                    C61.3,81.7,56.3,83,51,83H34c-4.5,0-8.7-0.9-12.6-2.6v-2v-3.9h3.9h3.9v-3.9h-3.9h-3.9v-3.9v-3.9v-3.9H24v-3.9V51h-3.9v3.9v3.9h-2.6
                    h-3.9v3.9h3.9v3.9h-3.9v3.9h3.9v3.9v3.9C8.2,72.8,2,62.6,2,51V34C2,16.4,16.4,2,34,2h17c17.6,0,32,14.4,32,32V51z M50.1,54.9H54
                    v3.9v3.9h-3.9v-3.9V54.9z M33.1,54.9H37v3.9v3.9h-3.9v-3.9V54.9z M27.9,51H24v-3.9v-3.9v-3.9h3.9v3.9v3.9V51z M31.8,39.3h-3.9v-3.9
                    h3.9V39.3z M31.8,43.2v-3.9h3.9v3.9H31.8z M63.1,47.1V51h-3.9v-3.9v-3.9v-3.9h3.9v3.9V47.1z M35.7,47.1v-3.9h3.9h3.9h3.9h3.9v3.9
                    h-3.9h-3.9h-3.9H35.7z M59.2,39.3h-3.9v-3.9h3.9V39.3z M55.3,43.2h-3.9v-3.9h3.9V43.2z" />
                            </g>
                        </svg>
                    </div> </a>
                    <div class="logo__caption">
                        <a @if(Route::currentRouteName() == null) href="#home" @else href="/{{config('app.locale')}}" @endif><p>KarAdel</p></a>
                    </div>
                </div>
                <div class="avatar__image">
                    <img src="{{ asset('xweb') }}/img/avatars/1024x1024_a02.webp" alt="Braxton - Personal Portfolio & Resume HTML Template Avatar">
                </div>
            </div>

            <div class="avatar__block ">
                <h6>
                    <small class="top">@lang('main.phone')</small>
                    {{ $header_contacts->phone }}
                </h6>
            </div>

            <div class="avatar__block">
                <h6>
                    <small class="top">@lang('main.email')</small>
                    {{ $header_contacts->email }}
                </h6>
            </div>

            <div class="avatar__block">
                <h6>
                    <small class="top">@lang('main.address')</small>
                    {{$header_contacts->getTranslatedAttribute('address',config('app.locale'),config('voyager.multilingual.default'))}}
                </h6>
            </div>

            <div class="avatar__block">
                <div class="avatar__socials">
                    <ul class="socials-square d-flex justify-content-between">
                        <li class="socials-square__item">
                            <a class="socials-square__link btn" href="{{$header_contacts->instagram_link}}" target="_blank"><i class="ph-bold ph-instagram-logo"></i></a>
                        </li>
                        <li class="socials-square__item">
                            <a class="socials-square__link btn" href="{{$header_contacts->fb_link}}" target="_blank"><i class="ph-bold ph-facebook-logo"></i></a>
                        </li>
                        <li class="socials-square__item">
                            <a class="socials-square__link btn" href="{{$header_contacts->tiktok_link}}" target="_blank"><i class="ph-bold ph-tiktok-logo"></i></a>
                        </li>
                        <li class="socials-square__item">
                            <a class="socials-square__link btn" href="#" target="_blank"><i class="ph-bold ph-youtube-logo"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="avatar__btnholder">
                    <a class="btn btn-default btn-fullwidth btn-hover btn-hover-accent fs-16" href="{{ route('reservation') }}">
                        <span class="btn-caption">@lang('main.photo-shoot')</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
