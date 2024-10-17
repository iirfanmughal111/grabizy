@extends('frontend/common/master')
@section("headTitle")
Login
@endsection
@section("bodyContent")
<div class="bg-light min-vh-100 d-flex flex-row align-items-center py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card-group d-block d-md-flex row">
                    <div class="card col-md-7  mb-0">
                        <div class="card-body">
                            <h1>Login</h1>
                            <p class="text-medium-emphasis">Sign In to your account</p>
                            @if(session('status'))
                            <div class="alert alert-danger" role="alert">
                                {{session('status')}}
                            </div>
                            @endif
                            <form method="post" action="{{url('login')}}" id="LoginUserForm" autocomplete="off">
                                @csrf
                                @if ($errors->any())
                                @foreach ($errors->all() as $error)
                                <div class="alert alert-danger" role="alert">
                                    {{$error}}
                                </div>
                                @endforeach
                                @endif

                                <label class="default-input-field custom-input">
                                    <input type="email" required="required" value="{{old('email')}}" id="email" name="email" aria-describedby="email " autocomplete="false" placeholder="&nbsp;" />
                                    <span class="default-input-placeholder">Email</span>
                                    <span class="default-input-border"></span>
                                </label>

                                <label class="default-input-field custom-input">
                                    <input id="password" type="password" name="password" value="{{old('password')}}" required="required" autocomplete="current-password" aria-describedby="password" placeholder="&nbsp;" />
                                    <span class="default-input-placeholder">Password</span>
                                    <span class="default-input-border"></span>
                                </label>


                                <div class="mb-3">

                                    <div class="form-check">
                                        <input type="checkbox" id="remember_me" name="remember" class=" form-check-input" />
                                        <label>Remember me</label>
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-6">
                                        <button type="submit" id="addEditUserFormBtn" class="btn-default btn-primary">{{trans('global.login')}}</button>
                                    </div>
                                    <div class="col-6 text-end">
                                        <a href="{{url('/forgot-password')}}" class="btn btn-link px-0" type="button">Forgot password?</a>
                                    </div>
                                </div>
                               

                            </form>
                            <hr class="py-1">
                            
                                <a class="d-flex my-2 align-items-center justify-content-center" href="{{ url('auth/google') }}">
                                    <img src="{{asset('images/googleLogin.png')}}" class="w-50 img-fluid">
                                </a>
                           
                        </div>
                    </div>
                    <div class="card col-md-5 text-white bg-primary py-5">
                        <div class="card-body text-center">
                            <div>
                                <h2>Sign up</h2>
                                <p>{{$settings ?  $settings->login_page : ''}}</p>
                                <a href="{{url('register')}}" class="btn btn-lg btn-outline-light mt-3" type="button">Register Now!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
