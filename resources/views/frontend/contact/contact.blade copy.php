@extends('frontend/common/master')
@section("headTitle")
Contact US
@endsection
@section("bodyContent")
@include('frontend.partials.productViewModal')

<div class="container">

    <section class="py-5 bg-light">
        <div class="container">
            <div class="row px-4 px-lg-5 py-lg-4 align-items-center">
                <div class="col-lg-6">
                    <h1 class="h2 text-uppercase mb-0">Contact Us</h1>
                </div>
                <div class="col-lg-6 text-lg-end">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-lg-end mb-0 px-0 bg-light">
                            <li class="breadcrumb-item"><a class="text-dark" href="{{url('/')}}">Home</a></li>

                            <li class="breadcrumb-item active" aria-current="page">Contact us</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <section class="py-5">
        <!-- <h2 class="h5 text-uppercase mb-4">Who we are</h2> -->
        <div class="row">
           
            <div class="col-lg-8">
                <div class="card border-0 rounded-0 p-lg-4 bg-light">
                    <div class="card-body">
                        <h5 class="text-uppercase mb-4">How we can help you?</h5>
                            <div class="col-12">
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
                            </div>
                        <form action="{{url('contact-us')}}" method="post">
                            @csrf
                            <label class="default-input-field custom-input">
                                 <input type="text" id="name" required value="{{ Auth()->user()->name  ?? old('name') }}" name="name"
                                    aria-describedby="short_description" placeholder="&nbsp;" />
                                    <span class="default-input-placeholder">Name</span>
                                    <span class="default-input-border"></span>
                            </label>

                            <label class="default-input-field custom-input">
                                 <input type="text" id="email" required value="{{ Auth()->user()->email  ?? old('email') }}" name="email"
                                    aria-describedby="short_description" placeholder="&nbsp;" />
                                    <span class="default-input-placeholder">E-mail</span>
                                    <span class="default-input-border"></span>
                            </label>

                            <label class="default-input-field custom-input">
                                 <input type="text" id="subject" required value="{{old('subject') }}" name="subject"
                                    aria-describedby="short_description" placeholder="&nbsp;" />
                                    <span class="default-input-placeholder">Subject</span>
                                    <span class="default-input-border"></span>
                            </label>
                            <div class="my-3 form-floating">
                                    <!-- <p class="mb-0 pb-0"> Message</p> -->
                                    <textarea class="form-control" required placeholder="Type your message"
                                        name="message"  id="message">{{old('message')}}</textarea>
                                        <label for="message">Message</label>
                                </div>
                                <button class="btn btn-sm btn-dark" type="submit">{{trans('global.submit')}}</button>

                        </form>


                        <ul class="list-unstyled mb-0">

                            <li class="border-bottom my-2"></li>

                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-4 mb-lg-0 d-flex justify-content-center flex-column">
                <div class="row">
                    <div class="col-12">
                        <p>{{$settings ? $settings->shop_email : ''}}</p>
                        <p> {{$settings ? $settings->shop_contact : ''}}</p>   
                        <p> {{$settings ? $settings->shop_address : ''}}</p>                      

                    </div>

                    <div class="col-12 d-flex justify-content-center">
                        <ul class="list-inline">
                            <div class="social-buttons">
                                @if ($settings && $settings->twitter_link)
                                <li class="list-inline-item">
                                    <a class="footer-link" href="{{$settings->twitter_link}}">
                                        <i class="fa-brands fa fa-twitter"></i>
                                    </a>
                                </li>
                                @endif
                                @if ($settings && $settings->instagram_link)
                                <li class="list-inline-item">
                                    <a class="footer-link" href="{{$settings->instagram_link}}">
                                        <span class="instagram">
                                            <i class="fa-brands fa fa-instagram"></i>
                                        </span>
                                    </a>
                                </li>
                                @endif

                                @if ($settings && $settings->facebook_link)

                                <li class="list-inline-item">
                                    <a class="footer-link" href="{{$settings->facebook_link}}">
                                        <i class="fa-brands fa fa-facebook-square "></i>
                                    </a>
                                </li>
                                @endif

                                @if ($settings && $settings->whatsapp_link)

                                <li class="list-inline-item">
                                    <a class="footer-link" href="{{$settings->whatsapp_link}}">
                                        <i class="fa-brands fa fa-whatsapp"></i>
                                    </a>
                                </li>
                                @endif

                            </div>
                        </ul>

                    </div>
                </div>
            
            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3580.5370873774445!2d28.110744!3d-26.1792014!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x1e950df8cb772a2f%3A0xfd7dfe363311a10!2sGADGETZ%20SHOP!5e0!3m2!1sen!2s!4v1687676008176!5m2!1sen!2s" width="auto" height="100%" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
 
            </div> 
        </div>
    </section>


</div>




@endsection
@section("additionolJs")
@endsection