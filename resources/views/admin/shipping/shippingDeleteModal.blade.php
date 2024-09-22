
<!--  Modal -->
<div class="modal fade" id="deleteShippingModal" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-rotate-custom">
        <div class="modal-content overflow-hidden border-0">
            <button class="btn-close p-4 position-absolute top-0 end-0 z-index-20 shadow-0" type="button"
                data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-body p-0">
                <div class="row align-items-stretch">
                    <div class="col-lg-6 p-lg-0">
                    <div class=" d-block  h-100 bg-cover image-fluid" style="background: url({{showLogo()}} )"   title="title"  ><img id="deleteShippingImage" class="img-fluid modal-image" src=""></div>
                        </div>
                    <div class="col-lg-6">
                        <div class="p-4 my-md-4">
                            <h2 class="h4">Confirm Delete</h2>
                            <form method="post" action="" autocomplete="off" id="deleteShippingForm">
                                @csrf
                                <input type="hidden" class="form-control" value="null" id="deleteShippingId" name="ShippingId">
                                <p class="text-danger" id="before-delete-msg">Are you sure to delete this Shipping?</p>
                      
                                <button type="button" class=" btn-default btn-primary "
                                    data-bs-dismiss="modal">{{trans('global.cancel')}}</button>
                                <button type="submit" class=" btn-default btn-danger"
                                    id="deleteShippingFormBtn">{{trans('global.delete')}}</button>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>