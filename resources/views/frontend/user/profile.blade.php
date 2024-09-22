@extends('frontend/common/dashboard')

@section("dashboardContent")

<div class="body flex-grow-1 px-3" id="dashboard-content">
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4">
                <div class="card-header">User Profile</div>
                <div class="card-body">
                    <div class="row ">
                        <div class="row">

                            @if ($errors->any())
                            @foreach ($errors->all() as $error)
                            <div class="alert alert-danger" role="alert">
                                {{$error}}
                            </div>
                            @endforeach
                            @endif

                            <div class="col-12">

                                @if(session('status'))
                                <div class="alert alert-success" role="alert">
                                    {{session('status')}}
                                </div>
                                @endif

                            </div>
                        </div>
                        <div class="col-12 ">

                            <form method="post" enctype="multipart/form-data" action="{{url('dashboard/profile')}} "
                                id="addEditProductForm">
                                @csrf
                                <div class="row">
                                    <div class="col-md-4 mb-3">
                                        <p>Profile Image</p>

                                        @if (Auth::user()->Profile && isset(Auth::user()->Profile->profile_image))

                                            <div class="avatar-upload">
                                                <div class="avatar-edit">
                                                <input type='file' id="profile_image"
                                            name="profile_image" onchange="loadFile(event)"  accept=".png, .jpg, .jpeg" />
                                                    <label for="profile_image"><i class="fa-solid fa-pencil"></i></label>
                                                </div>
                                                <div class="avatar-preview">
                                                    <div id="imagePreview" style="background-image: url({{ file_exists(public_path('uploads/user/'.Auth::user()->Profile->profile_image)) ? asset('uploads/user/'.Auth::user()->Profile->profile_image) : asset('/no-image.png') }});">
                                                    </div>
                                                    
                                                    <div class=" mt-0 pt-0">
                                                 <a href="{{asset('uploads/user/'.Auth::user()->Profile->profile_image)}}" class="btn btn-light " style="float: right;" download="{{Auth::user()->Profile->profile_image}}"><i class="fa-solid  fa-cloud-arrow-down"></i></a>
                                            </div>
                                                </div>
                                            </div>
                                       
                                           

                                        <input type="hidden" name="old_image"
                                            value="{{Auth::user()->Profile->profile_image}}" />
                                            @else

                                            <div class="avatar-upload">
                                                <div class="avatar-edit">
                                                    <input type='file' id="profile_image"
                                            name="profile_image" onchange="loadFile(event)"  accept=".png, .jpg, .jpeg" />
                                                    <label for="profile_image"><i class="fa-solid fa-pencil"></i></label>
                                                </div>
                                                <div class="avatar-preview">
                                                    <div id="imagePreview" style="background-image: url({{ file_exists(asset('/no-image.png')) ? asset('/no-image.png') : asset('/no-image.png') }});">
                                                    </div>
                                                </div>
                                            </div>

                                        @endif
                                        <img id="outputImage" class="d-none table-image" />
                                    </div>
                                    <div class="col-md-8">
                                        <div class="row mb-4">
                                            <div class="col-md-6">
                                                <label class="default-input-field custom-input ">
                                                    <input type="text" id="name" name="name"
                                                        value="{{ Auth::user()->name  ?? old('name') }}"
                                                        aria-describedby="title" placeholder="&nbsp;" />
                                                    <span class="default-input-placeholder">Name</span>
                                                    <span class="default-input-border"></span>
                                                </label>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="default-input-field custom-input">
                                                    <input type="email" id="email"
                                                        value="{{ Auth::user()->email  ?? old('email') }}" name="email"
                                                        placeholder="&nbsp;" />
                                                    <span class="default-input-placeholder">Email</span>
                                                    <span class="default-input-border"></span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="row mb-4">
                                            <div class="col-md-6">
                                                <label class="default-input-field custom-input">
                                                    <input type="text" id="phone" name="phone"
                                                        value="{{Auth::user()->Profile->phone  ?? old('phone') }}"
                                                        aria-describedby="phone" placeholder="&nbsp;" />
                                                    <span class="default-input-placeholder">Phone</span>
                                                    <span class="default-input-border"></span>
                                                </label>
                                            </div>
                                            <div class="col-md-6">

                                                <label class="default-input-field custom-input">
                                                    <input type="text" id="company"
                                                        value="{{ Auth::user()->Profile->company  ?? old('company') }}"
                                                        name="company" aria-describedby="company"
                                                        placeholder="&nbsp;" />
                                                    <span class="default-input-placeholder">Comapany</span>
                                                    <span class="default-input-border"></span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="row mb-4">
                                            <div class="col-md-6">
                                                <label class="default-input-field custom-input">
                                                    <input type="number" id="zip" name="zip"
                                                        value="{{ Auth::user()->Profile->zip  ?? old('zip') }}"
                                                        aria-describedby="zip" placeholder="&nbsp;" />
                                                    <span class="default-input-placeholder">Zip Code</span>
                                                    <span class="default-input-border"></span>
                                                </label>
                                            </div>
                                            <div class="col-md-6">

                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-4">
                                        <label for="country" class="form-label">Country</label>
                                        <select name="country" class="countries form-control" id="countryId">
                                            <option value="">Select Country</option>
                                        </select>

                                    </div>
                                    <div class="col-md-4">
                                        <label for="Region" class="form-label">Region</label>

                                        <select name="region" class="states form-control" id="stateId">
                                            <option value="">Select State</option>
                                        </select>
                                        <input type="hidden"
                                            value="{{ Auth::user()->Profile->country  ?? old('country') }}"
                                            id="selected_country">
                                        <input type="hidden"
                                            value="{{ Auth::user()->Profile->region  ?? old('region') }}"
                                            id="selected_region">
                                        <input type="hidden" value="{{ Auth::user()->Profile->city  ?? old('city') }}"
                                            id="selected_city">


                                    </div>
                                    <div class="col-md-4">
                                        <label for="City" class="form-label">City</label>

                                        <select name="city" class="cities form-control" id="cityId">
                                            <option value="">Select City</option>
                                        </select>

                                    </div>

                                </div>


                                <div class="mb-3">

                                    <label class="default-input-field custom-input">
                                        <input type="text"
                                            value="{{ Auth::user()->Profile->address_line1  ?? old('address_line1') }}"
                                           id="address_line1" name="address_line1"
                                            aria-describedby="address_line1" placeholder="&nbsp;" />
                                        <span class="default-input-placeholder">Address Line 1 </span>

                                    </label>
                                </div>
                                    <div class="mb-3">
                                        <label class="default-input-field custom-input" style="height:unset;">
                                            <input type="text"
                                                value="{{ Auth::user()->Profile->address_line2  ?? old('address_line2') }}"
                                                min="0" id="address_line2" name="address_line2"
                                                aria-describedby="address_line2" placeholder="&nbsp;" />
                                            <span class="default-input-placeholder">Address Line 2 </span>
                                            
                                        </label>
                                    </div>
                                
                                <input type="hidden" class="form-control"
                                    value="{{Auth::user()->id ?? 'null'}}" id="user_id" name="user_id">
                                    <input type="hidden" class="form-control"
                                    value="{{Auth::user()->Profile->id ?? 'null'}}" id="profile_id" name="profile_id">

                                <button type="submit" id="addEditProdFormBtn"
                                    class="btn-default btn-primary">{{trans('global.save')}}</button>
                            </form>

                           


                        </div>

                    </div>
                </div>

            </div>
        </div>
        <!-- /.col-->
    </div>
    

    @endsection
    @section("additionolJs")
    <script src="{{asset('js/module/countrystatecity.js')}}"></script>
<script>
    
</script>
    @endsection