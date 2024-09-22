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

<div class="body flex-grow-1 px-3">
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4">
                <div class="card-header">{{trans('global.trash')}}</div>

                @if($users->count())
                <div class="row">
                    <div class="table-responsive px-4 my-3" style="min-height:50vh;">
                        
                        <table class="table border mb-0">
                            <thead class="table-light fw-semibold">
                                <tr class="align-middle">
                                    <th>#</th>
                                    <th>Name</th>
                                    <th>email</th>
                                    <th>Role</th>
                                    <th>Status</th>
                                    <th>Deleted Date</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($users as $key=>$user)
                                <tr class="align-middle " id="user-row-{{$user->id}}">
                                    <td>
                                        <div>{{$key+1}}</div>
                                    </td>
                                    <td class="text-capitalize">
                                        <div>{{$user->name}}</div>
                                    </td>
                                    <td>
                                        <div>{{$user->email}}</div>
                                    </td>

                                    <td class="text-capitalize">
                                        {{ $user->roles->pluck('name')->implode(', ') }}
                                    </td>
                                    <td>
                                    <div class="toggle">
                                        <input type="checkbox" title="{{$user->name}}" disabled {{ $user->is_active==1 ? 'checked' : '' }}
                                                type="checkbox" id="switch_statusUser" data-user-id="{{$user->id}}" class="toggle switch_statusUser" />
                                        <label></label>
                                    </div>
                                    </td>
                                    <td>
                                        <div>{{$user->deleted_at}}</div>
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
                                            @if(auth()->user()->can('add users') || auth()->user()->can('edit users'))
                                                <a class="dropdown-item changeSelected" href="#" data-bs-toggle="modal"
                                                    data-bs-target="#restoreUserModal" data-restore-user="{{$user}}"
                                                    data-restor-role="{{ $user->roles->pluck('name')->implode(', ') }}">{{trans('global.restore')}}</a>
                                                    @endif
                                                    @if(auth()->user()->can('delete users'))
                                                    <a
                                                    class="dropdown-item text-danger " data-bs-toggle="modal"
                                                    data-bs-target="#deletePermUserModal" data-perm-userId="{{$user->id}}"
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
    </div>
    @else
    <div class="row d-flex justify-content-center">
        <div class="col-12">
            <p class="text-center"> No Data Found</p>
        </div>
    </div>
    @endif
    <div id="notification"></div>

    <!-- @if(session('message'))
{{session('message')}}
@endif -->

    @endsection

    @section('additionolJs')

    <script src="{{asset('/js/module/user.js')}}" crossorigin="anonymous"></script>
<script>

</script>
    @endsection