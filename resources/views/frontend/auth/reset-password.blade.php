@extends('frontend/common/master')
@section("headTitle")
Home
@endsection

@section("bodyContent")
<div class="bg-light min-vh-100 d-flex flex-row align-items-center">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <div class="card-group d-block d-md-flex row">
              <div class="card col-md-7  mb-0">
                <div class="card-body">
                  <h1>New Password</h1>
                  
                  <p class="text-medium-emphasis">Reset password</p>
                  <form method="post" action="{{url('/reset-password')}}" id="RegisterUserForm" autocomplete="off">
                                @csrf
                                @if ($errors->any())
                            @foreach ($errors->all() as $error)
                            <div class="alert alert-danger" role="alert">
                                    {{$error}}
                                </div>
                            @endforeach
                            @endif
            <input type="hidden" name="token" value="{{ $request->route('token') }}">
                                
                               

                                <label class="default-input-field custom-input">
                                    <input  type="email"  required="required" id="email" name="email"
                                        aria-describedby="email" value="{{old('email', $request->email)}}" autocomplete="false" placeholder="&nbsp;" />
                                    <span class="default-input-placeholder">Email</span>
                                    <span class="default-input-border"></span>
                                </label>

                                <label class="default-input-field custom-input">
                                    <input  id="password" type="password" name="password" required="required" autocomplete="current-password" aria-describedby="password" placeholder="&nbsp;" />
                                    <span class="default-input-placeholder">Password</span>
                                    <span class="default-input-border"></span>
                                </label>
                                
                              
                                <label class="default-input-field custom-input">
                                    <input  id="password_confirmation" type="password" name="password_confirmation" required="required" autocomplete="current-password" aria-describedby="password" placeholder="&nbsp;" />
                                    <span class="default-input-placeholder">Confirm Password</span>
                                    <span class="default-input-border"></span>
                                </label>

                                <div class="row mt-3">
                    <div class="col-6">
                    <button type="submit" id="addEditUserFormBtn"
                                class="btn-default btn-primary">{{trans('global.reset')}}</button>
                    </div>
                    <div class="col-6 text-end">
                      <span>Remeber Password?</span><a href="{{url('/login')}}" class="btn btn-link px-0" type="button"> Login</a>
                    </div>
                  </div>

                            
                       
                        </form>
                  
                </div>
              </div>
              <div class="card col-md-5 text-white bg-primary py-5">
                <div class="card-body text-center">
                  <div>
                    <h2>Some text</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    <a href="{{url('#')}}" class="btn btn-lg btn-outline-light mt-3" type="button">Some Action!</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

@endsection

