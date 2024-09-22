@foreach ($userlist as $key=>$notification)
@if($notification['status']=='0') 
<!-- user registered -->

<a class="dropdown-item  notification-link" href="{{url('admin/users/profile/'.$notification['user_id'].'?notification='.$notification['id'])}}" id="notif-row-{{$notification['id']}}">
    <i class="fa-solid fa-user me-2"></i><span>User <strong>{{$notification['name']}}</strong> registerd </span></a>
    <div class=" d-flex justify-content-between px-3">
  <a data-title='Delete' class="py-0 px-1 title-popover nav-link text-danger deleteNotifications"  data-notif-id="{{$notification['id']}}" type="button"><i class="fa-solid fa-trash"></i></a>
  <a data-title="Mark as Read"   class="py-0 title-popover px-1 nav-link readNotifications" type="button"  data-notif-id="{{$notification['id']}}" ><i class="fa-solid fa-envelope-circle-check"></i></a>
</div>
    <div class="dropdown-divider"></div>
@endif
@php
$array = explode(' ',$notification['msg']);
@endphp
@if($notification['status']=='1') 
<!-- new order placed for admins/staffs -->
<a class="dropdown-item  notification-link" href="{{url('shop/view-order/'.$array[2].'?notification='.$notification['id'])}}" id="notif-row-{{$notification['id']}}">
<i class="fa-solid fa-cart-flatbed me-2"></i><span>New Order Placed by <strong>{{$notification['name']}}</strong></span></a>
    <div class=" d-flex justify-content-between px-3">
  <a data-title='Delete' class="py-0 px-1 title-popover nav-link text-danger deleteNotifications"  data-notif-id="{{$notification['id']}}" type="button"><i class="fa-solid fa-trash"></i></a>
  <a data-title="Mark as Read"   class="py-0 title-popover px-1 nav-link readNotifications" type="button"  data-notif-id="{{$notification['id']}}" ><i class="fa-solid fa-envelope-circle-check"></i></a>
</div>
    <div class="dropdown-divider"></div>
@endif
@if($notification['status']=='2') 
<!-- order placed+status_Update for user(order placer) -->

<a class="dropdown-item  notification-link" href="{{url('shop/view-order/'.$array[4].'?notification='.$notification['id'])}}" id="notif-row-{{$notification['id']}}">
<i class="fa-solid fa-cart-flatbed me-2"></i><span>{{$notification['msg']}}</span></a>
    <div class=" d-flex justify-content-between px-3">
  <a data-title='Delete' class="py-0 px-1 title-popover nav-link text-danger deleteNotifications"  data-notif-id="{{$notification['id']}}" type="button"><i class="fa-solid fa-trash"></i></a>
  <a data-title="Mark as Read"   class="py-0 title-popover px-1 nav-link readNotifications" type="button"  data-notif-id="{{$notification['id']}}" ><i class="fa-solid fa-envelope-circle-check"></i></a>
</div>
    <div class="dropdown-divider"></div>
@endif
@if($notification['status']=='3') 
<!-- bid on auction -->

<a class="dropdown-item  notification-link" href="{{url('admin/auction/bidding/'.$array[3].'/aution'.'?notification='.$notification['id'])}}" id="notif-row-{{$notification['id']}}">
<i class="fa-regular fa-paper-plane me-2"></i><span>{{$notification['msg']}}</span></a>
    <div class=" d-flex justify-content-between px-3">
  <a data-title='Delete' class="py-0 px-1 title-popover nav-link text-danger deleteNotifications"  data-notif-id="{{$notification['id']}}" type="button"><i class="fa-solid fa-trash"></i></a>
  <a data-title="Mark as Read"   class="py-0 title-popover px-1 nav-link readNotifications" type="button"  data-notif-id="{{$notification['id']}}" ><i class="fa-solid fa-envelope-circle-check"></i></a>
</div>
    <div class="dropdown-divider"></div>
@endif

@if($notification['status']=='4') 
<!-- message from contact us form-->

