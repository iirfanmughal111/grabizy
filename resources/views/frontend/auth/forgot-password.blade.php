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
                  <h1>Reset Password</h1>
                  
                  <p class="text-medium-emphasis">
            Forgot your password? No problem. Just let us know your email address and we will email you a password reset link that will allow you to choose a new one.
        </p>
                  <form method="post" action="{{url('/forgot-password')}}" id="RegisterUserForm" autocomplete="off">
                                @csrf
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
                                       @else

                                <label class="default-input-field custom-input">
                                    <input  type="email"  required="required" id="email" name="email"
                                        aria-describedby="email " autocomplete="false" placeholder="&nbsp;" />
                                    <span class="default-input-placeholder">Email</span>
                                    <span class="default-input-border"></span>
                                </label>

                                <div class="row mt-3">
                    <div class="col-6">
                    <button type="submit"
                                class="btn-default btn-primary">{{trans('global.submit')}}</button>
                    </div>
                    <div class="col-6 text-end">
                      <span>Remember Passwod?</span><a href="{{url('/login')}}" class="btn btn-link px-0" type="button"> Login</a>
                    </div>
                  </div>
                  @endif
                        </form>
                  
                </div>
              </div>
              <div class="card col-md-5 text-white bg-primary py-5">
                <div class="card-body text-center">
                  <div>
                    <h2>Some text</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    <a href="{{url('/')}}" class="btn btn-lg btn-outline-light mt-3" type="button">Home</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

@endsection

