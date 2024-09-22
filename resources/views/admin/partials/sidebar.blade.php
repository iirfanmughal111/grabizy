<div class="sidebar sidebar-dark sidebar-fixed sidebar_container" id="sidebar">
<div class="sidebar-brand d-none d-md-flex">
     <a class="nav-link" target="_blank"href="{{url('/')}}"> 
      <img style="width: 46px;" class="avatar-img rounded-circle"
          src="{{ showLogo() }}"
            alt="Logo">
        <span class="text-capitalize ps-2">{{showSiteTitle()}}</span></a>
      </div>
      <ul class="sidebar-nav" data-coreui="navigation" data-simplebar="">
        <li class="nav-item"><a class="nav-link" href="{{url('admin')}}">
        <i class="fa-solid fa-gauge-high nav-icon"></i> 
        Dashboard
        @if (auth()->user()->unreadNotifications->count() > 0 || unReadMessages() > 0)
        <span class="badge badge-sm bg-info ms-auto">NEW</span>
        @endif
      </a>
      </li>
        @if (auth()->user()->can('listing permissions') || auth()->user()->can('listing roles'))
        <li class="nav-title">Roles & Permissions</li>
        @if (auth()->user()->can('listing roles'))
          <li class="nav-item"><a class="nav-link" href="{{url('admin/roles')}}">
        <i class="fa-solid fa-hand-sparkles  nav-icon"></i></i> Roles</a></li>
        @endif
        @if (auth()->user()->can('listing permissions'))

        <li class="nav-item"><a class="nav-link" href="{{url('admin/permissions')}}">
        <i class="fa-solid fa-arrow-down-up-lock nav-icon"></i> Permissions</a></li>
        @endif
       
        @endif
        <li class="nav-title">Store</li>
        @if (auth()->user()->can('listing categories'))

        <li class="nav-item"><a class="nav-link" href="{{url('admin/category')}}">
        <i class="fa-brands fa-squarespace nav-icon"></i></i> Category</a></li>
        @endif

        @if (auth()->user()->can('listing product'))

        <li class="nav-group"><a class="nav-link nav-group-toggle" href="#">
        <i class="fa-solid fa-box-open nav-icon"></i>Products</a>
          <ul class="nav-group-items">
          <li class="nav-item"><a class="nav-link" href="{{url('admin/product')}}">
        <i class="fa-solid fa-box-open nav-icon"></i> Products</a></li>
        @if (auth()->user()->can('add product'))

        <li class="nav-item"><a class="nav-link" href="{{url('admin/product/create')}}">
        <i class="fa-solid fa-circle nav-icon"></i> Create Product</a></li>
        @endif

          </ul>
        </li>
        @endif
        @if (auth()->user()->can('listing orders'))
        
        <li class="nav-item"><a class="nav-link" href="{{url('admin/orders')}}">
        <i class="fa-solid fa-truck-fast  nav-icon"></i> Orders</a></li>
        @endif

        @if (auth()->user()->can('listing users'))

        <li class="nav-item"><a class="nav-link" href="{{url('admin/users')}}">
        <i class="fa-solid fa-users nav-icon"></i> Users</a></li>
        @endif
<!--
        <li class="nav-item"><a class="nav-link" href="widgets.html">
        <i class="fa-solid fa-user nav-icon"></i> Widgets<span class="badge badge-sm bg-info ms-auto">NEW</span></a></li>
        <li class="nav-divider"></li>
-->
        @if (auth()->user()->can('listing trash') && auth()->user()->can('edit trash'))

        <li class="nav-title">{{trans('global.trash')}}</li>
        <li class="nav-group"><a class="nav-link nav-group-toggle" href="#">
        <i class="fa-solid fa-trash-can nav-icon"></i> All Trashes</a>
          <ul class="nav-group-items">
            <li class="nav-item"><a class="nav-link" href="{{url('admin/users/trash')}}" target="_top">
            <i class="fa-solid fa-user-slash nav-icon"></i> Users</a></li>
            <li class="nav-item"><a class="nav-link" href="{{url('admin/category/trash')}}" target="_top">
            <i class="fa-solid fa-cubes-stacked nav-icon"></i> Categories</a></li>
            <li class="nav-item"><a class="nav-link" href="{{url('admin/orders/trash')}}" target="_top">
            <i class="fa-solid fa-truck-fast nav-icon"></i> Orders</a></li>
          </ul>
        </li>
        @endif

        @if (auth()->user()->can('listing extras') && auth()->user()->can('edit extras'))
        <li class="nav-divider"></li>
        <li class="nav-title">Extras</li>
        <li class="nav-group"><a class="nav-link nav-group-toggle" href="#">
        <i class="fa-solid fa-gear nav-icon"></i> Extras</a>
          <ul class="nav-group-items">
          @if (auth()->user()->can('listing banner'))
          <li class="nav-item"><a class="nav-link" href="{{url('admin/settings/banner')}}" target="_top">
            <i class="fa-solid fa-ticket nav-icon"></i>Promotional Banner</a></li>
          @endif
          @if (auth()->user()->can('reply wishbox'))
          <li class="nav-item"><a class="nav-link" href="{{url('admin/wishbox?active=1&type=completed')}}" target="_top">
            <i class="fa-solid fa-people-carry-box nav-icon"></i>Completed Wishboxes</a></li>
          @endif

            <li class="nav-item"><a class="nav-link" href="{{url('admin/messages/read')}}" target="_top">
            <i class="fa-regular fa-comment nav-icon"></i>Old Messages</a></li>
            <li class="nav-item"><a class="nav-link" href="{{url('/notifications')}}" target="_top">
            <i class="fa-solid fa-bell nav-icon"></i>All Notices</a></li>
            <li class="nav-item"><a class="nav-link" href="{{url('admin/status')}}" target="_top">
            <i class="fa-solid fa-envelope-open-text nav-icon"></i>Order Messages </a></li>
            <li class="nav-item"><a class="nav-link" href="{{url('admin/shop/shipping')}}" target="_top">
            <i class="fa-solid fa-truck-ramp-box nav-icon"></i></i>Shipping Zones </a></li>
          </ul>
        </li>
        @endif
        <li class="nav-item">
        <form action="{{url('/logout')}}" method="post">
                @csrf
                <a class="nav-link" href="{{url('/logout')}}" onclick="event.preventDefault();
                                        this.closest('form').submit();" type="submit">
            <i class="fa-solid fa-arrow-right-from-bracket nav-icon"></i>Logout</a>
              </form>
      </li>
      </ul>
      <button class="sidebar-toggler" type="button" data-coreui-toggle="unfoldable"></button>
    </div>