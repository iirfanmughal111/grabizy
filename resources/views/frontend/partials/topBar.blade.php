<div class="main-top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<!-- <div class="custom-select-box">
                        <select id="basic" class="selectpicker show-tick form-control" data-placeholder="$ USD">
							<option>¥ JPY</option>
							<option>$ USD</option>
							<option>€ EUR</option>
						</select>
                    </div> -->
                    <div class="right-phone-box">
                        <p>Call US : <a href="tel:{{getStoreContact()}}"> {{getStoreContact()}}</a></p>
                    </div>
                    <div class="our-link">
                        <ul>
                             @php
                                $listing = listCateogories();
                            @endphp
                            @auth
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle arrow1" data-toggle="dropdown">
                            <!-- @if (Auth::user()->Profile && isset(Auth::user()->Profile->profile_image))
                            <img  class="avatar-img rounded-circle user-logo p-0" title="{{Auth::user()->name}}" src="{{ file_exists(public_path('uploads/user/'.Auth::user()->Profile->profile_image)) ? asset('uploads/user/'.Auth::user()->Profile->profile_image)  : asset('no-image.png') }}"
                            alt="no-image">
                            @else
                            <img  class="avatar-img rounded-circle user-logo p-0" title="{{Auth::user()->name}}" src="{{ asset('no-image.png') }}"
                            alt="no-image">
                            @endif    -->
                            {{ Str::limit(Auth::user()->name, 19) }}
                            
                            </a>
                            <ul class="dropdown-menu" style="background-color:#000;">
                                @if(Auth::check() && Auth::user()->hasRole('admin'))
                                    <li><a href="{{url('/admin')}}">Admin Dashboard</a></li>
                                @endif
								
                              
								<li><a href="{{url('/dashboard')}}">Dashboard</a></li>
								<li><a href="{{url('/dashboard/my-orders')}}">My Orders</a></li>
								<li><a href="{{url('/dashboard/wish-list')}}">My WishList</a></li>
								<li><a href="{{url('/notifications')}}">My Notices</a></li>  
                                <li>
                                <form method="post" action="{{url('logout')}}">
                                    @csrf
                                    <a href="{{url('logout')}}" onclick="event.preventDefault();
                                                this.closest('form').submit();">
                                        <i class="fa-solid fa-arrow-right-from-bracket me-1"></i> Log Out
                                    </a>
                                </form>
                            </li>
                            </ul>
                        </li>
                        @endauth
                           @guest <li><a href="{{url('/dashboard')}}"><i class="fa fa-user s_color"></i> My Account</a></li>  @endguest
                            <li><a href="{{getSocialLink('whatsapp_link')}}"><i class="fa-brands fa-whatsapp"></i> Whatsapp us</a></li>
                            <!-- <li><a href="{{url('/contact-us')}}"><i class="fas fa-headset"></i> Contact Us</a></li> -->
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<!-- <div class="login-box">
						<select id="basic" class="selectpicker show-tick form-control" data-placeholder="Sign In">
							<option><a href="{{url('/login')}}">Register Here</a></option>
							<option>Sign In</option>
						</select>
					</div> -->
                    <div class="text-slid-box">
                        <div id="offer-box" class="carouselTicker">
                            <ul class="offer-box">
                                <li>
                                    <i class="fab fa-opencart"></i> Welcome to the {{showSiteTitle()}}
                                </li>
                                <li>
                                    <i class="fab fa-opencart"></i> Upto 10% - 20% off on Mens collection
                                </li>
                                <li>
                                    <i class="fab fa-opencart"></i> Off upto 10%! Shop Now
                                </li>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>