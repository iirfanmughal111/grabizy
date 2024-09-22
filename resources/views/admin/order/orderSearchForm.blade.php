<form action="{{ $trash==0 ? url('admin/orders') : url('admin/orders/trash') }}" method="POST" id="searchForm" >
		@csrf
	<div class="row">
		<div class="col-md-12 mb-4">
			<div class="card h-100">
				<div class="card-body">
					<div class="row">
						<div class="col-md-6">
						
									<h6>Search Order</h6>
									<label class="default-input-field custom-input">
                                        <input type="text" name="order_no" id="order_no" value="{{$filters['order_no'] ? $filters['order_no'] : ''}}"  aria-describedby="order_no"
                                            placeholder="&nbsp;" />
                                        <span class="default-input-placeholder">Order#</span>
                                        <span class="default-input-border"></span>
                                    </label>
                                    
                                    </div>

						<div class="col-md-6 mt-4">
                        <label class="form label"> Select Order Status </label>

							<select class="form-select"  name="order_status"
									data-live-search="true">
								<option value="null"> Select Status </option>
								
								@foreach($status as $st)
								<option {{$filters['status_id'] == $st->id  ? 'selected' : ''}}
									value="{{$st->id}}">{{$st->value}}</option>
								@endforeach
								
							</select>
					</div>

					</div>

					<div class="row">
						<div class="form-group col-lg-6">
							<button type="submit" class="btn-default btn-primary  my-2 mb-lg-0 col-12 col-lg-auto">{{trans('global.submit')}}</button>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>	
</form>