<form action="{{ url('admin/product') }}" method="POST" id="searchForm">
    @csrf
    <div class="row">
        <div class="col-md-12 mb-4">
            <div class="card h-100">
                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
                            <div class="row">
                                <div class="form-group col-12">
                                    <h6>Search Product</h6>
                                    <div class="row">
                                        <div class="col-md-4 mt-1">
                                            <label class="default-input-field custom-input">
                                                <input type="text" name="title" value="{{isset($filters['title']) ? $filters['title'] : ''}}" id="title" aria-describedby="title"
                                                    placeholder="&nbsp;" />
                                                <span class="default-input-placeholder">Title</span>
                                                <span class="default-input-border"></span>
                                            </label>
                                        </div>

                                        <div class="col-md-4">
                                            <label for="category" class="form-label mb-0 pb-0">Category</label>
                                            <select class="form-select" name="category" id="category"
                                                aria-label="Default select example" data-live-search="true">
                                                <option value="0">Chose Category</option>
                                                <option value="null">Uncategorized</option>

                                                @foreach($categories as $cat)
                                                <option value="{{$cat->id}}" {{isset($filters['category']) &&  $filters['category'] == $cat->id ? 'selected' : ''}}>{{$cat->title}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-md-4 ">
                                        <label for="Visibility" class="form-label mb-0 pb-0">Visibility</label>

                                            <div class="mb-3">
                                                <select class="form-select" name="visibility" aria-label="Default select example">
                                                    <option value="null">Not set</option>
                                                    <option value="1" {{isset($filters['visibility']) &&  $filters['visibility'] == 1 ? 'selected' : ''}}>ON</option>
                                                    <option value="0" {{isset($filters['visibility']) &&  $filters['visibility'] == 0 ? 'selected' : ''}}>OFF</option>

                                                </select>
                                            </div>
                                        </div>
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