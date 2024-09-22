@extends('frontend/common/master')
@section("headTitle")
Contact US
@endsection
@section("bodyContent")


    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Contact Us</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active"> Contact Us </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Contact Us  -->
    <div class="contact-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-sm-12">
                    <div class="contact-form-right">
                        <h2>GET IN TOUCH</h2>
                        <p>If you require any more information or have any questions about us, please feel free to contact us by email at <b>{{showSiteTitle()}}</b>.</p>
                        @if(session('status'))
                                <div class="alert alert-success" role="alert">
                                    {{session('status')}}
                                </div>
                               @else
                        <form action="{{url('contact-us')}}" method="post">
                            @csrf
                            <div class="row">
                                <div class="col-12">
                                @if ($errors->any())
                                    @foreach ($errors->all() as $error)
                                    <div class="alert alert-danger" role="alert">
                                            {{$error}}
                                    </div>
                                    @endforeach
                                @endif

                             
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" required value="{{ Auth()->user()->name  ?? old('name') }}" name="name" placeholder="Your Name" required data-error="Please enter your name">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="email" placeholder="Your Email" class="form-control" required value="{{ Auth()->user()->email  ?? old('email') }}" name="email" data-error="Please enter your email">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control"id="subject" required value="{{old('subject') }}" name="subject" placeholder="Subject" required data-error="Please enter your Subject">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <textarea class="form-control" id="message" placeholder="Your Message" rows="4" data-error="Write your message" name="message" required>  {{old('message')}}</textarea>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    <div class="submit-button text-center">
                                        <button class="btn hvr-hover" id="submit" type="submit">Send Message</button>
                                        <div id="msgSubmit" class="h3 text-center hidden"></div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        @endif
                    </div>
                </div>
				<div class="col-lg-4 col-sm-12">
                    <div class="contact-info-left">
                        <h2>CONTACT INFO</h2>
                        <p>Welcome to <strong>{{showSiteTitle()}}!</strong> We're thrilled to have you here, and we're here to assist you in any way we can. Your satisfaction is our top priority, and we believe in providing exceptional customer service.

Whether you have questions about our products, need assistance with an order, or just want to say hello, our dedicated customer support team is here to help.</p>
                        <ul>
                            @if(getStoreAddress())
                            <li>
                                <p><i class="fas fa-map-marker-alt"></i>Address: {{getStoreAddress()}} </p>
                            </li>
                            @endif
                            @if(getStoreContact())
                            <li>
                                <p><i class="fas fa-phone-square"></i>Phone: <a href="tel:{{getStoreContact()}}">{{getStoreContact()}}</a></p>
                            </li>
                            @endif
                            @if(getStoreEmail())
                            <li>
                                <p><i class="fas fa-envelope"></i>Email: <a href="mailto:{{getStoreEmail()}}">{{getStoreEmail()}}</a></p>
                            </li>
                            @endif
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Cart -->
@endsection
@section("additionolJs")
@endsection