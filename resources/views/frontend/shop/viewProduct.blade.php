@extends('frontend/common/master')
@section("headTitle")
{{$product->title}}
@endsection

@section("bodyContent")
    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>{{$product->title}}</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active">View</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Shop Detail  -->
    <div class="shop-detail-box-main">
        <div class="container">
            <div class="row">
                <div class="col-xl-5 col-lg-5 col-md-6">
                    <div id="product-carousel" class="single-product-slider carousel slide" data-ride="carousel">
                        <div class="carousel-inner" role="listbox">
                            <div class="carousel-item carousel-item-image active"> <img class="d-block w-100" src="{{ $product->featured_image()}}" alt="{{$product->title}}"> </div>
                            @foreach($product->Gallery  as $image)
                              <div class="carousel-item carousel-item-image"> <img class="d-block w-100" src="{{ $image->gallery_image() }}" alt="{{$product->title}}"> </div>
                            @endforeach
                        </div>
                        <a class="carousel-control-prev" href="#product-carousel" role="button" data-slide="prev"> 
						<i class="fa fa-angle-left" aria-hidden="true"></i>
						<span class="sr-only">Previous</span> 
					</a>
                        <a class="carousel-control-next" href="#product-carousel" role="button" data-slide="next"> 
						<i class="fa fa-angle-right" aria-hidden="true"></i> 
						<span class="sr-only">Next</span> 
					</a>
                        <ol class="carousel-indicators">
                            <li data-target="#product-carousel" data-slide-to="0" class="active">
                                <img class="d-block w-100 img-fluid" src="{{ $product->featured_image()}}" alt="{{$product->title}}" />
                            </li>
                            @foreach($product->Gallery  as $key=>$image)
                            <li data-target="#product-carousel" data-slide-to="{{$key+1}}">
                                <img class="d-block w-100 img-fluid"  src="{{ $image->gallery_image() }}" alt="{{$product->title}}" />
                            </li>
                            @endforeach

                        </ol>
                    </div>
                </div>
                <div class="col-xl-7 col-lg-7 col-md-6">
                    <div class="single-product-details">
                        <h2 id="product_title">{{$product->title}}</h2>
                        <h5> @if ($product->sale_price)
                                <del>{{trans('global.currency_symbol')}}{{$product->regular_price}}</del> {{trans('global.currency_symbol')}}{{$product->sale_price}}
                                @else
                                {{trans('global.currency_symbol')}}{{$product->regular_price}}
                            @endif</h5>
                            <input type="text" id="vid" name="vid" value="0" />
                            <input type="text" id="vTitle" name="vTitle" value="0" />
                            <input type="text" id="vImg" name="vImg" value="0" />
                        <p class="available-stock"><span> More than {{ rand(12,50) }} available / <a href="#">{{ rand(2,47) }} sold </a></span><p>
                            @if ($product->short_description)
                            <h4>Short Description:</h4>
                            <p>{{$product->short_description}}</p>
                            @endif
						<!-- <ul>
							<li>
								<div class="form-group quantity-box">
									<label class="control-label">Quantity</label>
									<input class="form-control" value="0" min="0" max="20" type="number">
								</div>
							</li>
						</ul> -->
             @php
                $inCart = in_array($product->id,$cartIds) ? 1 : 0 ;
              @endphp

						<div class="price-box-bar">
							<div class="cart-and-bay-btn">
								<!-- <a class="btn hvr-hover" data-fancybox-close="" href="#">Buy New</a> -->
								<a class="btn hvr-hover add-to-cart" data-fancybox-close=""  data-product-id="{{$product->id}}" href="javascript:void(0);" data-status="{{$inCart==1 ? 1 : 0 }}">{{$inCart==1 ? 'Remove from' : ' Add to' }} cart</a>
							</div>
						</div>

						<div class="add-to-btn">
							<div class="add-comp">
								<a class="btn hvr-hover add-wish-list" data-page="view" data-product-id="{{$product->id}}" href="javascript:void(0);"><i class="fas fa-heart mr-1"></i>{{in_array($product->id,$wishListIds) ? 'Remove from ' : 'Add to '}} Wishlist</a>
								<!-- <a class="btn hvr-hover" href="#"><i class="fas fa-sync-alt"></i> Add to Compare</a> -->
							</div>
                            <ul class="list-unstyled small d-inline-block mt-3">
                            <li class="px-3 py-2 mb-1 bg-white text-muted"><strong class="text-uppercase text-dark">Category:</strong>
                            @if (isset($product->category_id))
                            <a class="reset-anchor ms-2" href="{{url('shop/category/'.$product->category_id.'/'.str_replace(' ','-',$product->Category ? $product->Category->title : 'uncategorized') )}}">
                                {{$product->category_id!=null ? $product->Category->title : 'uncategorized'}}</a>
                            @else
                            <span>uncategorized</span>
                            @endif
                            </li>
           
                            @if ($product->Tags->count())
                            <li class="px-3 py-2 mb-1 bg-white text-muted"><strong class="text-uppercase text-dark">Tags:</strong>
                                @foreach($product->Tags  as $tag)
                                <span class="me-1">{{$tag->value}},</span>
                                
                                @endforeach
                            </li>
                            @endif
                        </ul> 
                        @if(count($product->cjProductVarients))
                        <h2>Varients ({{ count($product->cjProductVarients) }})</h2>
                            @include('frontend.shop.productVarients')
                        @endif
                       
							<!-- <div class="share-bar">
								<a class="btn hvr-hover" href="#"><i class="fab fa-facebook" aria-hidden="true"></i></a>
								<a class="btn hvr-hover" href="#"><i class="fab fa-google-plus" aria-hidden="true"></i></a>
								<a class="btn hvr-hover" href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a>
								<a class="btn hvr-hover" href="#"><i class="fab fa-pinterest-p" aria-hidden="true"></i></a>
								<a class="btn hvr-hover" href="#"><i class="fab fa-whatsapp" aria-hidden="true"></i></a>
							</div> -->
						</div>
                    </div>
                </div>
            </div>
            @if ($product->description)
            <div class="row my-5">
				<div class="card card-outline-secondary w-100 my-4">
					<div class="card-header">
						<h2>Product Description</h2>
					</div>
					<div class="card-body">
                        @php echo html_entity_decode($product->description) @endphp
					</div>
				  </div>
			</div>
            @endif
			
            @if ($similarProducts->count())
                <div class="row my-5">
                    <div class="col-lg-12">
                        <div class="title-all text-center">
                            <h1>Related Products </h1>
                            <p>you may also intrested in following products.</p>
                        </div>
                    </div>
                    @if ($similarProducts->count() < 4)
                        @foreach ($similarProducts as $prod)
                            <div class="col-sm-6 col-md-6 col-lg-3">
                                @include('frontend.shop.productCard',['product'=>$prod])
                            </div>
                        @endforeach
                        @else
                    <div class="col-lg-12">
                        <div class="featured-products-box owl-carousel owl-theme" id="similar-products">
                        @foreach ($similarProducts as $key=>$simProd)
                            <div class="item">
                                @include('frontend.shop.productCard',['product'=>$simProd])
                            </div>
                        @endforeach

                        </div>
                        @endif
                    </div>
                </div>
            @endif


        </div>
    </div>
    <!-- End Cart -->

    @endsection
    @section("additionolJs")
    
    <script src="{{asset('js/module/shop.js')}}"></script>
    <script>
        $("#similar-products").owlCarousel({
  loop:false //**This

});


    </script>
    @endsection
    <script>

    </script>