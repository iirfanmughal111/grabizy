<header class="header header-sticky mb-4">
    <div class="container-fluid">
        <button class="header-toggler px-md-0 me-md-3" type="button"
            onclick="coreui.Sidebar.getInstance(document.querySelector('#sidebar')).toggle()">
            <i class="fa-solid fa-bars"></i>
        </button>
        <ul class="header-nav d-none d-md-flex">
            @if (auth()->user()->can('listing dashboard'))
            
                <li class="nav-item"><a class="nav-link" href="{{url('admin/')}}">Dashboard</a></li>
            @endif

            @if (auth()->user()->can('listing users'))
                <li class="nav-item"><a class="nav-link" href="{{url('admin/users')}}">Users</a></li>
            @endif

            @if (auth()->user()->can('listing settings'))
                <li class="nav-item"><a class="nav-link" href="{{url('admin/settings')}}">Settings</a></li>
            @endif

        </ul>
        <ul class="header-nav ms-auto">
            @auth

            @include('partials.notification')

            @if (Auth::user()->can('listing messages'))
          
            <li class="nav-item mt-2 ms-4 me-2">
            <a type="button" class="btn btn-light py-2  btn-sm position-relative" style="padding-left: 12px;padding-right: 12px" href="{{url('admin/messages')}}">
                <i class="fa-regular fa-comment"></i>
                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                    {{unReadMessages()}}
                </span>
            </a>
            </li>
            @endif
        </ul>
        <ul class="header-nav ms-3">
            <li class="nav-item dropdown"><a class="nav-link py-0" data-coreui-toggle="dropdown" href="#" role="button"
                    aria-haspopup="true" aria-expanded="false">
                    <div class="avatar avatar-md"><img style="max-height: 42px;" class="avatar-img rounded-circle"
                            src="{{ file_exists(public_path('uploads/user/'.Auth::user()->Profile->profile_image)) ? asset('uploads/user/'.Auth::user()->Profile->profile_image)  : asset('no-image.png') }}"
                            alt="{{Auth::user()->email}}"></div>
                </a>
                <div class="dropdown-menu dropdown-menu-end pt-0">
                    <div class="dropdown-header bg-light py-2">
                        <div class="fw-semibold">Account</div>
                    </div><a class="dropdown-item" href="{{url('/notifications')}}">
                        <i class="fa-regular fa-bell"></i> Updates<span
                            class="badge badge-sm bg-info ms-2">{{auth()->user()->unreadNotifications->count()}}</span></a>
                            @if (Auth::user()->can('listing messages'))
                            <a
                        class="dropdown-item" href="{{url('admin/messages')}}">
                        <i class="fa-solid fa-comment"></i> Messages<span
                            class="badge badge-sm bg-success ms-2">{{unReadMessages()}}</span></a>
                            @endif
                    <div class="dropdown-header bg-light py-2">
                        <div class="fw-semibold">Settings</div>
                    </div>
                    <a class="dropdown-item" href="{{url('dashboard/profile')}}">
                        <i class="fa-solid fa-user"></i> Profile</a>
                        <a class="dropdown-item" href="{{url('dashboard/change-password')}}">
                        <i class="fa-solid fa-user"></i> Change Password</a>
                    <a class="dropdown-item" href="{{url('admin/settings')}}">
                        <i class="fa-solid fa-gear"></i> Settings</a>

                    <div class="dropdown-divider"></div>
                    <form method="post" action="{{url('logout')}}">
                        @csrf
                        <a class="dropdown-item" href="{{url('logout')}}" onclick="event.preventDefault();
                                        this.closest('form').submit();">
                            <i class="fa-solid fa-arrow-right-from-bracket"></i> Log Out
                        </a>
                    </form>
                </div>
            </li>
        </ul>
        @endauth

    </div>
</header>