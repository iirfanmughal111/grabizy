<!-- Modal -->
<!-- <div class="modal fade" id="creatUserModal" tabindex="-1" aria-labelledby="creatUserModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg modal-rotate-custom">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="creatUserModalLabel">User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" action=" " id="addEditUserForm" autocomplete="off">
                    @csrf

                    <div class="mb-3">
                        <label for="Name" class="form-label">Name</label>
                        <input type="text" class="form-control" required id="Name" name="Name" aria-describedby="Name">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">E-mail</label>
                        <input type="email" class="form-control" required id="email" name="email"
                            aria-describedby="email " autocomplete="false">
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" autocomplete="false" class="form-control" id="password" name="password"
                            aria-describedby="password">
                    </div>
                    <div class="mb-3">
                        <label for="Role" class="form-label">Role</label>
                        <select class="form-select" name="role" id="role">
                            @foreach($roles as $role)
                            <option value="{{$role->name}}">{{$role->name}}</option>
                            @endforeach
                        </select>
                    </div>

                    <input type="hidden" class="form-control" value="null" id="userId" name="userId">

            </div>
            <div class="modal-footer">
                <button type="button" class=" btn-default btn-secondary" data-bs-dismiss="modal">{{trans('global.cancel')}}</button>
               
                <button type="submit" id="addEditUserFormBtn" class="btn-default btn-primary">{{trans('global.submit')}}</button>
            </div>
            </form>
        </div>
    </div>
</div> -->



<!--  Modal -->
<div class="modal fade" id="creatUserModal" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-rotate-custom">
        <div class="modal-content overflow-hidden border-0">
            <button class="btn-close p-4 position-absolute top-0 end-0 z-index-20 shadow-0" type="button"
                data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-body p-0">
                <div class="row align-items-stretch">
                    <div class="col-lg-6 p-lg-0">
                        <div class=" d-block h-100 bg-cover image-fluid" style="background: url( )" title="title"><img
                                id="addEditUserImage" class="img-fluid modal-image" src=""></div>
                    </div>
                    <div class="col-lg-6">
                        <div class="p-4 my-md-4">
                            <h2 class="h4">User</h2>
                            <form method="post" action=" " id="addEditUserForm" autocomplete="off">
                                @csrf

                                <label class="default-input-field custom-input">
                                    <input type="text" required id="Name" name="Name"
                                        aria-describedby="Name" placeholder="&nbsp;" />
                                    <span class="default-input-placeholder">Name</span>
                                    <span class="default-input-border"></span>
                                </label>
                                
                                <label class="default-input-field custom-input">
                                    <input  type="email"  required id="email" name="email"
                                        aria-describedby="email " autocomplete="false" placeholder="&nbsp;" />
                                    <span class="default-input-placeholder">Email</span>
                                    <span class="default-input-border"></span>
                                </label>

                                <label class="default-input-field custom-input">
                                    <input  type="password" autocomplete="false" id="password"
                                        name="password" aria-describedby="password" placeholder="&nbsp;" />
                                    <span class="default-input-placeholder">Password</span>
                                    <span class="default-input-border"></span>
                                </label>



                                <div class="mb-3">
                                    <label for="Role" class="form-label">Role</label>
                                    <select class="form-select" name="role" id="role">
                                        @foreach($roles as $role)
                                        <option value="{{$role->name}}">{{$role->name}}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <input type="hidden" class="form-control" value="null" id="userId" name="userId">

                            <button type="button" class=" btn-default btn-secondary"
                                data-bs-dismiss="modal">{{trans('global.cancel')}}</button>

                            <button type="submit" id="addEditUserFormBtn"
                                class="btn-default btn-primary">{{trans('global.submit')}}</button>
                       
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>