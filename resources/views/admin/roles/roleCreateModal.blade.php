<!-- Modal -->
<div class="modal fade" id="creatRoleModal" tabindex="-1" aria-labelledby="creatRoleModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="creatRoleModalLabel">Role</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" action="{{url('admin/roles')}}">
                    @csrf
                    <div class="mb-3">
                        <label for="roleName" class="form-label">Role Name</label>
                        <input type="text" class="form-control" required id="roleName" name="roleName" aria-describedby="roleName">
                    </div>
                    <input type="hidden" class="form-control" required id="roleId" name="roleId" aria-describedby="roleId">

                
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
        </form>
        </div>
    </div>
</div>