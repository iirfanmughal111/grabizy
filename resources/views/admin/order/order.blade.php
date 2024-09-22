@extends('admin/master')
@section("headTitle")
Orders
@endsection

@section("bodyContent")
@if(auth()->user()->can('delete orders') )
@include('admin.order.orderDeleteModal')
@if ($trash==1)
@include('admin.order.orderRestoreModal')
@endif
@endif


<div class="body flex-grow-1 px-3">
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4">
                <div class="card-header">Orders Mangement</div>
                <div class="card-body">

                </div>
                @if($orders->count())
                <div class="row">
                    <div class="table-responsive px-4 mb-3" style="min-height:50vh;">
                        @include('admin.order.orderSearchForm')
                        <table class="table border mb-0">
                            <thead class="table-light fw-semibold">
                                <tr class="align-middle">
                                    <th>#</th>
                                    <th>Image</th>
                                    <th>Product(s)</th>
                                    <th>Status</th>
                                    <th>User</th>
                                    <th>Address</th>
                                    <th>Payment Method</th>

                                    <th>Payment<p class="m-0 small table-header-text text-muted">Order+Shipping</p>
                                    </th>
                                    <th>Order Date</th>
                                    <th></th>

                                </tr>
                            </thead>
                            <tbody>
                                @foreach($orders as $key=>$order)
                                <tr class="align-middle " id="order-row-{{$order->id}}">
                                    <td>
                                        <div>{{$key+1}}</div>
                                    </td>

                                    <td>

                                        @if (isset($order->OrderItem[0]))
                                        <a href="{{url('shop/view-order/'.$order->order_no)}}"><img class="table-image"
                                                src="{{ file_exists(public_path('uploads/products/featured_images/'.$order->OrderItem[0]->Product->featured_image)) ?   asset('uploads/products/featured_images/'.$order->OrderItem[0]->Product->featured_image) : asset('no-image.png')}}" /></a>
                                        @else
                                        <a href="{{url('shop/view-order/'.$order->order_no)}}"><img class="table-image"
                                                src="{{asset('no-image.png')}}" /></a>
                                        @endif
                                    </td>
                                    <td class="text-capitalize">
                                        <p class="m-0 "> <span class="border-bottom">Order#<a
                                                    href="{{url('shop/view-order/'.$order->order_no)}}">{{$order->order_no}}</a></span>
                                        </p>
                                        @foreach ($order->OrderItem as $item)
                                        <p class="title-popover" data-title="{{$item->Product->title}}">
                                            <strong>({{$item->quantity}})</strong>
                                            {{ Str::limit($item->Product->title, 30) }} </p>
                                        @endforeach
                                    </td>
                                    <td class="text-capitalize">
                                        <select class="form-select order_status" value="{{$order->status_id}}" data-status-id="{{$order->id}}"
                                            name="order_status" id="order_status-{{$order->id}}"
                                            aria-label="Default select example" data-live-search="true">

                                            @foreach($status as $st)
                                            <option  value="{{$st->id}}" {{$order->status_id==$st->id ? 'selected' : ''}}
                                                class="" data-val="{{$st->id}}"> {{$st->value}}</option>
                                            @endforeach

                                        </select>
                                    </td>
                                    <td>
                                    @if ($order->User)

                                        <p class="p-0 m-0">{{ Str::limit($order->User->name, 20) }} </p>
                                        <p class="p-0 m-0 small">{{ Str::limit($order->User->email, 20) }} </p>
                                        @else
                                        <p class="text-sm text-center p-1 alert alert-warning" title="You can restore from trash"> User Deleted </p>                         
                                        @endif

                                    </td>
                                    <td>
                                        @if ($order->User && $order->User->Profile)
                                        <p class="p-0 m-0"> 
                                            {{$order->User->Profile->address_line1}}
                                            {{$order->User->Profile->address_line1 ? ',': ''}}
                                            {{$order->User->Profile->address_line2}}
                                            {{$order->User->Profile->address_line2 ? ',': ''}}
                                            {{$order->User->Profile->city}}

                                            {{$order->User->Profile->city ? ',': ''}}
                                        </p>
                                        <p class="p-0 m-0 small">
                                            
                                            {{$order->User->Profile->region}}
                                            {{$order->User->Profile->region ? ',': ''}}
                                            {{$order->User->Profile->country}}
                                        </p>
                                        @else
                                        <p class="text-sm text-center p-1 alert alert-warning" title="You can restore from trash"> User Deleted </p>
                                            @endif
                                    </td>
                                    <td>
                                        {{$order->payment_method}}
                                    </td>
                                    <td>

                                        <p class="p-0 m-0 small text-muted">

                                            {{trans('global.currency_symbol')}} {{$order->shipping_cost==null ? 0 : $order->shipping_cost }}+{{$order->order_payment}} 
                                        </p> 
                                        <p class="p-0 m-0 bold ">
                                        {{trans('global.currency_symbol')}} {{$order->shipping_cost==null ? $order->order_payment : $order->order_payment+ $order->shipping_cost}} 
                                        <p>

                                    </td>
                                    <td>
                                        {{$order->created_at }}
                                    </td>

                                    <td>
                                        @if(auth()->user()->can('delete orders'))
                                        <div class="dropdown dropup">
                                            <button class="btn btn-transparent p-0" type="button"
                                                data-coreui-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false">
                                                <i class="fa-solid fa-ellipsis-vertical"></i>
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-end">
                                                @if(auth()->user()->can('delete orders'))
                                                <a class="dropdown-item text-danger " data-bs-toggle="modal"
                                                    data-bs-target="#deleteOrderModal" data-trash="{{$trash}}"
                                                    data-order="{{$order}}" href="#">{{trans('global.delete')}}</a>
                                                @endif
                                                @if ($trash==1)
                                                <a class="dropdown-item " data-bs-toggle="modal"
                                                    data-bs-target="#restoreOrderModal" data-restore-order="{{$order}}"
                                                    href="#">{{trans('global.restore')}}</a>
                                                @endif


                                            </div>
                                        </div>
                                        @endif

                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
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


    <script src="{{asset('/js/module/order.js')}}" crossorigin="anonymous"></script>

    @endsection