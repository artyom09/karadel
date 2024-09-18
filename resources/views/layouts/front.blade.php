<!DOCTYPE html>
<html lang="{{config('app.locale')}}">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="icon" type="image/png" href="{{Voyager::image(setting('site.logo'))}}">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ setting('site.title') }}</title>

    <!-- CSS -->
    <link rel="stylesheet" href="{{ asset('xweb') }}/css/loaders/loader.css">
    <link rel="stylesheet" type="text/css" href="{{ asset('xweb') }}/css/plugins.css">
    <link rel="stylesheet" type="text/css" href="{{ asset('xweb') }}/css/main.css?v1">

   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.19/dist/sweetalert2.all.min.js"></script>

    <link rel="apple-touch-icon" href="{{Voyager::image(setting('site.logo'))}}">
    {{--<link rel="icon" href="img/favicon/favicon.ico" sizes="any">
    <link rel="icon" href="img/favicon/icon.svg" type="image/svg+xml">
    <link rel="manifest" href="img/favicon/manifest.webmanifest"> --}}

    <meta name="msapplication-TileColor" content="#da532c">
    <meta name="theme-color" content="#ffffff">

    <!-- Meta Tags -->
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="Xholding">
    <meta property="og:image:height" content="1200">
    <meta property="og:image:width" content="1200">
    <meta property="og:title" content="KARADEL">
    <meta property="og:description" content="Karadel Photography Studio">
    <meta property="og:url" content="">
    <meta property="og:image" content="{{Voyager::image(setting('site.logo'))}}">
</head>

<body>
    @if (session('status'))
        @if(session('status') == 'success')
        <script aria-hidden="false">
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: '@lang('main.thnaks')',
                showConfirmButton: false,
                timer: 2500
            });
        </script>
        @endif
    @endif

    @include('layouts.headers.header')

    @yield('content')

    @include('layouts.footers.footer')

    <!--   Core JS Files   -->
    <script src="{{ asset('xweb') }}/js/libs.min.js"></script>
    <script>
        const randomX = random(-400, 400);
        const randomY = random(-200, 200);
        const randomDelay = random(0, 50);
        const randomTime = random(20, 40);
        const randomTime2 = random(5, 12);
        const randomAngle = random(-30, 150);

        const blurs = gsap.utils.toArray(".blur");
        blurs.forEach((blur) => {
            gsap.set(blur, {
                x: randomX(-1),
                y: randomX(1),
                rotation: randomAngle(-1)
            });

            moveX(blur, 1);
            moveY(blur, -1);
            rotate(blur, 1);
        });

        function rotate(target, direction) {
            gsap.to(target, randomTime2(), {
                rotation: randomAngle(direction),
                ease: Sine.easeInOut,
                onComplete: rotate,
                onCompleteParams: [target, direction * -1]
            });
        }

        function moveX(target, direction) {
            gsap.to(target, randomTime(), {
                x: randomX(direction),
                ease: Sine.easeInOut,
                onComplete: moveX,
                onCompleteParams: [target, direction * -1]
            });
        }

        function moveY(target, direction) {
            gsap.to(target, randomTime(), {
                y: randomY(direction),
                ease: Sine.easeInOut,
                onComplete: moveY,
                onCompleteParams: [target, direction * -1]
            });
        }

        function random(min, max) {
            const delta = max - min;
            return (direction = 1) => (min + delta * Math.random()) * direction;
        }

    </script>
    <script src="{{ asset('xweb') }}/js/app.js"></script>
    <script src="{{ asset('xweb') }}/js/ajax-form.js"></script>
    <script src="{{ asset('xweb') }}/js/gallery-init.js"></script>

</body>

</html>
