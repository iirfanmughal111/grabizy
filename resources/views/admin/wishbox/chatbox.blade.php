<style>



    /********************************
    Typography Style
    ******************************** */

  

    /* *******************************
    message-area
    ******************************** */

    .message-area {
        height: 100vh;
        overflow: hidden;
        padding: 30px 0;
        background: #f5f5f5;
    }

    .chat-area {
        position: relative;
        width: 100%;
        background-color: #fff;
        border-radius: 0.3rem;
        height: 90vh;
        overflow: hidden;
        min-height: calc(100% - 1rem);
    }

    .chatlist {
        outline: 0;
        height: 100%;
        overflow: hidden;
        width: 300px;
        float: left;
        /* padding: 15px; */
    }

    .chat-area .modal-content {
        border: none;
        border-radius: 0;
        outline: 0;
        height: 100%;
    }

    .chat-area .modal-dialog-scrollable {
        height: 100% !important;
    }

    .chatbox {
        width: auto;
        overflow: hidden;
        height: 100%;
        border-left: 1px solid #ccc;
    }

    .chatbox .modal-dialog,
    .chatlist .modal-dialog {
        max-width: 100%;
        margin: 0;
    }

    .msg-search {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .chat-area .form-control {
        display: block;
        /* width: 80%; */
        padding: 0.375rem 0.75rem;
        font-size: 14px;
        font-weight: 400;
        line-height: 1.5;
        color: #222;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid #ccc;
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        border-radius: 0.25rem;
        transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
    }

    .chat-area .form-control:focus {
        outline: 0;
        box-shadow: inherit;
    }

    a.add img {
        height: 36px;
    }

    .chat-area .nav-tabs {
        border-bottom: 1px solid #dee2e6;
        align-items: center;
        justify-content: space-between;
        flex-wrap: inherit;
    }

    .chat-area .nav-tabs .nav-item {
        width: 100%;
    }

    .chat-area .nav-tabs .nav-link {
        width: 100%;
        color: #180660;
        font-size: 14px;
        font-weight: 500;
        line-height: 1.5;
        text-transform: capitalize;
        margin-top: 5px;
        margin-bottom: -1px;
        background: 0 0;
        border: 1px solid transparent;
        border-top-left-radius: 0.25rem;
        border-top-right-radius: 0.25rem;
    }

    .chat-area .nav-tabs .nav-item.show .nav-link,
    .chat-area .nav-tabs .nav-link.active {
        color: #222;
        background-color: #fff;
        border-color: transparent transparent #000;
    }

    .chat-area .nav-tabs .nav-link:focus,
    .chat-area .nav-tabs .nav-link:hover {
        border-color: transparent transparent #000;
        isolation: isolate;
    }

    .chat-list h3 {
        color: #222;
        font-size: 16px;
        font-weight: 500;
        line-height: 1.5;
        text-transform: capitalize;
        margin-bottom: 0;
    }

    .chat-list p {
        color: #343434;
        font-size: 14px;
        font-weight: 400;
        line-height: 1.5;
        text-transform: capitalize;
        margin-bottom: 0;
    }

    .chat-list a.d-flex {
        margin-bottom: 15px;
        position: relative;
        text-decoration: none;
    }

    .chat-list .active {
        display: block;
        content: '';
        clear: both;
        position: absolute;
        bottom: 3px;
        left: 34px;
        height: 12px;
        width: 12px;
        background: #00DB75;
        border-radius: 50%;
        border: 2px solid #fff;
    }

    .msg-head h3 {
        color: #222;
        font-size: 18px;
        font-weight: 600;
        line-height: 1.5;
        margin-bottom: 0;
    }

    .msg-head p {
        color: #343434;
        font-size: 14px;
        font-weight: 400;
        line-height: 1.5;
        text-transform: capitalize;
        margin-bottom: 0;
    }

    .msg-head {
        padding: 15px;
        border-bottom: 1px solid #ccc;
    }

    .moreoption {
        display: flex;
        align-items: center;
        justify-content: end;
    }

    .moreoption .navbar {
        padding: 0;
    }

    .moreoption li .nav-link {
        color: #222;
        font-size: 16px;
    }

    .moreoption .dropdown-toggle::after {
        display: none;
    }

    .moreoption .dropdown-menu[data-bs-popper] {
        top: 100%;
        left: auto;
        right: 0;
        margin-top: 0.125rem;
    }

    .msg-body ul {
        overflow: hidden;
    }

    .msg-body ul li {
        list-style: none;
        margin: 15px 0;
    }

    .msg-body ul li.sender {
        display: block;
        width: 100%;
        position: relative;
    }

    .msg-body ul li.sender:before {
        display: block;
        clear: both;
        content: '';
        position: absolute;
        top: -6px;
        left: -7px;
        width: 0;
        height: 0;
        border-style: solid;
        border-width: 0 12px 15px 12px;
        border-color: transparent transparent #f5f5f5 transparent;
        -webkit-transform: rotate(-37deg);
        -ms-transform: rotate(-37deg);
        transform: rotate(-37deg);
    }

    .msg-body ul li.sender p {
        color: #000;
        font-size: 14px;
        line-height: 1.5;
        font-weight: 400;
        padding: 15px;
        background: #f5f5f5;
        display: inline-block;
        border-bottom-left-radius: 10px;
        border-top-right-radius: 10px;
        border-bottom-right-radius: 10px;
        margin-bottom: 0;
    }

    .msg-body ul li.sender p b {
        display: block;
        color: #180660;
        font-size: 14px;
        line-height: 1.5;
        font-weight: 500;
    }

    .msg-body ul li.repaly {
        display: block;
        width: 100%;
        text-align: right;
        position: relative;
    }

    .msg-body ul li.repaly:before {
        display: block;
        clear: both;
        content: '';
        position: absolute;
        bottom: 15px;
        right: -7px;
        width: 0;
        height: 0;
        border-style: solid;
        border-width: 0 12px 15px 12px;
        border-color: transparent transparent #4b7bec transparent;
        -webkit-transform: rotate(37deg);
        -ms-transform: rotate(37deg);
        transform: rotate(37deg);
    }

    .msg-body ul li.repaly p {
        color: #fff;
        font-size: 14px;
        line-height: 1.5;
        font-weight: 400;
        padding: 15px;
        background: #4b7bec;
        display: inline-block;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        border-bottom-left-radius: 10px;
        margin-bottom: 0;
    }

    .msg-body ul li.repaly p b {
        display: block;
        color: #061061;
        font-size: 14px;
        line-height: 1.5;
        font-weight: 500;
    }

    .msg-body ul li.repaly:after {
        display: block;
        content: '';
        clear: both;
    }

    .time {
        display: block;
        color: #000;
        font-size: 12px;
        line-height: 1.5;
        font-weight: 400;
    }

    li.repaly .time {
        margin-right: 20px;
    }

    .divider {
        position: relative;
        z-index: 1;
        text-align: center;
    }

    .msg-body h6 {
        text-align: center;
        font-weight: normal;
        font-size: 14px;
        line-height: 1.5;
        color: #222;
        background: #fff;
        display: inline-block;
        padding: 0 5px;
        margin-bottom: 0;
    }

    .divider:after {
        display: block;
        content: '';
        clear: both;
        position: absolute;
        top: 12px;
        left: 0;
        border-top: 1px solid #EBEBEB;
        width: 100%;
        height: 100%;
        z-index: -1;
    }

    .send-box {
        padding: 15px;
        border-top: 1px solid #ccc;
    }

    /* .send-box form {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 15px;
    } */

    .send-box .form-control {
        display: block;
        /* width: 85%; */
        padding: 0.375rem 0.75rem;
        font-size: 14px;
        font-weight: 400;
        line-height: 1.5;
        color: #222;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid #ccc;
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        border-radius: 0.25rem;
        transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
    }

    .send-box button {
        border: none;
        background: #3867d6;
        padding: 0.375rem 5px;
        color: #fff;
        border-radius: 0.25rem;
        font-size: 14px;
        font-weight: 400;
        width: 24%;
        margin-left: 1%;
    }

    .send-box button i {
        margin-right: 5px;
    }

    .send-btns .button-wrapper {
        position: relative;
        width: 125px;
        height: auto;
        text-align: left;
        margin: 0 auto;
        display: block;
        background: #F6F7FA;
        border-radius: 3px;
        padding: 5px 15px;
        float: left;
        margin-right: 5px;
        margin-bottom: 5px;
        overflow: hidden;
    }

    .send-btns .button-wrapper span.label {
        position: relative;
        z-index: 1;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        width: 100%;
        cursor: pointer;
        color: #343945;
        font-weight: 400;
        text-transform: capitalize;
        font-size: 13px;
    }

    #upload {
        display: inline-block;
        position: absolute;
        z-index: 1;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        opacity: 0;
        cursor: pointer;
    }

    .send-btns .attach .form-control {
        display: inline-block;
        width: 120px;
        height: auto;
        padding: 5px 8px;
        font-size: 13px;
        font-weight: 400;
        line-height: 1.5;
        color: #343945;
        background-color: #F6F7FA;
        background-clip: padding-box;
        border: 1px solid #F6F7FA;
        border-radius: 3px;
        margin-bottom: 5px;
    }

    .send-btns .button-wrapper span.label img {
        margin-right: 5px;
    }

    .button-wrapper {
        position: relative;
        width: 100px;
        height: 100px;
        text-align: center;
        margin: 0 auto;
    }

    button:focus {
        outline: 0;
    }

    .add-apoint {
        display: inline-block;
        margin-left: 5px;
    }

    /* .add-apoint a {
        text-decoration: none;
        background: #F6F7FA;
        border-radius: 8px;
        padding: 8px 8px;
        font-size: 13px;
        font-weight: 400;
        line-height: 1.2;
        color: #343945;
    } */

    .add-apoint a svg {
        margin-right: 5px;
    }

    .chat-icon {
        display: none;
    }

    .closess i {
        display: none;
    }



    @media (max-width: 767px) {
        .chat-icon {
            display: block;
            margin-right: 5px;
        }
        .chatlist {
            width: 100%;
        }
        .chatbox {
            width: 100%;
            position: absolute;
            left: 1000px;
            right: 0;
            background: #fff;
            transition: all 0.5s ease;
            border-left: none;
        }
        .showbox {
            left: 0 !important;
            transition: all 0.5s ease;
        }
        .msg-head h3 {
            font-size: 14px;
        }
        .msg-head p {
            font-size: 12px;
        }
        .msg-head .flex-shrink-0 img {
            height: 30px;
        }
        .send-box button {
            width: 28%;
        }
        .send-box .form-control {
            /* width: 70%; */
        }
        .chat-list h3 {
            font-size: 14px;
        }
        .chat-list p {
            font-size: 12px;
        }
        .msg-body ul li.sender p {
            font-size: 13px;
            padding: 8px;
            border-bottom-left-radius: 6px;
            border-top-right-radius: 6px;
            border-bottom-right-radius: 6px;
        }
        .msg-body ul li.repaly p {
            font-size: 13px;
            padding: 8px;
            border-top-left-radius: 6px;
            border-top-right-radius: 6px;
            border-bottom-left-radius: 6px;
        }
        }
        .chat-user-image{
            width:40px;
            height:40px;
            radius:50px;
        }
