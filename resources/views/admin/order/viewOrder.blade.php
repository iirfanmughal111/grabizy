
@extends('admin/master')
@section("headTitle")
Order View
@endsection
    @section("bodyContent")
<div class="body flex-grow-1 px-3">
    <div class="row">
        <div class="col-md-12">
            @if ($order)
            <div class="row">
                <div class="col">
                    <div class="card mb-4">
                        <div class="card-header">View Order</div>
                        <div class="card-body bg-orders">
                            @if($order->OrderItem->count())
                            <div class="orders bg-light p-3 mb-3 rounded">
                                <div class="row border-bottom border-1 border-success mb-2 ">
                                    <div class="col-sm-8 ">
                                        <p class="p-0 m-0">Order # {{$order->order_no}}</p>
                                        <p class="p-0 m-0 text desc">Placed on <span>{{$order->created_at}}</span></p>
                                    </div>
                                    <div class="col-sm-4 d-sm-flex justify-content-end">
                                    <div class="item-status item-capsule">
                                            <p class="small text-muted">Current Status</p>
                                            <p class="capsule border">{{$order->Status->value}}</p>
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
                                        @if ($order->User && $order->User->Profile)
                                            <h5>Shipping Address:</h5>
                                            <p>
                                                <a href="{{url('admin/users/profile/'.$order->User->id)}}">
                                                <span
                                                    class="bg-primary text-white rounded-pill p-1">{{$order->User->name}}</span></a>
                                            </p>
                                            <p><span class="small">Email:</span>{{$order->User->email}}</p>
                                        <p>
                                            {{$order->User->Profile->address_line1}}
                                            {{$order->User->Profile->address_line1 ? ',': ''}}
                                            {{$order->User->Profile->address_line2}}
                                            {{$order->User->Profile->address_line2 ? ',': ''}}
                                            {{$order->User->Profile->city}}
                                            {{$order->User->Profile->city ? ',': ''}}
                                            {{$order->User->Profile->region}}
                                            {{$order->User->Profile->region ? ',': ''}}
                                            {{$order->User->Profile->country}}
                                        </p>
                                        <p>{{$order->User->Profile->phone}} </p>
                                        @else
                                        <p class="text-sm text-center p-1 alert alert-warning" title="You can restore from trash"> User Deleted </p>
                                        @endif
                                    </div>
                                    
                                    
                                    <div class="col-md-4 p-2 rouded bg-orders">
                                        <div class="row">
                                            <div class="col-12">
                                                <h5>Summary:</h5>
                                            </div>
                                            <div class="col-6">
                                                <p class="p-0 m-0">Subtotal:</p>
                                                <p class="p-0 m-0">Delivery Fee:</p>
                                                <p class="p-0 m-0">Total</p>
                                                <p class="p-0 m-0">Payment Method</p>
                                            </div>
                                            <div class="col-6">
                                                <p class="p-0 m-0">{{$order->order_payment}} {{trans('global.currency_symbol')}}</p>
                                                <p class="p-0 m-0">{{$order->shipping_cost ? $order->order_payment : 0}} {{trans('global.currency_symbol')}}</p>
                                                
                                                <p class="p-0 m-0 fw-bold">{{$order->shipping_cost != null ? $order->shipping_cost+$order->order_payment: $order->order_payment}} {{trans('global.currency_symbol')}}</p>
                                                <p class="p-0 m-0">{{$order->payment_method}}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endif

                           

                        </div>


                    </div>
                </div>


            </div>
        </div>
        <!-- /.col-->
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