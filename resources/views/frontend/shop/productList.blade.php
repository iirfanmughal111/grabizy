    @php
        $inCart = in_array($product->id,$cartIds) ? 1 : 0 ;
    @endphp
    
    <div class="list-view-box">
            <div class="row">
                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                    <div class="products-single fix">
                        <div class="box-img-hover product-bg">
                            <div class="type-lb">
                                <p class="new">New</p>
                            </div>
                            <img src="{{ $product->featured_image() }}" class="img-fluid shop-list-image" alt="{{$product->title}}" >
                            <div class="mask-icon">
                                <ul>
                                    <li><a href="{{url('shop/view/'.$product->id.'/'.str_replace(' ','-',$product->title))}}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
                                    <li><a data-product-id="{{$product->id}}" href="javascript:void(0);" data-toggle="tooltip" data-placement="right" title="{{in_array($product->id,$wishListIds) ? 'Remove from' : 'Add to'}} Wishlist" class="add-wish-list"><i class="far fa-heart"></i></a></li>
                                </ul>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-6 col-lg-8 col-xl-8">
                    <div class="why-text full-width">
                        <h4>{{$product->title}}</h4>
                        <p>{{$product->short_description}}</p>
                        <h5> 
                            @if ($product->sale_price)
                                <del>{{trans('global.currency_symbol')}}{{$product->regular_price}}</del> {{trans('global.currency_symbol')}}{{$product->sale_price}}
                                @else
                                {{trans('global.currency_symbol')}}{{$product->regular_price}}
                            @endif
                            </h5>
                     
                        <a class="btn hvr-hover add-to-cart" data-status="{{$inCart==1 ? 1 : 0 }}" data-product-id="{{$product->id}}" href="javascript:void();">{{$inCart==1 ? 'Remove from' : ' Add to' }} Cart</a>
                        
                    </div>
                </div>
            </div>
        </div>


        <br><br>

