@extends('frontend/common/master')
@section("headTitle")
Cart
@endsection
@section("bodyContent")


<!-- Start All Title Box -->
<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Cart</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{url('shop')}}">Shop</a></li>
                    <li class="breadcrumb-item active">Cart</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->

<!-- Start Cart  -->
<div class="cart-box-main">
    <div class="container">
    @if ($products->count())
        <div class="row">
            <div class="col-lg-12">
                <div class="table-main table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Images</th>
                                <th>Product Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                        @foreach($products as $product)

                            <tr>
                                <td class="thumbnail-img">
                                    <a href="{{url('shop/view/'.$product->Product->id.'/'.$product->Product->title)}}">
                                <img class="img-fluid" src="{{$product->Product->featured_image()}}" alt="" />
                            </a>
                                </td>
                                <td class="name-pr">
                                    <a href="{{url('shop/view/'.$product->Product->id.'/'.$product->Product->title)}}">
                                    {{ Str::limit($product->Product->title, 30) }}
                            </a>
                                </td>
                                <td class="price-pr">
                                    <p> 
                                        @if ($product->Product->sale_price!=null)
                                        <del class="text-decoration-line-through text-muted"> 
                                            {{trans('global.currency_symbol')}} {{$product->Product->regular_price}}</del>
                                            <span>
                                            {{trans('global.currency_symbol')}} {{$product->Product->sale_price}}
                                            </span>
                                        @else
                                        <span class=""> {{trans('global.currency_symbol')}}{{$product->Product->regular_price}} </span> </p>
                                        @endif
                                    
                                </td>
                                <td class="quantity-box"><input type="number" id="quantity-{{$product->id}}" data-cart-id="{{$product->id}}" size="4" value="{{$product->count}}" min="0" step="1" class="c-input-text qty text update_cart_quantity"></td>
                                <td class="total-pr">
                                    <p> {{trans('global.currency_symbol')}} {{$product->Product->sale_price!=null ? $product->Product->sale_price*$product->count : $product->Product->regular_price*$product->count}}</p>
                                </td>
                                <td class="remove-pr">
                                    <a class="delete_from_cart"
                                        href="javascript::void()" data-product-id="{{$product->Product->id}}">
                                <i class="fas fa-times"></i>
                            </a>
                                </td>
                            </tr>
                            @endforeach

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="row my-5">
            <div class="col-lg-8 col-sm-12"></div>
            <div class="col-lg-4 col-sm-12">
                <div class="order-box">
                    <h3>Order summary</h3>
                    <div class="d-flex">
                        <h4>Sub Total</h4>
                        <div class="ml-auto font-weight-bold"> 
                        @php
                            $subtotal = 0;
                            $discount = 0;

                            foreach ($products as $key => $prod){
                            if ($prod->Product->sale_price != null){
                                $subtotal += $prod->Product->sale_price*$prod->count;
                                $discount += ($prod->Product->regular_price-$prod->Product->sale_price)*$prod->count;
                            }
                            else{
                                $subtotal += $prod->Product->regular_price*$prod->count;
                            }
                            }
                        @endphp
                            {{trans('global.currency_symbol')}}  {{$subtotal}}   
                    </div>
                    </div>
                    @if ($discount > 0)
                    <div class="d-flex">
                        <h4>Discount</h4>
                        <div class="ml-auto font-weight-bold"> {{trans('global.currency_symbol')}}  {{$discount}}  </div>
                    </div>
                    @endif
                    <div class="d-flex gr-total">
                        <h5>Grand Total</h5>
                        <div class="ml-auto h5">    {{trans('global.currency_symbol')}}  {{$subtotal}}   </div>
                    </div>
                    <hr> </div>
            </div>
            <div class="col-12 d-flex shopping-box"><a href="{{url('shop/cart/check-out')}}" class="ml-auto btn hvr-hover">Checkout</a> </div>
        </div>
        @else
                        <div class="alert alert-success">
                            Cart is empty
                        </div>
                    @endif
    </div>
</div>
<!-- End Cart -->



@endsection
@section("additionolJs")
<script src="{{asset('js/module/shop.js')}}"></script>
@endsection