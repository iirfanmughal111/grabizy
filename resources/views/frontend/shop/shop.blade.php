@extends('frontend/common/master')
@section("headTitle")
Shop
@endsection

@section("bodyContent")
  <!-- Start All Title Box -->
  <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Shop</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{url('/')}}">Home</a></li>
                        <li class="breadcrumb-item active">Shop</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

        <!-- Start Shop Page  -->
        <div class="shop-box-inner">
        <div class="container">
            <div class="row">
                <div class="col-8 d-flex justify-content-center">
                @if(session('status'))
                           <div class="alert alert-success" role="alert">
                            <h5 class="text-uppercase  pb-0">{{session('status')}}</h5>
                        </div>
                @endif
                </div>
                <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
                    <div class="right-product-box">
                        <div class="product-item-filter row">
                            <div class="col-12 col-sm-8">
                            {{-- <div>  Showing
                                {{$products->firstItem()}}–{{$products->lastItem()}}
                                of {{$products->total()}} results
                            </div> --}}
                               
                            </div>
                            <div class="col-12 col-sm-4 text-center text-sm-right">
                                <ul class="nav nav-tabs ml-auto">
<!--                                 
                                    <li>
                                   <form method="post" action="{{url('shop/listingType/grid')}}">
                                    @csrf
                                        <a class="nav-link" onclick="event.preventDefault();
                                        this.closest('form').submit();">
                                        <i class="fa fa-th"></i> 
                                    </a> 
                                    </form>
                                    </li>

                                    <li>
                                    <form method="post" action="{{url('shop/listingType/list')}}">
                                    @csrf
                                        <a class="nav-link" onclick="event.preventDefault();
                                        this.closest('form').submit();">
                                       <i class="fa fa-list-ul"></i>
                                        </a>
                                    </form>

                                    </li> -->
                               
                                    <li>
                                        <a class="nav-link active" href="#grid-view" data-toggle="tab"> <i class="fa fa-th"></i> </a>
                                    </li>
                                    <li>
                                        <a class="nav-link" href="#list-view" data-toggle="tab"> <i class="fa fa-list-ul"></i> </a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="product-categorie-box">
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                    <div class="row">
                                    @if ($products->count())
                                        @foreach ($products as $prod)
                                        <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                            @include('frontend.shop.productCard',['product'=>$prod])
                                        </div>
                                        @endforeach
                                    @else
                                    <div class="row">
                                        <div class="col-12 d-flex justify-content-center">
                                            <div class="alert alert-success w-100" role="alert">
                                                No Data found
                                            </div>
                                        </div>
                                    </div>
                                @endif
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="list-view">
                                @if ($products->count())
                                        @foreach ($products as $prod)
                                            @include('frontend.shop.productList',['product'=>$prod])
                                        @endforeach
                                    @else
                                    <div class="row">
                                        <div class="col-12 d-flex justify-content-center">
                                            <div class="alert alert-success w-100" role="alert">
                                                No Data found
                                            </div>
                                        </div>
                                    </div>
                                @endif

                                </div>
                            </div>
                                <div class="row">
                                    <div class="col-12 d-flex justify-content-center">
                                        {{$products->appends(request()->input())->links()}}
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
				<div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
                    <div class="product-categori">
                        <div class="search-product">
                            <form method="post" action="{{url('/shop')}}" id="filterForm">
                            @csrf

                                <input class="form-control" placeholder="Search here..." type="text"  id="title" name="title"
                                        value="{{ $filters['title'] }}" aria-describedby="title">
                                <button type="submit"> <i class="fa fa-search"></i> </button>
                            </form>
                        </div>
                        <div class="filter-sidebar-left">
                            <div class="title-left">
                                <h3>Categories</h3>
                            </div>
                        <form method="get" action="{{url('/shop')}}" id="filterForm">
                        {{-- @csrf --}}
                            <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
                                
                             
								
                                <ul>
                                    @foreach ($categories as $category)
                                        <li class="shop-category-list" id="list-item-{{$category->id}}">
                                            <div class="form-check">
                                                <input class="form-check-input " type="checkbox"
                                                    {{in_array($category->id, $filters['categories']) ? 'checked' : ''}}
                                                    id="categories" value="{{$category->id}}" name="categories[]">
                                                <label class="form-check-label" for="categories">{{$category->title}}</label>
                                            </div>
                                        </li>
                                    @endforeach
                                </ul>
                            </div>
                        </div> 
                        <button class="btn hvr-hover" type="submit">Filter</button>
                        <!-- <div class="filter-price-left">
                            <div class="title-left">
                                <h3>Price</h3>
                            </div>
                            <div class="price-box-slider">
                                <div id="slider-range"></div>
                                <p>
                                    <input type="text" id="amount" readonly style="border:0; color:#fbb714; font-weight:bold;">
                                   
                                </p>
                            </div>
                        </div> -->
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Shop Page -->


@endsection
@section("additionolJs")
<script src="{{asset('js/module/shop.js')}}"></script>

@endsection