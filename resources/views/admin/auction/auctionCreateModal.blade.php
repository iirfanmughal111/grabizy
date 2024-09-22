<!--  Modal -->
<div class="modal fade" id="createAuctionModal" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-rotate-custom">
        <div class="modal-content overflow-hidden border-0">
            <button class="btn-close p-4 position-absolute top-0 end-0 z-index-20 shadow-0" type="button"
                data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-body p-0">
                <div class="row align-items-stretch">
                    <div class="col-lg-6 p-lg-0">
                        <div class=" d-block h-100 bg-cover image-fluid" style="background: url( )" title="title"><img
                                id="addEditAuctionImage" class="img-fluid modal-image" src=""></div>
                    </div>
                    <div class="col-lg-6">
                        <div class="p-4 my-md-4">
                            <h2 class="h4">Auction</h2>
                            <form method="post" action=" " id="addEditAuctionForm" autocomplete="off">
                                @csrf

                                <label class="default-input-field custom-input">
                                    <input disabled type="text"  id="title" name="title"
                                        aria-describedby="title" placeholder="&nbsp;" />
                                    <span class="default-input-placeholder">Title</span>
                                    <span class="default-input-border"></span>
                                </label>
                               
                                <label class="default-input-field custom-input">
                                    <input type="number" required id="bid_price" name="bid_price"
                                        aria-describedby="bid_price" placeholder="&nbsp;" />
                                    <span class="default-input-placeholder">Bid Price</span>
                                    <span class="default-input-border"></span>
                                </label>
                           
                                <div class="mb-3">
                                    <label for="date" class="form-label">Start Date</label>
                                    <input type="date" class="form-control" id="startDate" name="startDate"
                                       >
                                </div>
                                <div class="mb-3">
                                    <label for="date" class="form-label">End Date</label>
                                    <input type="date" class="form-control" id="endDate" name="endDate"
                                       >
                                </div>
                                <input type="hidden"  id="auc_prodId" name="auc_prodId"
                                       >
                                <div class="mb-3">
                                <p>Bidding:</p>
                                <div class="toggle">
                                    <input type="checkbox" id="active" class="toggle" />
                                    <label></label>
                                </div>
                                </div>





                                <input type="hidden" class="form-control" value="null" id="aucId" name="aucId">

                                <button type="button" class=" btn-default btn-secondary"
                                    data-bs-dismiss="modal">{{trans('global.cancel')}}</button>

                                <button type="submit" id="addEditAuctionFormBtn"
                                    class="btn-default btn-primary">{{trans('global.submit')}}</button>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>