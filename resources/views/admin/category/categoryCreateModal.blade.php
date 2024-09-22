<!--  Modal -->
<div class="modal fade" id="creatCategoryModal" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-rotate-custom">
        <div class="modal-content overflow-hidden border-0">
            <button class="btn-close p-4 position-absolute top-0 end-0 z-index-20 shadow-0" type="button"
                data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-body p-0">
                <div class="row align-items-stretch">
                    <div class="col-lg-6 p-lg-0">
                        <div class=" d-block h-100 bg-cover image-fluid" style="background: url( )" title="title"><img
                                id="addEditCatImage" class="img-fluid modal-image" src=""></div>
                    </div>
                    <div class="col-lg-6">
                        <div class="p-4 my-md-4">
                            <h2 class="h4">{{trans('global.category')}}</h2>
                            <form method="post" action="javascript::void() " enctype="multipart/form-data"
                                id="addEditCategoryForm" autocomplete="off">
                                @csrf

                                <label class="default-input-field custom-input">
                                    <input type="text" required id="title" name="title" aria-describedby="title"
                                        placeholder="&nbsp;" />
                                    <span class="default-input-placeholder">Title</span>
                                    <span class="default-input-border"></span>
                                </label>


                                <label class="default-input-field custom-input">
                                    <input type="text" id="description" name="description"
                                        aria-describedby="description" placeholder="&nbsp;" />
                                    <span class="default-input-placeholder">Description</span>
                                    <span class="default-input-border"></span>
                                </label>



                                <div class="mb-3">
                                    <label for="image" class="form-label">Chose featured Photo</label>
                                    <input class="form-control" type="file" name="image" id="image">
                                </div>

                                <div class="mb-3">
                                <p>Active:</p>
                                <div class="toggle">
                                    <input type="checkbox" id="active" class="toggle" />
                                    <label></label>
                                </div>
                                </div>

                                <div class="mb-3">
                                <p>Featured:</p>
                                <div class="toggle">
                                    <input type="checkbox" id="featured" class="toggle" />
                                    <label></label>
                                </div>
                                </div>


                                <div class="mb-3">
                                 <p>Trending:</p>
                                <div class="toggle">
                                    <input type="checkbox" id="trending" class="toggle" />
                                    <label></label>
                                </div>
                                </div>

                                

                                <input type="hidden" class="form-control" value="null" id="catId" name="catId">
                                <input type="hidden" class="form-control" value="null" id="imageId" name="imageId">

                                <button type="button" class=" btn-default btn-secondary"
                                    data-bs-dismiss="modal">{{trans('global.cancel')}}</button>
                                <button type="submit" id="addEditCategoryFormBtn"
                                    class="btn-default btn-primary">{{trans('global.submit')}}</button>

                            </form>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>