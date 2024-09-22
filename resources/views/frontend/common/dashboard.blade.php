@extends('frontend/common/master')
@section("headTitle")
Dashbord
@endsection

<style>
.side-navbar {
  width: 250px;
  height: 100%;
  position: fixed;
  top:0 !important;
  margin-left: -300px;
  background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
  transition: 0.5s;
  z-index: 10;
}

.my-container {
  transition: 0.4s;
}

.active-nav {
  margin-left: 0 !important;
}

/* for main section */
.active-cont {
  margin-left: 250px;
}

#menu-btn {
  background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
  color: #fff;
  margin-left: -41px;
  position: -webkit-sticky !important; /* Safari */
  position: sticky !important;
  top: 0;
z-index: 10;
}

.my-container input {
  border-radius: 2rem;
  padding: 2px 20px;
  /* height: 100%; */
}
</style>
@section("dashBoardBodyContent")
@include("frontend.common.sidebar")

  <!-- Main Wrapper -->
  <div class="my-container ">
    @if(!isset(Auth::user()->email_verified_at))
    <div class="row px-5">
      <div class="col">
      <div class="alert alert-success" role="alert">
        Please verify your email address <a href="{{url('verify-email')}}" class="alert-link">here</a>. So you can receive emails.
      </div>
      </div>
    </div>
    @endif
    <!-- Top Nav -->
    <nav class="navbar top-navbar navbar-light  px-5" style="display:initial;">
      <a class="btn border-0" id="menu-btn"><i class="fa-solid fa-bars"></i></a>
    </nav>

    <!--End Top Nav -->
    @yield('dashboardContent')
    
  </div>
  <script>

var menu_btn = document.querySelector("#menu-btn");
var side_bar_nav = document.querySelector("#side-bar-nav");

var sidebar = document.querySelector("#sidebar");
var container = document.querySelector(".my-container");
var content = document.querySelector("#dashboard-content");

menu_btn.addEventListener("click", () => {
  sidebar.classList.toggle("active-nav");
  container.classList.toggle("active-cont");
});
sidebar.addEventListener("click", () => {
  sidebar.classList.toggle("active-nav");
  container.classList.toggle("active-cont");
});

content.addEventListener("click", () => {
  sidebar.classList.remove("active-nav");
  container.classList.remove("active-cont");
});

  </script>
@endsection

@section("additionolJs")
  <script>

var menu_btn = document.querySelector("#menu-btn");
var sidebar = document.querySelector("#sidebar");
var container = document.querySelector(".my-container");
menu_btn.addEventListener("click", () => {
  sidebar.classList.toggle("active-nav");
  menu_btn.classList.toggle("align-right");

  container.classList.toggle("active-cont");
});


  </script>
@endsection
