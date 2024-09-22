@extends('frontend/common/master')
@section("headTitle")
Register
@endsection

@section("bodyContent")
<div class="bg-light min-vh-100 d-flex flex-row align-items-center">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <div class="card-group d-block d-md-flex row">
              <div class="card col-md-7  mb-0">
                <div class="card-body">
                  <h1>Register</h1>
                  
                  <p class="text-medium-emphasis">Register new account</p>
                  <form method="post" action="{{url('/register')}}" id="RegisterUserForm" autocomplete="off">
                                @csrf
                                @if ($errors->any())
                            @foreach ($errors->all() as $error)
                            <div class="alert alert-danger" role="alert">
                                    {{$error}}
                                </div>
                            @endforeach
                            @endif
                                
                                <label class="default-input-field custom-input">
                                    <input  type="text"  required="required" id="name" name="name"
                                        aria-describedby="email " autocomplete="false" placeholder="&nbsp;" />
                                    <span class="default-input-placeholder">Name</span>
                                    <span class="default-input-border"></span>
                                </label>

                                <label class="default-input-field custom-input">
                                    <input  type="email"  required="required" id="email" name="email"
                                        aria-describedby="email " autocomplete="false" placeholder="&nbsp;" />
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
                                class="btn-default btn-primary">{{trans('global.register')}}</button>
                    </div>
                    <div class="col-6 text-end">
                      <span>Already have account?</span><a href="{{url('/login')}}" class="btn btn-link px-0" type="button"> Login</a>
                    </div>
                  </div>

                            
                       
                        </form>
                  
                </div>
              </div>
              <div class="card col-md-5 text-white bg-primary py-5">
                <div class="card-body text-center">
                  <div>
                    <h2>Welcome to {{showSiteTitle()}}</h2>
                    <p>{{$settings ? $settings->register_page : ''}}</p>
                    <!-- <a href="{{url('#')}}" class="btn btn-lg btn-outline-light mt-3" type="button">Some Action!</a> -->
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

@endsection

