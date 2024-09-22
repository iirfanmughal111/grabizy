<!-- Modal -->

<!-- <div class="modal fade" id="deleteUserModal" tabindex="-1" aria-labelledby="deleteUserModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg modal-rotate-custom">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteUserModalLabel">Confirm Delete</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>          
            <div class="modal-body">
            <div class="d-none row d-flex justify-content-center" id="delete-msg-div">
                <div class="col-8" id="delete-msg-div">
                    <div class=" alert alert-danger alert-dismissible fade show" style="padding-bottom:unset;"
                        role="alert">
                        <p id="delete-msg" class=""></p>
                        <button type="button" class="btn-close " data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </div>
            </div>
                <form method="post" action="" autocomplete="off" id="deleteUserForm">
                    @csrf

                    <input type="hidden" class="form-control" value="null" id="deleteUserId" name="userId">
                    <p class="text-center" id="before-delete-msg">Are you sure to delete this user?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class=" btn-default btn-primary " data-bs-dismiss="modal">{{trans('global.cancel')}}</button>
                <button type="submit" class=" btn-default btn-danger" id="deleteUserFormBtn">{{trans('global.delete')}}</button>
            </div>
            </form>
        </div>
    </div>
</div> -->




<!--  Modal -->
<div class="modal fade" id="deletePermUserModal" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-rotate-custom">
        <div class="modal-content overflow-hidden border-0">
            <button class="btn-close p-4 position-absolute top-0 end-0 z-index-20 shadow-0" type="button"
                data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-body p-0">
                <div class="row align-items-stretch">
                    <div class="col-lg-6 p-lg-0">
                    <div class=" d-block h-100 bg-cover image-fluid" style="background: url( )"   title="title"  ><img id="deletePermUserImage" class="img-fluid" src=""></div>
                        </div>
                    <div class="col-lg-6">
                        <div class="p-4 my-md-4">
                            <h2 class="h4">Confirm Delete</h2>
                            <form method="post" action="" autocomplete="off" id="deletePermUserForm">
                    @csrf
                    <input type="hidden" class="form-control" value="null" id="deletePermUserId" name="deletePermUserId">
                    <p class="text" id="before-delete-msg">Are you sure to delete this user?</p>
                    <p class="text-sm my-4 alert alert-warning">All Data  belongs to this user will also deleted.<br> Do you want to delete this user Biddings,Orders,Profile,Notifications?
                    </p>

                <button type="button" class=" btn-default btn-primary " data-bs-dismiss="modal">{{trans('global.cancel')}}</button>
                <button type="submit" class=" btn-default btn-danger permDeleteUserFormBtn" id="deletePermUserFormBtn">{{trans('global.delete')}}</button>

            </form>              
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>