</style>

@extends('admin/master')
@section("headTitle")
Wishbox
@endsection
@section("bodyContent")
    <!-- char-area -->
    <section class="message-area">

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="chat-area">
                        
                        <!-- chatlist -->
                        
                        <div class="chatlist">
                            <div class="modal-dialog-scrollable">
                                <div class="modal-content p-3">
                                   
                                    <div class="chat-header">
                                        <div class="msg-search">
                                            <form action="{{url('admin/wishbox')}}" method="post">
                                                @csrf
                                                <div class="row">
                                                    <div class="col-8">
                                                      <input type="text" class="form-control"  placeholder="Search" aria-label="search" name="title">  
                                                    </div>
                                                    <div class="col-4">
                                                    <button type="submit" class="btn btn-light rounded" id="inlineFormInputGroup"><i class="fa-solid fa-magnifying-glass"></i> </button>
                                                        
                                                    </div>
                                                </div>                                                                                  
                                            </form>
                                            
                                        </div>
                                      
                                    </div>

                                    <div class="modal-body">
                                        <!-- chat-list -->
                                        <div class="chat-lists">  
                                            @php
                                            $status = $type==1 ? '&type=completed' : '';

                                            @endphp                                       
                                                  @foreach($wishs as $wish)
                                                    <div class="chat-list">
                                                        <a href="{{url('admin/wishbox?wish_id='.$wish->id.'&active=1'.$status)}}" class="d-flex align-items-center" type="button">
                                                            <div class="flex-shrink-0">
                                                               
                                                                @if ($wish->User->Profile && isset($wish->User->Profile->profile_image))
                                                                <img class="img-fluid chat-user-image rounded-circle" src="{{profile_photo($wish->User->Profile->profile_image)}}" alt="user img">
                                                                @else
                                                                <img class="img-fluid chat-user-image rounded-circle" src="{{showLogo()}}" alt="user img">
                                                                @endif
                                                                @if ($selected->id==$wish->id)
                                                                <span class="active"></span>
                                                                @endif
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <h3>{{$wish->wish_title}}</h3>
                                                                <p>{{$wish->User->name}} </p>
                                                                <p class="text-small text-muted text-lowercase"> {{ $wish->User->email }}</p>
                                                            </div>
                                                        </a>
                                                    </div>
                                                    @endforeach

                                                   
                                        </div>
                                        <!-- chat-list -->
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- chatbox -->
                        <div class="chatbox {{$active==1 ? 'showbox' : ''}}">
                            <div class="modal-dialog-scrollable">
                                <div class="modal-content">
                                    <div class="msg-head">
                                        <div class="row">
                                            <div class="col-8">
                                                <div class="d-flex align-items-center">
                                                <span class="chat-icon"><img class="img-fluid" src="https://mehedihtml.com/chatbox/assets/img/arroleftt.svg" alt="image title"></span>
                                                    <div class="flex-shrink-0">
                                                        @if ($selected && $selected->User->Profile && isset($selected->User->Profile->profile_image))
                                                            <img class="img-fluid chat-user-image rounded-circle" src="{{profile_photo($selected->User->Profile->profile_image)}}" alt="user img">
                                                        @else
                                                            <img class="img-fluid chat-user-image rounded-circle" src="{{showLogo()}}" alt="user img">
                                                        @endif
                                                        
                                                    </div>
                                                    <div class="flex-grow-1 ms-3">
                                                        <h3 class="text-capitalize">{{$selected->wish_title ?? ''}} - {{$selected ? $selected->User->name : ''}} </h3>
                                                        <p class="text-lowercase">{{ Str::limit($selected ?$selected->User->email  : 'Wishbox empty', 30) }}
                                                        </p>
                                                        
                                                    </div>
                                                </div>
                                            </div>

                                        <div class="col-md-4">
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
                                        @elseif($selected && auth()->user()->can('reply wishbox'))
                                        @php
                                        $complete = $selected->is_complete ? 0 : 1
                                        @endphp
                                        <div class="d-flex justify-content-end">
                                           
                                            <a href="{{url('admin/wishbox?wish_id='.$selected->id.'&active=1&complete='.$complete)}}" class=" btn-default {{$selected->is_complete ? 'btn-danger' : 'btn-primary'}} btn-primary btn-sm">{{$selected->is_complete ? 'Restore' : 'Complete'}}</a>
                                        </div>
                                        @endif
                                        </div>    
                                        </div>
                                    </div>

                                    <div class="modal-body">
                                        <div class="msg-body">
                                        @if ($selected)
                                            <ul>
                                                <li class="sender">
                                                    <p> {{$selected->wish_title }} </p>
                                                    <span class="time">{{$selected->created_at}}</span>
                                                </li>
                                                @if ($selected->wish_description)
                                                <li class="sender">
                                                    <p> {{$selected->wish_description }}</p>
                                                    <span class="time">{{$selected->created_at}}</span>
                                                </li>
                                                @endif
                                                @if($selected->wish_gallery)
                                                @foreach(json_decode($selected->wish_gallery) as $gallery)
                                                
                                                    <li class="repaly">
                                                    <img class=" chat-image img-fluid"
                                                        src="{{ file_exists(public_path('uploads/wishbox/'.$gallery)) ? asset('uploads/wishbox/'.$gallery) : asset('/no-image.png') }}">
                                                        <span class="time">{{($selected->created_at)}}</span>
                                                    </li>
                                                @endforeach
                                                @endif

                                     
                                                @foreach($selected->Chat as $chat)
                                                <li class="{{$chat->user_from==Auth::user()->id ? 'repaly' : 'sender'}}">
                                                    <p> {{($chat->message)}} </p>
                                                    
                                                    @if($chat->msg_gallery)
                                                        @foreach(json_decode($chat->msg_gallery) as $gallery)
                                                
                                                        <li class="repaly ">
                                                        <img class=" chat-image img-fluid"
                                                            src="{{ file_exists(public_path('uploads/wishbox/'.$gallery)) ? asset('uploads/wishbox/'.$gallery) : asset('/no-image.png') }}">
                                                            <span class="time">{{($selected->created_at)}}</span>
                                                        </li>
                                                        @endforeach
                                                    @endif
                                                    <span class="time">{{($chat->created_at)}}</span>
                                                </li>
                                                @endforeach

                                            </ul>
                                            @endif

                                        </div>
                                    </div>


                                    <div class="send-box">
                                        <form action="{{url('admin/message-save')}}" method="post" enctype="multipart/form-data">
                                            @csrf
                                            <div class="row">
                                                <div class="col-12">
                                                    <input type="text" class="form-control" aria-label="message…" placeholder="Write message…" name="message">
                                                </div>
                                                    <div class="col-12 d-flex justify-content-end mt-3">
                                                    <input type="hidden" class="form-control" aria-label="message" name="wish_id" value="{{$selected ? $selected->id : 0}}" placeholder="Write message…">

                                                    <div class="send-btns">
                                                        <div class="attach">
                                                            <div class="button-wrapper">
                                                                <span class="label">
                                                                    <img class="img-fluid" src="https://mehedihtml.com/chatbox/assets/img/upload.svg" alt="image title"> attach file 
                                                                </span>
                                                                <input type="file" name="gallery[]" id="upload" class="upload-box" placeholder="Upload File" aria-label="Upload File" accept="image/*" multiple>
                                                            
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <button type="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i> Send</button>

                                                    </div>
                                            
                                                
                                            </div>

                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- chatbox -->


                </div>
            </div>
        </div>
        </div>
    </section>
    <!-- char-area -->

    @endsection
@section("additionolJs")

<script>
     jQuery(document).ready(function() {

    $(".chat-list a").click(function() {
        //$.session.set("set", "showbox");
     //   sessionStorage.setItem('set','showbox');
    //    $(".chatbox").addClass('showbox');
     //   return false;
    });
  //  console.log(sessionStorage.getItem('set'));

    $(".chat-icon").click(function() {
        $(".chatbox").removeClass('showbox');
    });


     });
</script>
@endsection