<a class="dropdown-item  notification-link" href="{{url('admin/messages/'.'?notification='.$notification['id'])}}" id="notif-row-{{$notification['id']}}">
<i class="fa-regular fa-comment me-2"></i><span>{{$notification['msg']}}</span></a>
    <div class=" d-flex justify-content-between px-3">
  <a data-title='Delete' class="py-0 px-1 title-popover nav-link text-danger deleteNotifications"  data-notif-id="{{$notification['id']}}" type="button"><i class="fa-solid fa-trash"></i></a>
  <a data-title="Mark as Read"   class="py-0 title-popover px-1 nav-link readNotifications" type="button"  data-notif-id="{{$notification['id']}}" ><i class="fa-solid fa-envelope-circle-check"></i></a>
</div>
    <div class="dropdown-divider"></div>
@endif

@if($notification['status']=='5') 
<!-- new wish placed by user -->
<a class="dropdown-item  notification-link" href="{{url('admin/wishbox/?wish_id='.$array[2].'&active=1&notification='.$notification['id'])}}" id="notif-row-{{$notification['id']}}">
<i class="fa-regular fa-comment me-2"></i><span>{{$notification['msg']}}</span></a>
    <div class=" d-flex justify-content-between px-3">
  <a data-title='Delete' class="py-0 px-1 title-popover nav-link text-danger deleteNotifications"  data-notif-id="{{$notification['id']}}" type="button"><i class="fa-solid fa-trash"></i></a>
  <a data-title="Mark as Read"   class="py-0 title-popover px-1 nav-link readNotifications" type="button"  data-notif-id="{{$notification['id']}}" ><i class="fa-solid fa-envelope-circle-check"></i></a>
</div>
    <div class="dropdown-divider"></div>
@endif

@if($notification['status']=='6') 
<!-- new message on wish by user -->
<a class="dropdown-item  notification-link" href="{{url('admin/wishbox/?wish_id='.$array[4].'&active=1&notification='.$notification['id'])}}" id="notif-row-{{$notification['id']}}">
<i class="fa-regular fa-comment me-2"></i><span>{{$notification['msg']}}</span></a>
    <div class=" d-flex justify-content-between px-3">
  <a data-title='Delete' class="py-0 px-1 title-popover nav-link text-danger deleteNotifications"  data-notif-id="{{$notification['id']}}" type="button"><i class="fa-solid fa-trash"></i></a>
  <a data-title="Mark as Read"   class="py-0 title-popover px-1 nav-link readNotifications" type="button"  data-notif-id="{{$notification['id']}}" ><i class="fa-solid fa-envelope-circle-check"></i></a>
</div>
    <div class="dropdown-divider"></div>
@endif

@if($notification['status']=='7') 
<!-- new message on wish by admin -->
<a class="dropdown-item  notification-link" href="{{url('/wishbox/?wish_id='.$array[7].'&active=1&notification='.$notification['id'])}}" id="notif-row-{{$notification['id']}}">
<i class="fa-regular fa-comment me-2"></i><span>{{$notification['msg']}}</span></a>
    <div class=" d-flex justify-content-between px-3">
  <a data-title='Delete' class="py-0 px-1 title-popover nav-link text-danger deleteNotifications"  data-notif-id="{{$notification['id']}}" type="button"><i class="fa-solid fa-trash"></i></a>
  <a data-title="Mark as Read"   class="py-0 title-popover px-1 nav-link readNotifications" type="button"  data-notif-id="{{$notification['id']}}" ><i class="fa-solid fa-envelope-circle-check"></i></a>
</div>
    <div class="dropdown-divider"></div>
@endif


@if($notification['status']=='8')
<div class="row mt-1 notification">

    <div class="col-xs-12 col-sm-12 col-md-4 left-content">


        <img id="user-image" src="{{$notification['imagePath']}}" width="50px" />

    </div>


    <div class="col-xs-12 col-sm-12 col-md-8 right-content">
        <div class="user-notify">
            <p>{{$notification['name']}} reject request</p>

            <ul class="button-list">

                <li> <a href="{{url('add-frnd')}}/{{$notification['user_id']}}?notify_id={{$notification['id']}}"
                        class="btn btn-default friend">Add Friend</a></li>

            </ul>

        </div>
    </div>
</div>
@endif

@endforeach