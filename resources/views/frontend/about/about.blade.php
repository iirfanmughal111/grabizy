@extends('frontend/common/master')
@section("headTitle")
About US
@endsection
@section("bodyContent")


<!-- Start All Title Box -->
<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>ABOUT US</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active">ABOUT US</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->


  <!-- Start About Page  -->
  <div class="about-box-main">
        <div class="container">
            <div class="row">
				<div class="col-lg-6">
                    <div class="banner-frame"> <img class="img-fluid" src="{{showLogo()}}" alt="" />
                    </div>
                </div>
                <div class="col-lg-6">
                    <h2 class="noo-sh-title-top">We are <span>{{showSiteTitle()}}</span></h2>
                    <p>  {!! $settings && $settings->about_page ? $settings->about_page : '' !!} </p>
					<!-- <a class="btn hvr-hover" href="#">Read More</a> -->
                </div>
            </div>
            <div class="row my-5">
                <div class="col-sm-6 col-lg-4">
                    <div class="service-block-inner">
                        <h3>We are Trusted</h3>
                        <p>At {{showSiteTitle()}}, we are committed to providing you with an exceptional shopping experience. We understand that trust is the foundation of every successful online transaction, and we take that responsibility seriously. </p>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4">
                    <div class="service-block-inner">
                        <h3>We are Professional</h3>
                        <p>We believe that every piece of clothing should not only look fantastic but also feel comfortable and durable. That's why we meticulously source our fabrics and work with trusted manufacturers to ensure that each item in our collection meets the highest standards of quality. Whether you're looking for casual wear, work attire, or something for a special occasion, we've got you covered. </p>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4">
                    <div class="service-block-inner">
                        <h3>We are Expert</h3>
                        <p>Shopping with us is a breeze. Our user-friendly website allows you to browse and shop with ease, and our secure payment options ensure a hassle-free checkout process. Plus, enjoy fast and reliable shipping right to your doorstep. </p>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- End About Page -->


    
@endsection
@section("additionolJs")

@endsection