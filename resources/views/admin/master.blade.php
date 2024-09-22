<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="description" content="{{showMetaDescription()}}">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <!-- gLightbox gallery-->
    <link rel="stylesheet" href="{{asset('/glightbox/css/glightbox.min.css')}}">
    <!-- Range slider-->
    <link rel="stylesheet" href="{{asset('/nouislider/nouislider.min.css')}}">
    <!-- Choices CSS-->
    <link rel="stylesheet" href="{{asset('/choices.js/public/assets/styles/choices.min.css')}}">
    <!-- Swiper slider -->
    <link rel="stylesheet" href="{{asset('/swiper/swiper-bundle.min.css')}}">
    <!-- Google fonts-->
    <link href='https://fonts.googleapis.com/css?family=Nunito Sans' rel='stylesheet'>
    <!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Libre+Franklin:wght@300;400;700&amp;display=swap"> -->
    <!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Martel+Sans:wght@300;400;800&amp;display=swap"> -->
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="{{asset('/css/style.default.css')}}" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <!-- <link rel="stylesheet" href="{{asset('/css/custom.css')}}"> -->
    <!-- Favicon-->
    <link rel="shortcut icon" href="{{ showFavicon()  }}">



    <!-- Bootstrap CSS -->
    <link href="{{asset('/bootstrap.5.2/css/bootstrap.min.css')}}" rel="stylesheet">
    <link href="{{asset('css/notifications.css')}}" rel="stylesheet">


    <!-- FontAwesome -->

    <link href="{{asset('/fontawesome-6.4.0/css/fontawesome.css')}}" rel="stylesheet">
    <link href="{{asset('/fontawesome-6.4.0/css/brands.css')}}" rel="stylesheet">
    <link href="{{asset('/fontawesome-6.4.0/css/solid.css')}}" rel="stylesheet">
    <link href="{{asset('css/custom.css')}}" rel="stylesheet">


 
    <script src="{{asset('/jquery-3.7.0/jquery-3.7.0.min.js')}}" crossorigin="anonymous"></script>
 

    <!-- For Dashboard Templates -->
    <link rel="stylesheet" href="{{asset('/css/simplebar.css')}}">
    <link href="{{asset('/css/style.admin.css')}}" rel="stylesheet">


    @yield('extraCss')
    <title>{{showSiteTitle()}} | @yield('headTitle')</title>
    <style>
body {
    font-family: 'Nunito Sans';
}
</style>
</head>

<body>
@include('admin.partials.sidebar')
        
<div class="wrapper d-flex flex-column min-vh-100 bg-light">
 @include('admin.partials.menu')
      
            @yield("bodyContent")
</div>

        @include('admin.partials.footer')

  

    <script src="{{asset('/bootstrap.5.2/js/bootstrap.bundle.min.js')}}" crossorigin="anonymous"></script>

    <script src="{{asset('/glightbox/js/glightbox.min.js')}}"></script>
      <script src="{{asset('/nouislider/nouislider.min.js')}}"></script>
      <script src="{{asset('/swiper/swiper-bundle.min.js')}}"></script>
      <script src="{{asset('/choices.js/public/assets/scripts/choices.min.js')}}"></script>
      <script src="{{asset('/js/front.js')}}"></script>
      <script src="{{asset('/js/common.js')}}" crossorigin="anonymous"></script>

       <!-- Dashbord  necessary plugins-->
    <script src="{{asset('/js/coreui.bundle.min.js')}}" crossorigin="anonymous"></script>
    <script src="{{asset('/js/simplebar.min.js')}}" crossorigin="anonymous"></script>
   

    @yield('additionolJs')

</body>

</html>