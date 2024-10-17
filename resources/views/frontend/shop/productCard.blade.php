    @php
        $inCart = in_array($product->id,$cartIds) ? 1 : 0 ;
    @endphp
              
   
        <div class="products-single fix">
            <div class="box-img-hover product-bg">
                @if($product->sale_price)
                <div class="type-lb">
                    <p class="sale">Sale</p>
                </div>
                @endif
                <img src="{{ $product->featured_image() }}" class="img-fluid product-image" alt="{{$product->title}}" title="{{$product->title}}">
                <div class="mask-icon">
                    <ul>
                        <li><a href="{{url('shop/view/'.$product->id.'/'.str_replace(' ','-',$product->title))}}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                        <!-- <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li> -->
                        <li><a  data-toggle="tooltip" data-placement="right" title="{{in_array($product->id,$wishListIds) ? 'Remove from' : 'Add to'}} Wishlist" class="add-wish-list" data-product-id="{{$product->id}}" href="javascript:void(0);"><i class="far fa-heart"></i></a></li>
                    </ul>
                    <a class="cart add-to-cart" data-status="{{$inCart==1 ? 1 : 0 }}" data-product-id="{{$product->id}}" href="javascript:void();">{{$inCart==1 ? 'Remove from' : ' Add to' }} Cart</a>
                </div>
            </div>
            <div class="why-text">
                <h4>{{$product->title}}</h4>
                <h5> <del
                            class="{{$product->sale_price!=null ? 'text-decoration-line-through text-muted' : ''}}"> {{trans('global.currency_symbol')}}{{$product->regular_price}}</del>
                        <span class=""> {{trans('global.currency_symbol')}}{{$product->sale_price!=null ? $product->sale_price : ''}} </span></h5>
            </div>
        </div>