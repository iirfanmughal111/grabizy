@extends('admin/master')
@section("headTitle")
Permissions
@endsection

@section("bodyContent")

<div class="body flex-grow-1 px-3">
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4">
                <div class="card-header">Permissions Mangement</div>
              
                @if($permissions->count())
                <div class="row">
                    <div class="table-responsive px-4 my-3" style="min-height:50vh;">

                        <table class="table border mb-0">
                            <thead class="table-light fw-semibold">
                                <tr class="align-middle">
                                    <th>#</th>
                                    <th>Name</th>
                                    <th>Admin<p class="small table-header-text text-muted">Not writable</p></th>
                                    <th>Staff</th>
                                    <th>User <p class="small table-header-text text-muted">Not writable</p></th>
                                </tr>
                            </thead>
                            @if(auth()->user()->can('edit permissions')) 

                            <tbody>

                                @foreach($permissions as $key=>$perm)
                                <tr class="align-middle " id="perm-row-{{$perm->id}}">
                                    <td>
                                        <div>{{$key+1}}</div>
                                    </td>                            
                                    <td class="text-capitalize">
                                        <div>{{$perm->name}}</div>
                                    </td>
                                
                                    <td>
                                        @if ($roles[0]->hasPermissionTo($perm->name))
                                        <div class="toggle">
                                            <input type="checkbox" disabled class="switch_statusUser" checked 
                                                type="checkbox" id="switch_statusUser-{{$perm->id}}" data-role-name="{{$roles[1]->name}}" data-perm-name="{{$perm->name}}" />
                                            <label></label>
                                        </div>
                                        @else
                                        <div class="toggle">
                                            <input type="checkbox" disabled class="switch_statusUser"  
                                                type="checkbox" id="switch_statusUser-{{$perm->id}}" data-role-name="{{$roles[1]->name}}" data-perm-name="{{$perm->name}}" />
                                            <label></label>
                                        </div>

                                        @endif
                          
                                    </td>
                                    <td>
                                    
                                    @if ($roles[1]->hasPermissionTo($perm->name))
                                  
                                        <div class="toggle">
                                            <input type="checkbox"  class="switch_statusStaff" checked 
                                                type="checkbox" id="switch_statusStaff-{{$perm->id}}" data-role-name="{{$roles[1]->name}}" data-perm-name="{{$perm->name}}" />
                                            <label></label>
                                        </div>
                                 
                                        
                                        @else
                                        <div class="toggle">
                                            <input type="checkbox" class="switch_statusStaff"  
                                                type="checkbox" id="switch_statusStaff-{{$perm->id}}" data-role-name="{{$roles[1]->name}}" data-perm-name="{{$perm->name}}" />
                                            <label></label>
                                        </div>

                                        @endif
                                </td>
                                   
                                    <td>
                                    
                                    @if ($roles[2]->hasPermissionTo($perm->name))
                                    <div class="toggle">
                                            <input type="checkbox" disabled class="switch_statusAdmin" checked 
                                                type="checkbox" id="switch_statusAdmin-{{$perm->id}}" data-role-name="{{$roles[2]->name}}" data-perm-name="{{$perm->name}}" />
                                            <label></label>
                                        </div>
                                        @else
                                        <div class="toggle">
                                            <input type="checkbox" disabled class="switch_statusAdmin"  
                                                type="checkbox" id="switch_statusAdmin-{{$perm->id}}" data-role-name="{{$roles[2]->name}}" data-perm-name="{{$perm->name}}" />
                                            <label></label>
                                        </div>

                                        @endif
                                    </td>
                              
                                  
                                </tr>
                                @endforeach
                            </tbody>
                            @endif
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
    @if(auth()->user()->can('edit permissions')) 


    @section('additionolJs')
    <script src="{{asset('/js/module/permissions.js')}}" crossorigin="anonymous"></script>

    @endsection

    @endif