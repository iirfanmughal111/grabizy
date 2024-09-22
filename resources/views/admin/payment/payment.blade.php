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
                <!-- <div class="card-header">Roles Mangement</div> -->
                <div class="card-body">
                    <div class="row ">
                        <div class="col-12 d-flex justify-content-end">
                            <!-- Button trigger modal -->
                            @if(auth()->user()->can('add payment methods'))
                            <button type="button" title="{{trans('global.create_new')}}" class=" btn-default btn-primary" data-bs-toggle="modal"
                                data-bs-target="#creatUserModal">
                                {{trans('global.create_new')}}
                            </button>
                            @endif
                        </div>

                    </div>
                </div>
                @if($users->count())
                <div class="row">
                    <div class="table-responsive px-4" style="min-height:50vh;">
                        
                        <table class="table border mb-0">
                            <thead class="table-light fw-semibold">
                                <tr class="align-middle">
                                    <th>#</th>
                                    <th>Type</th>
                                    <th>Status</th>
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


    @endsection

    @section('additionolJs')

    <!-- <script src="{{asset('/js/module/user.js')}}" crossorigin="anonymous"></script> -->

    @endsection