<form action="{{ url('admin/category') }}" method="POST" id="searchForm" >
		@csrf
	<div class="row">
		<div class="col-md-12 mb-4">
			<div class="card h-100">
				<div class="card-body">
					<div class="row">
						<div class="col-md-6">
						
								
									<h6>Search Category</h6>
									<label class="default-input-field custom-input">
                                    <input type="text" name="title" id="title" value="{{isset($filters['title']) ? $filters['title'] : ''}}" aria-describedby="title"
                                        placeholder="&nbsp;" />
                                    <span class="default-input-placeholder">Title</span>
                                    <span class="default-input-border"></span>
                                </label>

								</div>
									
								
								<div class="col-md-6">
								<label for="active" class="form-label mb-0 pb-0">Type</label>
									<div class="mt-4">
										<select class="selectpicker" name="type" value="" aria-label="Default select example">
											<option value="null" selected>Not set</option>
											<option value="active" {{isset($filters['type']) &&  $filters['type'] == 'active' ? 'selected' : ''}}>Active</option>
											<option value="featured" {{isset($filters['type']) &&  $filters['type'] == 'featured' ? 'selected' : ''}}>Featured</option>
											<option value="trending" {{isset($filters['type']) &&  $filters['type'] == 'trending' ? 'selected' : ''}}>Trending</option>

										</select>
									</div>
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