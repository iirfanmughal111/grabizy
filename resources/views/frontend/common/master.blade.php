<!doctype html >
<html lang="en" style="overflow-x:hidden;">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!-- gLightbox gallery
    <link rel="stylesheet" href="{{asset('/glightbox/css/glightbox.min.css')}}">-->
    <!-- Range slider
    <link rel="stylesheet" href="{{asset('/nouislider/nouislider.min.css')}}">-->
    <!-- Choices CSS
    <link rel="stylesheet" href="{{asset('/choices.js/public/assets/styles/choices.min.css')}}">-->
    <!-- Swiper slider
    <link rel="stylesheet" href="{{asset('/swiper/swiper-bundle.min.css')}}">-->
    <!-- Google fonts-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Libre+Franklin:wght@300;400;700&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Martel+Sans:wght@300;400;800&amp;display=swap">
    <!-- theme stylesheet
    <link rel="stylesheet" href="{{asset('/css/style.default.css')}}" id="theme-stylesheet">-->
    <link rel="stylesheet" href="{{asset('/css/frontend/style.css')}}" id="theme-stylesheet">
    <link rel="stylesheet" href="{{asset('/css/frontend/responsive.css')}}" id="theme-stylesheet">


    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="{{asset('/css/frontend/custom.css').'?v='.time()}}">
    <!-- Favicon-->
    <link rel="shortcut icon" href="{{ showFavicon()  }}">


    <!-- Bootstrap CSS -->
    <!-- <link href="{{asset('/bootstrap.5.2/css/bootstrap.min.css')}}" rel="stylesheet"> -->
    <link href="{{asset('/bootstrap.4.1/bootstrap.min.css')}}" rel="stylesheet">


    <!-- FontAwesome -->

    <link href="{{asset('/fontawesome-6.4.0/css/fontawesome.css')}}" rel="stylesheet">
    <link href="{{asset('/fontawesome-6.4.0/css/brands.css')}}" rel="stylesheet">
    <link href="{{asset('/fontawesome-6.4.0/css/solid.css')}}" rel="stylesheet">

    <!-- <script src="{{asset('/jquery-3.7.0/jquery-3.7.0.min.js')}}" crossorigin="anonymous"></script> -->
    <link href="{{asset('css/notifications.css')}}?v=time()" rel="stylesheet">

    @yield('additionolCss')
    <title>{{showSiteTitle()}} | @yield('headTitle')</title>
</head>

<body>

        @include('frontend.partials.header')
        @yield("dashBoardBodyContent")
        <div class="container-fluid p-0">
            @yield("bodyContent")
        </div>
        @include('frontend.partials.footer')
    

        <script src="{{asset('/js/frontend/jquery-3.2.1.min.js')}}"></script>
    <script src="{{asset('/js/frontend/popper.min.js')}}"></script>
    <script src="{{asset('/js/frontend/bootstrap.min.js')}}"></script>
    <!-- ALL PLUGINS -->
    <script src="{{asset('/js/frontend/jquery.superslides.min.js')}}"></script>
    <script src="{{asset('/js/frontend/bootstrap-select.js')}}"></script>
    <script src="{{asset('/js/frontend/inewsticker.js')}}"></script>
    <script src="{{asset('/js/frontend/bootsnav.js')}}"></script>
    <script src="{{asset('/js/frontend/images-loded.min.js')}}"></script>
    <script src="{{asset('/js/frontend/isotope.min.js')}}"></script>
    <script src="{{asset('/js/frontend/owl.carousel.min.js')}}"></script>
    <script src="{{asset('/js/frontend/baguetteBox.min.js')}}"></script>
    <script src="{{asset('/js/frontend/form-validator.min.js')}}"></script>
    <script src="{{asset('/js/frontend/contact-form-script.js')}}"></script>
    <script src="{{asset('/js/frontend/custom.js')}}"></script>
    <script src="{{asset('/js/common.js')}}"></script>


  
    @yield('additionolJs')
<div  id="notification"></div>
</body>

</html>