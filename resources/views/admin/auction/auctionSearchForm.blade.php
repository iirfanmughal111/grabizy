<form action="{{ url('admin/auction') }}" method="POST" id="searchForm">
    @csrf
    <div class="row">
        <div class="col-md-12 mb-4">
            <div class="card h-100">
                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
                            <div class="row">
                                <div class="form-group col-12">
                                    <h6>Search Auction</h6>
                                    <div class="row">
                                        <!-- <div class="col-md-4 mt-1">
                                            <label class="default-input-field custom-input">
                                                <input type="text" name="title" id="title" aria-describedby="title"
                                                    placeholder="&nbsp;" />
                                                <span class="default-input-placeholder">Title</span>
                                                <span class="default-input-border"></span>
                                            </label>
                                        </div> -->

                                        <!-- <div class="col-md-4">
                                            <label for="category" class="form-label mb-0 pb-0">Category</label>
                                            <select class="form-select" name="category" id="category"
                                                aria-label="Default select example" data-live-search="true">
                                                <option value="0">Chose Category</option>
                                                <option value="null">Uncategorized</option>

                                                
                                            </select>
                                        </div> -->
                                        <div class="col-md-4 ">
                                        <label for="active" class="form-label mb-0 pb-0">Bidding</label>

                                            <div class="mb-3">
                                                <select class="form-select" name="active" aria-label="Default select example">
                                                    <option value="null">Not set</option>
                                                    <option value="1">ON</option>
                                                    <option value="0">OFF</option>

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