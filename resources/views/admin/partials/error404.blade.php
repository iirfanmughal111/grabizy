<!DOCTYPE html>
<html lang="en">
  <head>
    <base href="./">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <meta name="author" content="Łukasz Holeczek">
    <meta name="keyword" content="Bootstrap,Admin,Template,Open,Source,jQuery,CSS,HTML,RWD,Dashboard">
    <title>Not Found</title>
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
    <link rel="shortcut icon" href="{{public_path('/img/favicon.png')}}">


    <!-- Bootstrap CSS -->
    <link href="{{asset('/bootstrap.5.2/css/bootstrap.min.css')}}" rel="stylesheet">
    <link href="{{asset('css/notifications.css')}}" rel="stylesheet">


    <!-- FontAwesome -->

    <link href="{{asset('/fontawesome-6.4.0/css/fontawesome.css')}}" rel="stylesheet">
    <link href="{{asset('/fontawesome-6.4.0/css/brands.css')}}" rel="stylesheet">
    <link href="{{asset('/fontawesome-6.4.0/css/solid.css')}}" rel="stylesheet">
    <link href="{{asset('css/custom.css')}}" rel="stylesheet">
    <link rel="manifest" href="assets/favicon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="assets/favicon/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <!-- Vendors styles-->
    <link rel="stylesheet" href="vendors/simplebar/css/simplebar.css">
    <link rel="stylesheet" href="css/vendors/simplebar.css">
    <!-- Main styles for this application-->
    <link href="css/style.css" rel="stylesheet">
    <!-- We use those styles to show code examples, you should remove them in your application.-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/prismjs@1.23.0/themes/prism.css">
    <link href="css/examples.css" rel="stylesheet">
    <!-- Global site tag (gtag.js) - Google Analytics-->
    <script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-118965717-3"></script>
    <script>
      window.dataLayer = window.dataLayer || [];

      function gtag() {
        dataLayer.push(arguments);
      }
      gtag('js', new Date());
      // Shared ID
      gtag('config', 'UA-118965717-3');
      // Bootstrap ID
      gtag('config', 'UA-118965717-5');
    </script>
  </head>
  <body>
    <div class="bg-light min-vh-100 d-flex flex-row align-items-center">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-6">
            <div class="clearfix">
              <h1 class="float-start display-3 me-4">404</h1>
              <h4 class="pt-3">Oops! You're lost.</h4>
              <p class="text-medium-emphasis">The page you are looking for was not found.</p>
            </div>
              <a class="btn-default btn-primary text-decoration-none" href="{{url('/')}}" type="button">Home</a>
            </div>
          </div>
        </div>
      </div>
    </div>


  </body>
</html>