@extends('frontend/common/master')
@section("headTitle")
Privacy Policy
@endsection
@section("bodyContent")
<div class="container">
    <section class="py-5 bg-light">
        <div class="container">
            <div class="row px-4 px-lg-5 py-lg-4 align-items-center">
                <div class="col-lg-6">
                    <h1 class="h2 text-uppercase mb-0">Privacy Policy</h1>
                </div>
                <div class="col-lg-6 text-lg-end">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-lg-end mb-0 px-0 bg-light">
                            <li class="breadcrumb-item"><a class="text-dark" href="{{url('/')}}">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Privacy Policy</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <section class="py-5">
        <!-- <h2 class="h5 text-uppercase mb-4">Who we are</h2> -->
        <div class="row">
            <div class="col-12">
                <div class="card border-0 rounded-0 p-lg-4 bg-light">
                    <div class="card-body">
                        <h5 class="text-uppercase mb-4">Our Privary Policy</h5>
                        {!! $settings->privacy_policy !!}
                    </div>
                </div>
            </div>
            
        </div>
    </section>
</div>




@endsection
@section("additionolJs")
@endsection