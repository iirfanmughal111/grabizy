@include('frontend.partials.topBar')

    <!-- Start Main header -->
    <header class="main-header">
        <!-- Start Navigation -->
        <nav class="navbar navbar-expand-lg p-0 navbar-light bg-light navbar-default bootsnav">
            <div class="container">
                <!-- Start Header Navigation -->
                <div class="navbar-header">
                    <button class="navbar-toggler navbar-toggle-btn" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                  
                @auth <a class="navbar-brand" href="{{url('/')}}"><img src="{{ showLogo() }}" onload="getNotifications()" class="site-logo image-fluid" alt=""></a> @endauth
                @guest <a class="navbar-brand" href="{{url('/')}}"><img src="{{ showLogo() }}" class="site-logo image-fluid" alt=""></a> @endguest
                </div>
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item active"><a class="nav-link" href="{{url('/')}}">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="{{url('/shop/')}}">Shop</a></li>

                            @php
                                $listing = listCateogories();
                            @endphp
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle arrow1" data-toggle="dropdown">Categories</a>
                            <ul class="dropdown-menu">
                                @foreach($listing as $key => $list)
								<li><a href="{{url('shop/category/'.$list->id.'/'.str_replace(' ','-',$list->title.'/'))}}">{{$list->title}}</a></li>
                                @endforeach
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="{{url('/about-us/')}}">About Us</a></li>
                        <li class="nav-item"><a class="nav-link" href="{{url('/contact-us/')}}">Contact Us</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->

                <!-- Start Atribute Navigation -->
                <div class="attr-nav">
                    <ul>
                        <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
                      
                            @auth @include('partials.notification') @endauth
						

                        <li class="side-menu ml-2">
							<a href="{{url('/shop/cart')}}">
								<i class="fa fa-shopping-bag"></i>
								@auth <span class="badge cart-count">{{cartItemsCount()}} </span>@endauth
								<p>My Cart</p>
							</a>
						</li>
                    </ul>
                </div>
                <!-- End Atribute Navigation -->
            </div>
            <!-- Start Side Menu 
            <div class="side">
                <a href="#" class="close-side"><i class="fa fa-times"></i></a>
                <li class="cart-box">
                    <ul class="cart-list">
                        <li>
                            <a href="#" class="photo"><img src="images/img-pro-01.jpg" class="cart-thumb" alt="" /></a>
                            <h6><a href="#">Delica omtantur </a></h6>
                            <p>1x - <span class="price">$80.00</span></p>
                        </li>
                        <li>
                            <a href="#" class="photo"><img src="images/img-pro-02.jpg" class="cart-thumb" alt="" /></a>
                            <h6><a href="#">Omnes ocurreret</a></h6>
                            <p>1x - <span class="price">$60.00</span></p>
                        </li>
                        <li>
                            <a href="#" class="photo"><img src="images/img-pro-03.jpg" class="cart-thumb" alt="" /></a>
                            <h6><a href="#">Agam facilisis</a></h6>
                            <p>1x - <span class="price">$40.00</span></p>
                        </li>
                        <li class="total">
                            <a href="#" class="btn btn-default hvr-hover btn-cart">VIEW CART</a>
                            <span class="float-right"><strong>Total</strong>: $180.00</span>
                        </li>
                    </ul>
                </li>
            </div>
            End Side Menu -->
        </nav>
        <!-- End Navigation -->
    </header>
    <!-- End Main header -->

    <!-- Start Top Search -->
    <div class="top-search">
        <div class="container">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                <input type="text" class="form-control" placeholder="Search">
                <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
            </div>
        </div>
    </div>
    <!-- End Top Search -->



    