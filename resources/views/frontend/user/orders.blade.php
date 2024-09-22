@extends('frontend/common/dashboard')

@section("dashboardContent")
<div class="body flex-grow-1 px-3" id="dashboard-content">
    <div class="row">

        <div class="col-md-12">

            <div class="row">
                <div class="col">
                    <div class="card mb-4">
                        <div class="card-header">My Orders</div>
                        <div class="card-body bg-orders" style="min-height:65vh;">
                            
                            <form action="{{url('dashboard/my-orders/')}}" method="post">
                                @csrf
                            <select class="selectpicker mb-3" name="status" id="status"
                                            aria-label="Order Filter" data-live-search="true">
                                            <option value=" "  >All</option>

                                            @foreach($orderStaus as $status)
                                            <option value="{{$status->id}}" {{ $filter == $status->id ? "selected" :""}} >{{$status->value}}</option>
                                            @endforeach
                                          
                                        </select>
                                        <button type="submit" class="btn btn-dark btn-sm mb-3 ml-3">Filter</button>

                            </form>
                     @if ($orders->count())

                            @foreach($orders as $key=>$order)
                            @if($order->OrderItem->count())
                            <div class="orders bg-light p-3 mb-3 rounded">
                                <div class="row border-bottom border-1 border-success mb-2 ">
                                    <div class="col-sm-8 ">
                                        <p class="p-0 m-0">Order # <a href="{{url('/shop/view-order/'.$order->order_no)}}">{{$order->order_no}}</a> </p>
                                        <p class="p-0 m-0 text desc">Placed on <span>{{$order->created_at}}</span></p>
                                    </div>
                                    <div class="col-sm-4 d-sm-flex justify-content-end">
                                    <div class="item-status item-capsule">
                                    <p class="small text-muted">Current Status</p>

                                            <p class="capsule">{{$order->Status->value}}</p>
                                        </div>
                                    </div>
                                </div>
                                @foreach ($order->OrderItem as $i=>$item)
                                <div class="row mb-3">
                                    <div class="col-sm-10">
                                        <a href="{{url('shop/view/'.$item->Product->id.'/'.$item->Product->title)}}">
                                        <img class="table-image"
                                            src="{{ file_exists(public_path('uploads/products/featured_images'.$item->Product->featured_image)) ? asset('no-image.png') : asset('uploads/products/featured_images/'.$item->Product->featured_image) }}" /></a>
                                        <span class="item-title">{{$item->Product->title}}</span>


                                    </div>
                                    <div class="col-sm-2">
                                        <div class="item-quantity"><span><span
                                                    class="text desc info multiply">Qty:</span><span
                                                    class="text">{{$item->quantity}}</span></span></div>
                                    </div>

                                </div>
                                @endforeach
                                <div class="row d-flex justify-content-between">
                                    <div class="col-md-7 mb-3 mb-md-0 p-2 rouded bg-orders">
                                        <h6>Shipping Address</h6>
                                        <p> <span
                                                class="bg-primary text-white rounded-pill p-1">{{Auth::user()->name}}</span>
                                        </p>

                                        <p>
                                            {{Auth::user()->Profile->address_line1}}
                                            {{Auth::user()->Profile->address_line1 ? ',': ''}}

                                            {{Auth::user()->Profile->address_line2}}
                                            {{Auth::user()->Profile->address_line2 ? ',': ''}}

                                            {{Auth::user()->Profile->city}}
                                            {{Auth::user()->Profile->city ? ',': ''}}

                                            {{Auth::user()->Profile->region}}
                                            {{Auth::user()->Profile->region ? ',': ''}}


                                            {{Auth::user()->Profile->country}}
                                        </p>
                                        <p>{{Auth::user()->Profile->phone}} </p>
                                    </div>
                                    <div class="col-md-4 p-2 rouded bg-orders">
                                        <div class="row">
                                            <div class="col-12">
                                                <h6>Summary</h6>
                                            </div>
                                            <div class="col-6">
                                                <p class="p-0 m-0">Subtotal:</p>
                                                <p class="p-0 m-0">Delivery Fee:</p>
                                                <p class="p-0 m-0">Total</p>
                                                <p class="p-0 m-0">Payment Method</p>


                                            </div>
                                            <div class="col-6">
                                                <p class="p-0 m-0">{{trans('global.currency_symbol')}} {{$order->order_payment}} </p>
                                                <p class="p-0 m-0">{{trans('global.currency_symbol')}} {{$order->shipping_cost ? $order->shipping_cost : 0}} </p>
                                                
                                                <p class="p-0 m-0"> {{trans('global.currency_symbol')}} {{$order->shipping_cost != null ? $order->shipping_cost+$order->order_payment: $order->order_payment}} </p>
                                                <p class="p-0 m-0">{{$order->payment_method}}</p>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endif

                            @endforeach

                        </div>


                    </div>
                </div>


            </div>
        </div>
        <!-- /.col-->
    </div>
    <div class="row">
        <div class="col-12 d-flex justify-content-center">
            {{ $orders->links() }}
        </div>
    </div>

    @else
    <div class="row d-flex justify-content-center">
        <div class="col-12">
            <p class="text-center"> No Data Found</p>
        </div>
    </div>
    @endif
    <div id="notification"></div>


    @endsection


    @section('additionolJs')


    @endsection