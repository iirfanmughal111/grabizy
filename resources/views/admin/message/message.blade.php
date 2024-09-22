@extends('admin/master')
@section("headTitle")
Messages
@endsection

@section("bodyContent")
@include('admin.message.messageViewModal')
<style>
.title {
    color: #757575;
    font-weight: bold;
}

.modal {
    text-align: left;
}

.modal-content {
    border: none;
    border-radius: 2px;
    box-shadow: 0 16px 28px 0 rgba(0, 0, 0, 0.22), 0 25px 55px 0 rgba(0, 0, 0, 0.21);
}

.modal-header {
    border-bottom: 0;
    padding-top: 15px;
    padding-right: 26px;
    padding-left: 26px;
    padding-bottom: 0px;
}

.modal-title {
    font-size: 34px;
}

.modal-body {
    border-bottom: 0;
    padding-top: 5px;
    padding-right: 26px;
    padding-left: 26px;
    padding-bottom: 10px;
    font-size: 15px;
}

.modal-footer {
    border-top: 0;
    padding-top: 0px;
    padding-right: 26px;
    padding-bottom: 26px;
    padding-left: 26px;
}
</style>
<div class="body flex-grow-1 px-3">
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4">
                <div class="card-header">Messages Mangement</div>
                <div class="card-body">
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
                @if($messages->count())
                <div class="row">
                    <div class="table-responsive px-4 mb-3" style="min-height:50vh;">
                        @include('admin.message.messageSearchForm')
                        <table class="table border mb-0">
                            <thead class="table-light fw-semibold">
                                <tr class="align-middle">
                                    <th>#</th>
                                    @if ($filters=='read')
                                    <th>Delete</th>
                                    @endif
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Subject</th>
                                    <th>Message</th>
                                    <th>{{$filters=='read' ? 'Read at'  : 'Date' }}</th>
                                    @if ($filters!='read')

                                    <th>Respond</th>
                                    @endif
                                </tr>

                            </thead>

                            <tbody>
                            @if ($filters=='read')

                                <form action="{{url('admin/messages')}}" method="post">
                                    @csrf
                                    <input type="hidden" value="1" name="action">
                                    @endif
                                    @foreach($messages as $key=>$msg)
                                    <tr class="align-middle " id="message-row-{{$msg->id}}">
                                        <td>
                                            <div>{{$key+1}}</div>
                                        </td>
                                    @if ($filters=='read')

                                        <td>
                                            <div class="form-check">
                                                <input class="form-check-input" name="msg_ids[]" value="{{$msg->id}}" type="checkbox">

                                            </div>
                                        </td>
                                        @endif


                                        <td class="text-capitalize">
                                            <div>{{$msg->name}}</div>
                                        </td>
                                        <td class="text-capitalize">
                                            {{$msg->email}}
                                        </td>
                                        <td>
                                            {{ Str::limit($msg->subject, 20) }}

                                        </td>
                                        <td>

                                            {{ Str::limit($msg->message, 20) }}

                                        </td>
                                        <td>

                                            {{$filters=='read' ? date('F d, Y h:i:s A',$msg->read_at)  : $msg->created_at }}
                                        </td>
                                        @if ($filters!='read')
                                        <td>

                                            <button data-msg="{{$msg}}" data-bs-toggle="modal"
                                                data-bs-target="#viewMessageModal"
                                                class="btn-default px-3 btn-sm btn-primary"><i
                                                    class="fa-brands fa-readme"></i></button>
                                        </td>
                                        @endif
                                    </tr>
                                    @endforeach
                                    @if ($filters=='read')
                                    <button id="formSubmit" class="btn-default btn-danger mb-3">{{trans('global.delete')}}</button>

                                </form>
@endif
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
            {{ $messages->links() }}
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


    <script src="{{asset('/js/module/message.js')}}" crossorigin="anonymous"></script>

    @endsection