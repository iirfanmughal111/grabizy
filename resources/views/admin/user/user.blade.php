@extends('admin/master')
@section("headTitle")
Users
@endsection
@section("bodyContent")
@if(auth()->user()->can('add users') || auth()->user()->can('edit users'))
@include('admin.user.userCreateModal')
@include('admin.user.userRestoreModal')

@endif

@if(auth()->user()->can('delete users'))
@include('admin.user.userDeleteModal')
@include('admin.user.userPermDeleteModal')

@endif
@include('admin.user.viewLocationModal')

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
                <!-- <div class="card-header">Roles Mangement</div> -->
                <div class="card-body">
                    <div class="row ">
                        <div class="col-12 d-flex justify-content-end">
                            <!-- Button trigger modal -->
                            @if(auth()->user()->can('add users'))
                            <button type="button" title="{{trans('global.create_new')}}"
                                class=" btn-default btn-primary" data-bs-toggle="modal"
                                data-bs-target="#creatUserModal">
                                {{trans('global.create_new')}}
                            </button>
                            @endif
                        </div>

                    </div>
                </div>
                @if($users->count())
                <div class="row">
                    <div class="table-responsive p-4" style="min-height:50vh;">
                        @include('admin.user.userSearchForm')
                        <table class="table border mb-0">
                            <thead class="table-light fw-semibold">
                                <tr class="align-middle">
                                    <th>#</th>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>email</th>
                                    <th>Role</th>
                                    <th>Status</th>
                                    <th>Last Active</th>
                                    <th>Ip</th>

                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($users as $key=>$user)
                                <tr class="align-middle table-row" id="user-row-{{$user->id}}">
                                    <td>
                                        <div>{{$key+1}}</div>
                                    </td>
                                    <td>
                                        
                                        <a href="{{url('admin/users/profile/'.$user->id)}}"><img class="table-image"
                                                src="{{ $user->getAvatar() }}" /></a>
                                       
                                    </td>
                                    <td class="text-capitalize">
                                        <a class="nav-link" href="{{url('admin/users/profile/'.$user->id)}}">
                                            <div>{{$user->name}}</div>
                                        </a>

                                    </td>
                                    <td>
                                        <div>{{$user->email}}</div>
                                    </td>

                                    <td class="text-capitalize">
                                        {{ $user->roles->pluck('name')->implode(', ') ? $user->roles->pluck('name')->implode(', ') : 'Not assinged'}}
                                    </td>
                                    <td>
                                        <div class="toggle">
                                            <input type="checkbox" title="{{$user->name}}"
                                                {{ $user->is_active==1 ? 'checked' : '' }} type="checkbox"
                                                id="switch_statusUser" data-user-id="{{$user->id}}"
                                                class="toggle switch_statusUser" />
                                            <label></label>
                                        </div>

                                    </td>
                                    <td>{{ Carbon\Carbon::createFromTimestamp($user->last_active)->toDateTimeString() }}
                                    </td>
                                    <td>
                                        @if ($user->last_ip)
                                    <a class="location-btn ms-2"  data-user="{{$user}}"><i class="fa-regular fa-circle-question"></i></a>
                                            @endif
                                        {{$user->last_ip}}
                                    </td>
                                    <td>
                                        @if(auth()->user()->can('add users') || auth()->user()->can('edit
                                        users') || auth()->user()->can('delete users'))
                                        <div class="dropdown dropup">
                                            <button class="btn btn-transparent p-0" type="button"
                                                data-coreui-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false">
                                                <i class="fa-solid fa-ellipsis-vertical"></i>
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-end">
                                                @if(auth()->user()->can('add users') || auth()->user()->can('edit
                                                users'))
                                                <a class="dropdown-item changeSelected" href="#" data-bs-toggle="modal"
                                                    data-bs-target="#creatUserModal" data-user="{{$user}}"
                                                    data-role="{{ $user->roles->pluck('name')->implode(', ') }}">{{trans('global.edit')}}</a>
                                                @endif
                                                @if(auth()->user()->can('delete users'))
                                                <a class="dropdown-item text-danger " data-bs-toggle="modal"
                                                    data-bs-target="#deleteUserModal" data-userId="{{$user->id}}"
                                                    href="#">{{trans('global.delete')}}</a>
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
        <div class="row">
            <div class="col-12 d-flex justify-content-center">
                {{ $users->links() }}
            </div>
        </div>
    </div>
    @else
    <div class="row d-flex justify-content-center">
        <div class="col-12">
            <p class="text-center"> No Data Found</p>
        </div>
    </div>
    @endif
    <div id="notification" style="z-index:99"></div>

    <!-- @if(session('message'))
{{session('message')}}
@endif -->

    @endsection

    @section('additionolJs')

    <script src="{{asset('/js/module/user.js')}}" crossorigin="anonymous"></script>

    @endsection