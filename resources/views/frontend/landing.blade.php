@extends('frontend/common/master')
@section("headTitle")
Home
@endsection
@section('additionolCss')


@endsection

@section("bodyContent")
    <!-- Start Slider -->
    <div id="slides-shop" class="cover-slides">
        <ul class="slides-container">
        @foreach ($banners as $banner)
            <li class="text-center">
            <img src="{{asset('images/banner/'.$banner->image)}}" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                        <h1 class="m-b-20"><strong>{{$banner->content_heading ? $banner->content_heading : '' }}</strong> </h1>
                        <p class="m-b-40">{{$banner->content_desc ?? '' }}</p>
                            @if ($banner->button && $banner->button_text)
                            <p><a class="btn hvr-hover" href="{{url('/'.$banner->button)}}">{{$banner->button_text ?? '' }}</a></p>
                            @endif
                        </div>
                    </div>
                </div>
            </li>
            @endforeach
        
            
        </ul>
        <div class="slides-navigation">
            <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        </div>
    </div>
    <!-- End Slider -->
   

        <!-- Start Categories  -->
        <div class="categories-shop">
        <div class="container">
            <div class="row">
            @foreach ($trendingCats as $cat)
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="shop-cat-box">
                    @if (isset($cat->image_url))
                        <img class="img-fluid category-image" src="{{ file_exists(public_path('uploads/category/'.$cat->image_url)) ? asset('uploads/category/'.$cat->image_url) : asset('/no-image.png') }}" alt="{{$cat->title}}" />
                        @else
                        <img class="img-fluid category-image" src="{{  asset('/no-image.png') }}" alt="{{$cat->title}}" />
                        @endif

                        <img class="img-fluid" src="images/categories_img_01.jpg" alt="" />
                        <a class="btn hvr-hover" href="{{url('/shop/category/'.$cat->id.'/'.str_replace(' ','-',$cat->title))}}">{{$cat->title}}</a>
                    </div>
                </div>
            @endforeach


            </div>
        </div>
    </div>
    <!-- End Categories -->

    <!-- Start TRENDING Products  -->
    <div class="products-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>Trending Products</h1>
                        <p class="text-capitalize">CAREFULLY CREATED COLLECTIONS.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="special-menu text-center">
                        <div class="button-group filter-button-group">
                            <button class="active" data-filter="*">All</button>
                            <button data-filter=".top-featured">Top featured</button>
                            <button data-filter=".best-seller">Best seller</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row special-list">

            @foreach ($saleProds as $prod)
                <div class="col-lg-3 col-md-6 special-grid best-seller ">
                    @include('frontend.shop.productCard',['product'=>$prod])
                </div>
            @endforeach

            @foreach ($trendingProds as $prod)
                <div class="col-lg-3 col-md-6 special-grid top-featured ">
                    @include('frontend.shop.productCard',['product'=>$prod])
                </div>
            @endforeach
            </div>
        </div>
    </div>
    </div>



@endsection

@section('additionolJs')

<script src="{{asset('js/module/shop.js')}}"></script>

@endsection