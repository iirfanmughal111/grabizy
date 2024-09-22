@extends('admin/master')
@section("headTitle")
Auctions
@endsection

@section("bodyContent")
@include('admin.product.productDeleteModal')

@if(auth()->user()->can('delete auction') )
@include('admin.auction.auctionDeleteModal')
@endif

@if(auth()->user()->can('add auction') || auth()->user()->can('edit auction'))
@include('admin.auction.auctionCreateModal')
@endif

<div class="body flex-grow-1 px-3">
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4">
                <div class="card-header">Auction Mangement</div>
                <div class="card-body">
                    <div class="row ">
                        <div class="col-12 ">
                            @if(session('status'))
                            <div class="alert alert-success" role="alert">
                                {{session('status')}}
                            </div>

                            @endif

                        </div>
                    </div>
                </div>
                @if($auctions->count())
                <div class="row">
                    <div class="table-responsive px-4 mb-3" style="min-height:50vh;">
                        @include('admin.auction.auctionSearchForm')
                        <table class="table border mb-0">
                            <thead class="table-light fw-semibold">
                                <tr class="align-middle">
                                    <th>#</th>
                                    <th>Image</th>
                                    <th>Title</th>
                                    <th>Category</th>
                                    <th>Bidding</th>
                                    <th>Bid Price</th>
                                    <th>Start Date</th>
                                    <th>Edn Date</th>
                                    <th>Created Date</th>
                                    <th></th>

                                </tr>
                            </thead>
                            <tbody>
                                @foreach($auctions as $key=>$auc)
                                <tr class="align-middle " id="auc-row-{{$auc->id}}">
                                    <td>
                                        <div>{{$key+1}}</div>
                                    </td>

                                    <td>
                                        <a href="{{url('admin/auction/bidding/'.$auc->id.'/'.str_replace(' ','-',$auc->Product->title))}}">
                                        <img class="table-image"
                                            src="{{ file_exists(public_path('uploads/products/featured_images'.$auc->Product->featured_image)) ? asset('no-image.png') : asset('uploads/products/featured_images/'.$auc->Product->featured_image) }}">
                                        </a>
                                    </td>
                                    <td class="text-capitalize">
                                    <a class="nav-link" href="{{url('auction/view/'.$auc->id.'/'.str_replace(' ','-',$auc->Product->title))}}">
                                            {{ $auc->product_id != null ? Str::limit($auc->Product->title,35) : 'untitled' }}
                                            </a>
                                    </td>
                                    <td class="text-capitalize">
                                        <div>
                                            {{ $auc->Product->category_id != null ? Str::limit($auc->Product->Category->title,35) : 'uncategorized' }}
                                        </div>
                                    </td>
                                    <td>
                                        <div class="toggle">
                                            <input type="checkbox" title="{{$auc->title}}"
                                                {{ $auc->is_active==1 ? 'checked' : '' }} type="checkbox"
                                                id="switch_statusBidding" data-auc-id="{{$auc->id}}"
                                                class="toggle switch_statusBidding" />
                                            <label></label>
                                        </div>

                                    </td>
                                    <td>
                                        {{$auc->bid_price}} {{trans('global.currency_symbol')}}
                                    </td>
                                    <td>
                                    {{Carbon\Carbon::createFromTimestamp($auc->start_dateTime)->toDateString()}}
                                  
                                    </td>
                                    <td>
                                    {{Carbon\Carbon::createFromTimestamp($auc->end_dateTime)->toDateString()}}
                                  

                                    </td>
                                    <td>
                                        <div class=""> {{ date($auc->created_at) }}</div>
                                    </td>
                                    <td class="pe-3">
                                        @if((auth()->user()->can('edit auction') || auth()->user()->can('delete
                                        auction')) || auth()->user()->can('listing biddings'))

                                        <div class="dropdown dropup">
                                            <button class="btn btn-transparent p-0" type="button"
                                                data-coreui-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false">
                                                <i class="fa-solid fa-ellipsis-vertical"></i>
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-end">
                                            @if(auth()->user()->can('listing biddings'))
                                                <a class="dropdown-item"
                                                    href="{{url('admin/auction/bidding/'.$auc->id.'/'.str_replace(' ','-',$auc->Product->title))}}">Show Biddings</a>
                                                @endif


                                                @if( auth()->user()->can('edit auction'))
                                                <a class="dropdown-item " data-bs-toggle="modal"
                                                    data-bs-target="#createAuctionModal" data-auc="{{$auc}}"
                                                    data-prod="null" data-image="{{asset('uploads/products/featured_images/'.$auc->Product->featured_image)}}"
                                                    href="#">{{trans('global.edit')}}</a>
                                                @endif

                                                @if(auth()->user()->can('listing biddings'))
                                                <a class="dropdown-item"
                                                    href="{{url('admin/product/edit/'.$auc->Product->id)}}">Edit Product</a>
                                                @endif

                                                @if(auth()->user()->can('delete auction'))
                                                <a class="dropdown-item text-danger " data-bs-toggle="modal"
                                                    data-bs-target="#deleteAuctionModal" data-auc="{{$auc}}"
                                                    href="#">{{trans('global.delete')}}</a>
                                                @endif

                                              


                                            </div>
                                        </div>
                                        @endif

                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.col-->
    </div>
    <div class="row">
        <div class="col-12 d-flex justify-content-center">

        </div>
    </div>
    <div class="row">
        <div class="col-12 d-flex justify-content-center">

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

    <div class="row">
        <div class="col-12 d-flex justify-content-center">
            {{ $auctions->links() }}
        </div>
    </div>
    @endsection


    @section('additionolJs')
 <script src="{{asset('/js/module/auction.js')}}" crossorigin="anonymous"></script>
 <script src="{{asset('/js/module/product.js')}}" crossorigin="anonymous"></script>

    @endsection