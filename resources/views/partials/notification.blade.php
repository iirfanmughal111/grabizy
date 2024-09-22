
<li class="nav-item user-notifcations" style="max-width:326px">
    <ul class="header-nav ms-3 p-0 mt-2">
        <li class="nav-item dropdown" style="list-style-type: none;">
            <a type="button" onclick="getNotifications()" aria-haspopup="true" aria-expanded="false"
                  {{(request()->is('admin/*')) ? "data-coreui-toggle=dropdown"  : "data-bs-toggle=dropdown" }}   class="btn btn-light position-relative">
                <i class="fa-regular fa-bell"></i>
                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                    <span id="box-badge">{{auth()->user()->unreadNotifications->count()}} </span>
                    <!-- <span class="visually-hidden">unread messages</span> -->
                </span>
            </a>
            <div class="dropdown-menu {{(request()->is('admin/*')) ? "dropdown-menu-end"  : "dropdown-menu-right" }}  pt-0" id="notifications" >
                <div class="dropdown-header bg-light py-2">
                    <div class="row">
                        <div class="col">
                            <div class="fw-semibold"><a href="{{url('notifications')}}" class="nav-link"> Notifcations </a></div>
                        </div>
                        @if (auth()->user()->unreadNotifications->count())
                        <div class="col d-flex justify-content-end">
                            <form action="{{url('notifications/readAll')}}" method="post">
                        @csrf
                        <button type="submit" style="padding-left:10px;padding-right:8px;" data-title="Read All"
                            class="title-popover  btn-default btn-primary ">
                            <i class="fa-solid fa-envelope-circle-check"></i>
                        </button>
                    </form>

                        </div>
                        @endif
                    </div>
                </div>
                <span id="box"></span>
            </div>
        </li>
    </ul>
</li>


<script>
function getNotifications() {

    $.ajax({
        type: 'get',
        url: '/get-notifications',

        success: function(data) {


            $("#append").remove();
            $("#badge").remove();
            $(".not-record-found").remove();
            var e = $('<span></span>');
            $('#box').append(e);
            e.attr('id', 'append');
            var e = $('<span></span>');
            $('#box-badge').append(e);
            e.attr('class', 'badge badge-danger ml-2');

            if (data.html == '') {

                $('#badge').append(data.unreadcount);
                $("#notifications").remove();
                $('#append').after(
                    '<div class="row not-record-found justify-content-center">Not Record Found</div>');

            } else {

                $('#badge').append(data.unreadcount);
                $("#append").append(data.html);

            }





        },
        error: function(xhr, status, error) {
            console.log(xhr.responseText);
        }
    });
}
</script>