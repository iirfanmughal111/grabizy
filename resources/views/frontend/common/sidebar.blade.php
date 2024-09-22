<!-- Side-Nav -->
<div class="side-navbar navbar-light  d-flex justify-content-between flex-wrap flex-column m-n4" id="sidebar">
    <ul class="nav  flex-column text-white w-100 ms-4">
     
      <a class="link " href="{{url('/')}}"> 
      <img style="width: 46px;" class="avatar-img rounded-circle"
          src="{{ showLogo() }}"
            alt="Logo">
        <span class="text-uppercase ps-2">{{showSiteTitle()}}</span></a>
     
      <li>
        <a href="{{url('dashboard/profile')}}" class="link underline">
        My Profile</a>
      </li>
      <li>
        <a href="{{url('dashboard/change-password')}}" class="link underline">
        Change Password</a>
      </li>
      <li>
        <a href="{{url('dashboard/my-orders')}}" class="link underline">
        My Orders</a>
      </li>

      <li>
        <a href="{{url('dashboard/wish-list')}}" class="link underline">
        WishList</a>
        
      </li>
  
      <li>
        <a href="{{url('shop/cart')}}" class="link underline">
       MY Cart</a>
        
      </li>
      <li>
      <li>
        <a href="{{url('notifications')}}" class="link underline">
       MY Notices</a>
        
      </li>
      <li> 
       <form method="post" action="{{url('logout')}}">
                            @csrf
                            <a class="link underline" href="{{url('logout')}}" onclick="event.preventDefault();
                                        this.closest('form').submit();">
                                <i class="fa-solid fa-arrow-right-from-bracket me-1"></i> Log Out
                            </a>
                        </form>
        
      </li>
    </ul>

    <!-- <span class="ms-3 w-100 mb-5">
      <a class="link underline" href="#">  <i class="fa-brands fa-facebook"></i></a>
      <a class="link underline" href="#">   <i class="fa-brands fa-twitter"></i></a>
      <a class="link underline" href="#">   <i class="fa-brands fa-instagram"></i></i></a>

    </span> -->
  </div>