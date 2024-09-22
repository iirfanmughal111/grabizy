@extends('admin/master')
@section("headTitle")
Biddings
@endsection
@section("bodyContent")

<div class="body flex-grow-1 px-3">
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4">
                <!-- <div class="card-header">Roles Mangement</div> -->
               
                @if($biddings->count())
                <div class="row">
                    <div class="col-md-4 px-5 mt-5">
                        <h5>About Auction</h5>
                        <hr>
                        <a href="{{url('/auction/view/'.$biddings[0]->Auction->id.'/'.str_replace(' ','-', $biddings[0]->Auction->Product->title))}}">
                            <img style="width:100%; height:auto;" src="{{ file_exists(public_path('/uploads/products/featured_images/'.$biddings[0]->Auction->Product->featured_image)) ?   asset('/uploads/products/featured_images/'.$biddings[0]->Auction->Product->featured_image) : asset('no-image.png')}}" />
                                            </a>

                  <h6> 
                    <a class="nav-link mt-4 px-3" href="{{url('/auction/view/'.$biddings[0]->Auction->id.'/'.str_replace(' ','-', $biddings[0]->Auction->Product->title))}}">
                                       <strong> {{$biddings[0]->Auction->Product->title}}</strong>
                    </a>
                                    </h6>
                                    <hr>
                                    <p>{{$biddings[0]->Auction->Product->short_description}}</p>
                       


                    </div>
                    <div class="col-md-8">
                    <div class="table-responsive p-4" style="min-height:50vh;">
                        <table class="table border mb-0">
                            <thead class="table-light fw-semibold">
                                <tr class="align-middle">
                                    <th>#</th>
                                    <th>Bid By</th>
                                    <th>Amount</th>
                                    <th>Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($biddings as $key=>$bid)
                                <tr class="align-middle table-row" id="user-row-{{$bid->id}}">
                                    <td>
                                        <div>{{$key+1}}</div>
                                    </td>
                                   
                                    <td>
                                        @if ($bid->User && $bid->User->Profile)
                                    <a class="nav-link" href="{{url('admin/users/profile/'.$bid->User->id)}}">
                                            <div>{{$bid->User->name}}</div>
                                        </a>
                          
                                        <p class="small p-0">{{$bid->User->email}}</p>
                                        @else
                                        <p class="text-sm text-center p-1 alert alert-warning" title="You can restore from trash"> User Deleted </p>
                                        @endif

                                    </td>

                                    <td class="text-capitalize">
                                    {{$bid->bid_amount}} {{trans('global.currency_symbol')}}

                                    </td>
                                    <td>
                                    {{$bid->created_at}}

                                    </td>

                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    </div>
                    
                </div>
            </div>
        </div>
        <!-- /.col-->
        <div class="row">
            <div class="col-12 d-flex justify-content-center">
                {{ $biddings->links() }}
            </div>
        </div>
    </div>
    @else
    <div class="row d-flex justify-content-center">
        <div class="col-12">
            <p class="text-center"> No Data Found</p>
        </div>
    </div>
    @endif
    <div id="notification"></div>

    <!-- @if(session('message'))
{{session('message')}}
@endif -->

    @endsection

    @section('additionolJs')

    <script src="{{asset('/js/module/user.js')}}" crossorigin="anonymous"></script>

    @endsection