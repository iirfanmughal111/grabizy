@extends('admin/master')
@section("headTitle")
Shipping
@endsection

@section("bodyContent")

<div class="body flex-grow-1 px-3">
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4">
                <div class="card-header">Shipping Zone</div>
                <div class="card-body">
                    <div class="row">
                        <div class="row">
                            @if ($errors->any())
                            @foreach ($errors->all() as $error)
                            <div class="alert alert-danger" role="alert">
                                    {{$error}}
                                </div>
                            @endforeach
                            @endif
                                    @if(session('status'))
                                <div class="alert alert-success" role="alert">
                                    {{session('status')}}
                                </div>

                                @endif             
                            <div class="col-12 d-flex justify-content-end">

                                
                                <a type="button" href="{{url('admin/')}}" class=" btn-default btn-danger"
                                    data-bs-dismiss="modal">Cancel</a>

                            </div>
                        </div>
                        <div class="col-12 ">

                        <form method="post" action="{{url('admin/shop/shipping/create')}} ">
                                @csrf
                                <div class="row">
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="country" class="form-label">Country</label>
                                        <select name="country" class="countries form-control" id="countryId">
                                            <option value="">Select Country</option>
                                        </select>
                                        <input type="hidden"
                                            value="{{ $shipping->country  ?? old('country') }}"
                                            id="selected_country">
                                        <input type="hidden"
                                            value="{{ $shipping->region  ?? old('region') }}"
                                            id="selected_region">
                                        <input type="hidden" value="{{ $shipping->city  ?? old('city') }}"
                                            id="selected_city">

                                    </div>

                                    <div class="col-md-6">
                                        <label for="Region" class="form-label">Region</label>

                                        <select name="region" class="states form-control" id="stateId">
                                            <option value="">Select State</option>
                                        </select>
                                    </div>
                                     </div>
                                     <div class="row">
                                        <div class="col-md-6">
                                            <label class="default-input-field custom-input">
                                            <input type="number"
                                                value="{{ $shipping->weight_from  ?? old('weight_from') }}"
                                                min="0" id="weight_from" name="weight_from"
                                                aria-describedby="weight_from" placeholder="&nbsp;" />
                                                <span class="default-input-placeholder">Weight From (In Grams) </span>
                                                <span class="default-input-border"></span>
                                            </label>

                                        </div>
                                     
                                        <div class="col-md-6">
                                            <label class="default-input-field custom-input">
                                            <input type="number"
                                                value="{{ $shipping->weight_to  ?? old('weight_to') }}"
                                                min="0" id="weight_to" name="weight_to"
                                                aria-describedby="weight_to" placeholder="&nbsp;" />
                                                <span class="default-input-placeholder">Weight To (In Grams) </span>
                                                <span class="default-input-border"></span>
                                            </label>
                                       
                                    
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-md-6">
                                        <label class="default-input-field custom-input">

                                            <input type="number"
                                                value="{{ $shipping->cost  ?? old('cost') }}"
                                                min="0" id="cost" name="cost"
                                                aria-describedby="cost" placeholder="&nbsp;" />
                                                <span class="default-input-placeholder">Cost </span>
                                                <span class="default-input-border"></span>
                                            </label>
                                         
                                        </div>
                                        <input type="hidden" class="form-control"
                                    value="{{$shipping->id ?? 'null'}}" id="shipping_id" name="shipping_id">
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <p class="mb-0 pt-0">Active</p>
                                                    <div class="toggle">
                                                        @if (isset($shipping))
                                                        <input type="checkbox" class="switch_statusProduct"
                                                            {{ $shipping->is_active==1 ? 'checked' : '' }} type="checkbox" id="is_active"
                                                            name="is_active" data-is_active="" />
                                                        @else
                                                        <input type="checkbox" class="switch_statusProduct" {{ old('is_active') == 'on' ? 'checked' : '' }} type="checkbox"
                                                            id="is_active" name="is_active" data-visibility="" />
                                                        @endif

                                                        <label></label>
                                                    </div>
                                                </div>
                                                    <div class="col-md-6 mt-3">
                                                        <button type="submit" id="addEditProdFormBtn"
                                                        class="btn-default btn-primary">{{trans('global.save')}}</button>
                                                    </div>
                                                </div>

                                      
                                        </div>
                                    </div>
  

                               

                              
                                    

                               

                            </form>


                        </div>


                        </div>

                    </div>
                </div>

            </div>
        </div>
        <!-- /.col-->
    </div>

    @endsection


    @section('additionolJs')

    <script src="{{asset('js/module/countrystatecity.js')}}"></script>


    @endsection