@extends('admin/master')
@section("headTitle")
Roles
@endsection

@section("bodyContent")

@include('admin.roles.roleViewModal')

<style>
ol.prefixed {
    counter-reset: item;
    list-style-type: none;
    *list-style-type: decimal; /*Conditional hack for ie7*/
}

ol.prefixed li:before {
    content: 'Q' counter(item, decimal) '. ';
    counter-increment: item;
}

/* The <ol> needs to have its counter-reset redefined for each version you want to create. */
ol.steps { counter-reset: item; }
ol.steps li:before { content: 'Step ' counter(item, decimal) '. '; }

ol.nodot { counter-reset: item; }
ol.nodot li:before { content: 'Step ' counter(item, decimal) ' '; }

ol.styled { counter-reset: item; }
ol.styled li {
    background: rgba(78,68,50,.10);
    border-radius: 4px;
    
    line-height: 2;
    margin-bottom: 10px;
    width: 250px;
}
ol.styled li:before {
    content: '' counter(item, decimal) '';
    background: #4e443c;
    border-radius: 4px;
    color: #f7f7ef;
    margin: 0 5px 0 8px;
    padding: 4px 7px;
}

</style>
<div class="body flex-grow-1 px-3">

    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4 ">
                <div class="card-header">Roles Mangement</div>
                <div class="card-body">
                    <div class="row">
                        <div class="table-responsive px-4" style="min-height:50vh;">
                            <table class="table border mb-4">
                                <thead class="table-light fw-semibold">
                                    <tr class="align-middle">
                                        <th>#</th>
                                        <th>Role</th>
                                        <th class="text-center">Permissions</th>
                                        <th>Users in Role</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($roles as $key=>$role)
                                    <tr class="align-middle text-capitalize">
                                        <td>
                                            <div>{{$key+1}}</div>
                                        </td>
                                        <td>
                                            <div>{{$role->name}}</div>
                                        </td>

                                        <td class="text-center">
                                        {{ $role->permissions->count() > 0 ? Str::limit($role->permissions->pluck('name')->implode(', '), 20) : 'No Permissions assigned' }}</td>
                                        </td>
                                        
                                        </td>
                                        <td>
                                            <div class="fw-semibold">{{$role->users->count()}}</div>
                                        </td>
                                        <td>
                                            <div class="dropdown dropup">
                                                <button class="btn btn-transparent p-0" type="button"
                                                    data-coreui-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false">
                                                    <i class="fa-solid fa-ellipsis-vertical"></i>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-end">
                                                        <a class="dropdown-item" href="#" data-bs-toggle="modal"
                                data-bs-target="#viewRoleModal" data-role="{{$role->permissions->pluck('name')->implode(', ')}}">View Permissions</a></div>
                                            </div>
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
        <!-- /.row-->


<script>

var viewRoleModal = document.getElementById('viewRoleModal')
viewRoleModal.addEventListener('show.bs.modal', function (event) {
  // Button that triggered the modal
  var button = event.relatedTarget;

  var roles = button.getAttribute('data-role');
  let roleList = roles.split(", ");

  if(roles){
    
    let roleHTML = '<ol class=" prefixed styled">'
    for (var i = 0; i < roleList.length; i++){
        roleHTML += '<li >' + roleList[i] + '</li>';
    }
    roleHTML += '</ol>'
    $('#list').html(roleHTML);


  }

})
</script>
        @endsection

        