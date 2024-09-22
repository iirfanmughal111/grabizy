@extends('frontend/common/dashboard')

@section("dashboardContent")

<div class="body flex-grow-1 px-3" id="dashboard-content">
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4">
                <div class="card-header">Change Password</div>
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

                            <form method="post" action="{{url('dashboard/change-password')}} " id="addEditProductForm">
                                @csrf
                                <div class="row">
                                    <div class="col-md-4 mb-3">
                                        <figure>
                                       
                                        @if (Auth::user()->Profile && isset(Auth::user()->Profile->profile_image))

                                        <img class="profile-avatar  mb-4 border border-2 border-dark shadow"
                                            src="{{ file_exists(public_path('uploads/user/'.Auth::user()->Profile->profile_image)) ? asset('uploads/user/'.Auth::user()->Profile->profile_image) : asset('/no-image.png') }}">


                                        @else
                                        <img class="profile-avatar  mb-4 border border-2 border-dark shadow"
                                            src="{{ file_exists(asset('/no-image.png')) ? asset('/no-image.png') : asset('/no-image.png') }}">
                                        @endif
                                        <figcaption class="text-center">{{Auth::user()->name}}</figcaption>
                                        </figure>

                                    </div>
                                    <div class="col-md-8">
                                        <div class="row mb-4">
                                            <div class="col-12">
                                                <label class="default-input-field custom-input ">
                                                    <input type="password" required id="old_password" name="old_password"
                                                        value="{{old('old_password') }}" aria-describedby="title"
                                                        placeholder="&nbsp;" />
                                                    <span class="default-input-placeholder">Old Password</span>
                                                    <span class="default-input-border"></span>
                                                </label>
                                            </div>

                                        </div>

                                        <div class="row mb-4">
                                            <div class="col-md-6">
                                                <label class="default-input-field custom-input ">
                                                    <input type="password" required id="new_password" name="new_password"
                                                        value="{{old('new_password') }}" aria-describedby="title"
                                                        placeholder="&nbsp;" />
                                                    <span class="default-input-placeholder">New Password</span>
                                                    <span class="default-input-border"></span>
                                                </label>
                                            </div>
                                            <div class="col-md-6">

                                                <label class="default-input-field custom-input ">
                                                    <input type="password" required id="confirm_password" name="confirm_password"
                                                        value="{{old('confirm_password') }}" aria-describedby="title"
                                                        placeholder="&nbsp;" />
                                                    <span class="default-input-placeholder">Confirm Password</span>
                                                    <span class="default-input-border"></span>
                                                </label>
                                            </div>
                                        </div>
                                        <button type="submit" id="addEditProdFormBtn"
                                            class="btn-default btn-primary">{{trans('global.save')}}</button>
                                    </div>
                                </div>


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

    @endsection