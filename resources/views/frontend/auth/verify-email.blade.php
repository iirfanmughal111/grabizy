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
                <div class="card-body py-5">
                  <h1>Verify Email</h1>
                  
                  <p class="text-medium-emphasis">Thanks for signing up! </p>
                  <div class="row ">
                        <div class="col-12">
                        @if(session('status'))
                                <div class="alert alert-success" role="alert">
                                    {{session('status')}}
                                </div>
                                @endif
                        </div>
                      </div>
                  <form method="post" action="{{url('email/verification-notification')}}"  autocomplete="off">
                                @csrf
                                @if ($errors->any())
                            @foreach ($errors->all() as $error)
                            <div class="alert alert-danger" role="alert">
                                    {{$error}}
                                </div>
                            @endforeach
                            @endif
                            
                                


                                <div class="row mt-3">
                    <div class="col-6">
                    <button type="submit" 
                                class="btn-default btn-primary">{{trans('global.send')}}</button>
                    </div>

                  </div>

                        </form>
                  
                </div>
              </div>
              <div class="card col-md-5 text-white bg-primary py-5">
                <div class="card-body ">
                  <div>
                    <h2>Sign up</h2>
                    <p>Before getting started, could you verify your email address by clicking on the link we just emailed to you? If you didn't receive the email, we will gladly send you another.
A new verification link has been sent to the email address you provided during registration.</p>
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

