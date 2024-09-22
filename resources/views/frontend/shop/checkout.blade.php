@extends('frontend/common/master')
@section("headTitle")
Check Out
@endsection
@section("bodyContent")
<!-- Start All Title Box -->
<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Checkout</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{url('shop')}}">Shop</a></li>
                    <li class="breadcrumb-item active">Checkout</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->


    <!-- Start Cart  -->
    <div class="cart-box-main">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="checkout-address">
                        <div class="title-left">
                            <h3>Billing address</h3>
                        </div>
                        <form class="needs-validation" action="{{url('shop/cart/check-out')}}" method="post" >
                        @if(session('status'))
                           <div class="alert alert-success" role="alert">
                        <h5 class="text-uppercase mb-4">{{session('status')}}</h5></div>
                                @endif
                                       
                           @if ($errors->any())
                            @foreach ($errors->all() as $error)
                            <div class="alert alert-danger" role="alert">
                                    {{$error}}
                                </div>
                            @endforeach
                            @endif
                            
                            
        <!-- BILLING ADDRESS-->
                    @csrf
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="lastName">Name *</label>
                                    <input type="text" class="form-control" id="name" readonly type="text" name="name"
                                    value="{{Auth::user()->name ? Auth::user()->name : old('name')}}"
                                    required="required" autocomplete="current-name" aria-describedby="name">
                                    <div class="invalid-feedback"> Valid last name is required. </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                <label for="email">Email Address *</label>
                                <input type="email" class="form-control" readonly type="email" name="email"
                                    value="{{Auth::user()->email ? Auth::user()->email : old('email')}}"
                                    required="required" autocomplete="current-name" aria-describedby="name">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="lastName">Phone *</label>
                                    <input type="text" class="form-control" id="phone"  type="text" name="phone"
                                    value="{{Auth::user()->Profile ? Auth::user()->Profile->phone : old('phone')}}"
                                    required="required" autocomplete="current-name" aria-describedby="name">
                                </div>
                                <div class="col-md-6 mb-3">
                                <label for="email">Company </label>
                                <input type="email" class="form-control" type="text" name="company"
                                    value="{{Auth::user()->Profile ? Auth::user()->Profile->company : old('company')}}"
                                     autocomplete="current-name" aria-describedby="name">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="lastName">Zip </label>
                                    <input id="zip"  type="text" class="form-control" name="zip"
                                    value="{{Auth::user()->Profile ? Auth::user()->Profile->zip : old('zip')}}"
                                    required="required" autocomplete="current-name"aria-describedby="name">
                                </div>
                                <div class="col-md-6 mb-3">
                                <label for="email">Country </label>
                                @if (Auth::user()->Profile)
                                 
                                        <input id="country" type="text" class="form-control" name="country"
                                            value="{{Auth::user()->Profile ? Auth::user()->Profile->country : old('country')}}"
                                            required="required"  autocomplete="current-name" aria-describedby="name"
                                            placeholder="&nbsp;" />
                                  
                                    @else
                                    <label for="country" class="form-label  m-0">Country</label>
                                    <select name="country"  class="countries form-control" id="countryId">
                                        <option value="">Select Country</option>
                                    </select>
                                    @endif
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="lastName">Region </label>
                                    @if (Auth::user()->Profile)
                           
                                <input id="region" type="text" class="form-control" name="region"
                                    value="{{Auth::user()->Profile ? Auth::user()->Profile->region : old('region')}}"
                                    required="required"  autocomplete="current-name" aria-describedby="name"
                                    placeholder="&nbsp;" />
                            
                        @else
                        <label for="Region" class="m-0 form-label">State</label>
                        <select name="region"  class="states form-control" id="stateId">
                                <option value="">Select State</option>
                            </select>
                            <input type="hidden" value="{{ Auth::user()->Profile->country  ?? old('country') }}"
                                id="selected_country">
                            <input type="hidden" value="{{ Auth::user()->Profile->region  ?? old('region') }}"
                                id="selected_region">
                            <input type="hidden" value="{{ Auth::user()->Profile->city  ?? old('city') }}"
                                id="selected_city">
                        @endif
                                </div>
                                <div class="col-md-6 mb-3">
                                <label for="email">City </label>
                                @if (Auth::user()->Profile)
                            
                                <input id="city" type="text" class="form-control" name="city"
                                    value="{{Auth::user()->Profile ? Auth::user()->Profile->city : old('city')}}"
                                    required="required"  autocomplete="current-name" aria-describedby="name"
                                   />
                           
                            
                        @else
                            <label for="City" class="form-label m-0">City</label>
                            <select name="city"  class="cities form-control" id="cityId">
                                <option value="">Select City</option>
                            </select>
                        @endif
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="address">Address Line 1*</label>
                                <input type="text" class="form-control" id="address_line1" type="text" name="address_line1"
                                    value="{{Auth::user()->Profile ? Auth::user()->Profile->address_line1 : old('address_line1')}}"
                                    required  autocomplete="current-name">
                                
                            </div>
                            <div class="mb-3">
                                <label for="address2">Address Line 2 </label>
                                <input id="address_line" class="form-control" type="text" name="address_line"
                                    value="{{Auth::user()->Profile ? Auth::user()->Profile->address_line2 : old('address_line')}}"
                                     autocomplete="current-name" aria-describedby="name"> </div>
                         

                            <hr class="mb-4">
                            <div class="title"> <span>Payment</span> </div>
                            <div class="d-block my-3">
                                <div class="custom-control custom-radio">
                                    <input id="credit" name="paymentMethod" type="radio" value="cod" class="custom-control-input" checked required>
                                    <label class="custom-control-label" for="credit">Cash on Delivery</label>
                                </div>
                                <!-- <div class="custom-control custom-radio">
                                    <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
                                    <label class="custom-control-label" for="debit">Debit card</label>
                                </div> -->

                            </div>
                        <!--    <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="cc-name">Name on card</label>
                                    <input type="text" class="form-control" id="cc-name" placeholder="" required> <small class="text-muted">Full name as displayed on card</small>
                                    <div class="invalid-feedback"> Name on card is required </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="cc-number">Credit card number</label>
                                    <input type="text" class="form-control" id="cc-number" placeholder="" required>
                                    <div class="invalid-feedback"> Credit card number is required </div>
                                </div>
                            </div>-->
                            <div class="row">
                                <!-- <div class="col-md-3 mb-3">
                                    <label for="cc-expiration">Expiration</label>
                                    <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
                                    <div class="invalid-feedback"> Expiration date required </div>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label for="cc-expiration">CVV</label>
                                    <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
                                    <div class="invalid-feedback"> Security code required </div>
                                </div> -->
                                <div class="col-md-6 mb-3">
                                    <div class="payment-icon">
                                        <ul>
                                            <li><img class="img-fluid" src="{{asset('images/cod.jpg')}}" alt=""></li>
                                            <!-- <li><img class="img-fluid" src="images/payment-icon/2.png" alt=""></li>
                                            <li><img class="img-fluid" src="images/payment-icon/3.png" alt=""></li>
                                            <li><img class="img-fluid" src="images/payment-icon/5.png" alt=""></li>
                                            <li><img class="img-fluid" src="images/payment-icon/7.png" alt=""></li> -->
                                        </ul>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="odr-box">
                                <div class="title-left">
                                    <h3>Shopping cart</h3>
                                </div>
                                <div class="rounded p-2 bg-light">
                                    @foreach($cart as $product)
                                    @php
                                        $subtotal = 0;
                                        $discount = 0;
                                        if ($product->Product->sale_price != null){
                                            $subtotal += $product->Product->sale_price*$product->count;
                                            $discount += ($product->Product->regular_price-$product->Product->sale_price)*$product->count;
                                        }
                                        else{
                                            $subtotal += $product->Product->regular_price*$product->count;
                                        }
                                        $total =  $subtotal;
                                    @endphp
                                    <div class="media mb-2">
                                        <div class="media-body"> <a href="{{url('shop/view/'.$product->Product->id.'/'.$product->Product->title)}}"> {{ Str::limit($product->Product->title, 30) }}</a>
                                            <div class="small text-muted">Price:  
                                        @if ($product->Product->sale_price!=null)
                                        <del class="text-decoration-line-through text-muted"> 
                                            {{trans('global.currency_symbol')}} {{$product->Product->regular_price}}</del>
                                            <span>
                                            {{trans('global.currency_symbol')}} {{$product->Product->sale_price}}
                                            </span>
                                        @else
                                        <span> {{trans('global.currency_symbol')}}{{$product->Product->regular_price}} </span> 
                                        @endif <span class="mx-2">|</span> Qty: {{$product->count}} <span class="mx-2">|</span> Subtotal: {{trans('global.currency_symbol')}} {{$product->Product->sale_price!=null ? $product->Product->sale_price*$product->count : $product->Product->regular_price*$product->count}}</div>
                                        </div>
                                    </div>
                                    @endforeach
                                   
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12">
                            <div class="order-box">
                                <div class="title-left">
                                    <h3>Your order</h3>
                                </div>
                                <div class="d-flex">
                                    <div class="font-weight-bold">Product</div>
                                    <div class="ml-auto font-weight-bold">Total</div>
                                </div>
                                <hr class="my-1">
                                <div class="d-flex">
                                    <h4>Sub Total</h4>
                                    <div class="ml-auto font-weight-bold"> 
                                    
                            {{trans('global.currency_symbol')}}  {{$subtotal}} 
                                    </div>
                                </div>
                                @if ($discount > 0)
                                <div class="d-flex">
                                    <h4>Discount</h4>
                                    <div class="ml-auto font-weight-bold"> {{trans('global.currency_symbol')}}  {{$discount}}  </div>
                                </div>
                                @endif
                                <hr class="my-1">

                                <div class="d-flex">
                                    <h4>Shipping Cost</h4>
                                    <div class="ml-auto font-weight-bold">
                                    @if ($shipping) 
                                        {{trans('global.currency_symbol')}} {{$shipping->cost}} 
                                         @php $total =  $shipping->cost+$subtotal; @endphp
                                         @else  
                                        <div class="alert alert-danger small mt-3" role="alert">
                                            No shipping cost estimated for your region. You can <a href="{{url('contact-us')}}">contact us</a>  or bear expences.
                                        </div>
                                        @endif 
                                    </div>
                                </div>
                                <hr>
                                <div class="d-flex gr-total">
                                    <h5>Grand Total</h5>
                                    <div class="ml-auto h5"> {{trans('global.currency_symbol')}}  {{$total}}</div>
                                </div>
                                <hr> </div>
                        </div>
                        <div class="col-12 d-flex shopping-box">
                             <button type="submit" class="ml-auto btn hvr-hover">Place Order</button> 
                        </div>
                    </div>
                </div>
            </div>
            </form>

        </div>
    </div>
    <!-- End Cart -->


@endsection
@section("additionolJs")
<script src="{{asset('js/module/countrystatecity.js')}}"></script>
<script>
    var placeOrder = document.querySelector("#place-order");
placeOrder.addEventListener("click", () => {
    placeOrder.innerHTML = 'Loading...';
});
</script>
@endsection