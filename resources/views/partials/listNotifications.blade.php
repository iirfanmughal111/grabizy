@extends('admin/master')
@section("headTitle")
Notifcations
@endsection

@section("bodyContent")

<div class="body flex-grow-1 px-3">
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4">
                <div class="card-header">Notifications Mangement</div>
                <div class="card-body">
                    @if($notifications->count())

                    <div class="row ">
                        <div class="col-12 d-flex justify-content-end">

                            <form action="{{url('notifications/readAll')}}" method="post">
                                @csrf
                                <button type="submit" class=" btn-default btn-primary">
                                    Read All
                                </button>
                            </form>
                            <form action="{{url('notifications/deleteAll')}}" method="post">
                                @csrf
                                <button type="submit" class=" btn-default btn-danger ms-2">
                                    Delete All
                                </button>
                            </form>
                        </div>

                    </div>
                    @endif

                    <div class="row ">
                        <div class="col-12">

                            @if(session('status'))
                            <div class="alert alert-success" role="alert">
                                {{session('status')}}
                            </div>
                            @endif

                        </div>

                    </div>
                </div>
                @if($notifications->count())
                <div class="row">
                    <div class="table-responsive px-4 mb-3" style="min-height:50vh;">
                        <table class="table border mb-0">
                            <thead class="table-light fw-semibold">
                                <tr class="align-middle">
                                    <th>#</th>
                                    <th>Message</th>
                                    <th>Read at</th>
                                    <th>Read</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($notifications as $key=>$notif)
                                <tr class="align-middle notif-row" id="notif-row-{{$notif->id}}">
                                    <td>
                                        <div>{{$key+1}}</div>
                                    </td>

                                    <td class="">
                                        @php
                                        $data = json_decode($notif->data);
                                        $array = explode(' ',$data->msg);
                                        @endphp

                                        @if ($data->status == 0)
                                        <a class="dropdown-item" href="{{url('admin/users/profile/'.$data->user_id)}}"
                                            id="notif-row-{{$notif->id}}">
                                            <i class="fa-solid fa-user me-2"></i><span>{{$data->msg}}</span></a>
                                        @elseif ($data->status == 1)
                                        <a class="dropdown-item" href="{{url('shop/view-order/'.$array[2])}}"
                                            id="notif-row-{{$notif->id}}">
                                            <i class="fa-solid fa-cart-flatbed me-2"></i><span>{{$data->msg}}</span></a>
                                        @elseif ($data->status == 2)
                                        <a class="dropdown-item" href="{{url('shop/view-order/'.$array[3])}}"
                                            id="notif-row-{{$notif->id}}">
                                            <i class="fa-solid fa-cart-flatbed me-2"></i><span>{{$data->msg}}
                                            </span></a>
                                        @elseif ($data->status == 3)
                                        <a class="dropdown-item" href="{{url('auction/view/'.$array[3].'/aution')}}"
                                            id="notif-row-{{$notif->id}}">
                                            <i class="fa-regular fa-paper-plane me-2"></i><span>{{$data->msg}}</span></a>

                                        @elseif ($data->status == 4)
                                        <a class="dropdown-item" href="{{url('admin/messages')}}"
                                            id="notif-row-{{$notif->id}}">
                                            <i class="fa-regular fa-comment me-2"></i><span>{{$data->msg}}</span></a>

                                        @elseif ($data->status == 5)
                                        <a class="dropdown-item" href="{{url('admin/wishbox/?wish_id='.$array[2].'&active=1&notification='.$notif->id)}}" id="notif-row-{{$notif->id}}"
                                            id="notif-row-{{$notif->id}}">
                                            <i class="fa-regular fa-comment me-2"></i><span>{{$data->msg}}</span></a>

                                        @elseif ($data->status == 6)
                                        <a class="dropdown-item" href="{{url('admin/wishbox/?wish_id='.$array[4].'&active=1&notification='.$notif->id)}}" id="notif-row-{{$notif->id}}"
                                            id="notif-row-{{$notif->id}}">
                                            <i class="fa-regular fa-comment me-2"></i><span>{{$data->msg}}</span></a>
                                        @endif

                                    </td>
                                    <td class="text-capitalize">
                                       
                                        <div id="notif-read_at-{{$notif->id}}">
                                            {{ $notif->read_at!=null ? $notif->read_at : 'Not Read' }}
                                        </div>
                                    </td>
                                    <td>
                                        <button data-notif-id="{{$notif->id}}"
                                            data-title="{{ $notif->read_at!=null ? 'Mark as Read' : 'Mark as Read' }}"
                                            class="readNotifications px-3 btn-default btn-sm btn-primary"><i
                                                id="notif-read-btn-icon-{{$notif->id}}"
                                                class="fa-solid {{ $notif->read_at!=null ? 'fa-envelope-open' : 'fa-envelope' }}"></i></button>
                                    </td>
                                    <td>
                                        <button data-notif-id="{{$notif->id}}"
                                            class="deleteNotifications btn-default px-3 btn-sm btn-danger"><i
                                                class="fa-solid fa-trash"></i></button>
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
            {{ $notifications->links() }}
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