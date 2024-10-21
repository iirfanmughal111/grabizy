<form action="{{ url('admin/users') }}" method="POST" id="searchForm">
    @csrf
    <div class="row">
        <div class="col-md-12 mb-4">
            <div class="card h-100">
                <div class="card-body">
                    <div class="row">
                        <div class="form-group">
                            <h6>Search User</h6>
                            <div class="row">
                                <div class="col-md-4 mb-md-0 mb-3">
                                    <label class="default-input-field custom-input">
                                        <input type="text"  name="name" value="{{isset($filters['name']) ? $filters['name'] : ''}}"
                                            aria-describedby="description" placeholder="&nbsp;" />
                                        <span class="default-input-placeholder">Search by Name</span>
                                        <span class="default-input-border"></span>
                                    </label>
                                    
                                </div>
                                <div class="col-md-4">
                                <label class="default-input-field custom-input">
                                        <input type="text"  name="email"
                                            aria-describedby="description" value="{{isset($filters['email']) ? $filters['email'] : ''}}" placeholder="&nbsp;" />
                                        <span class="default-input-placeholder">Search by E-mail</span>
                                        <span class="default-input-border"></span>
                                    </label>

                                </div>
                            <div class="col-md-3">
                                <label class="form-label p-0 m-0">
                                    <span class="default-input-placeholder">Role</span>

                                    </label>
                                    <select class="form-control  my-0 select-picker" name="role">
                                        <option value="">Select Role</option>
                                        @foreach($roles as $role)
                                        <option value="{{$role->name}}" {{isset($filters['role']) && $filters['role'] == $role->name ? 'selected' : ''}}>{{$role->name}}</option>
                                        @endforeach
                                    </select>
                                       
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="form-group col-lg-6">
                            <button type="submit"
                                class="btn-default btn-primary  my-2 mb-lg-0 col-12 col-lg-auto">{{trans('global.submit')}}</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>