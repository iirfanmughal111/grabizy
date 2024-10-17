@extends('admin/master')
@section("headTitle")
Product
@endsection

@section("bodyContent")

@if(auth()->user()->can('delete product') )
@include('admin.product.productDeleteModal')
@endif

@if(auth()->user()->can('add auction') || auth()->user()->can('edit auction'))
@include('admin.auction.auctionCreateModal')

@endif

<style>
.modal-content {
    border: none;
    border-radius: 2px;
    box-shadow: 0 16px 28px 0 rgba(0, 0, 0, 0.22), 0 25px 55px 0 rgba(0, 0, 0, 0.21);
}
</style>

<div class="body flex-grow-1 px-3">
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4">
                <div class="card-header">Products Mangement</div>
                <div class="card-body">
                    <div class="row ">
                        <div class="col-12">
                            @if(session('status'))
                            <div class="alert alert-success" role="alert">
                                {{session('status')}}
                            </div>

                            @endif

                        </div>
                        <div class="col-12 d-flex justify-content-end">
                            <!-- Button trigger modal -->
                            @if(auth()->user()->can('add product') )
                            <a type="button" class="btn-default btn-primary" href="{{url('admin/product/create')}}">
                                {{trans('global.create_new')}}
                            </a>
                            @endif


                        </div>

                    </div>
                </div>
                @if($products->count())
                <div class="row">
                    <div class="table-responsive px-4 mb-3" style="min-height:50vh;">
                        @include('admin.product.productSearchForm')
                        <table class="table border mb-0">
                            <thead class="table-light fw-semibold">
                                <tr class="align-middle">
                                    <th>#</th>
                                    <th>Image</th>
                                    <th>Title</th>
                                    <th>Category</th>
                                    <th>Visibility</th>
                                    <th>Sale Price</th>
                                    <th>Regular Price</th>
                                    <th>Last update</th>
                                    <th></th>

                                </tr>
                            </thead>
                            <tbody>
                                @foreach($products as $key=>$prod)
                                <tr class="align-middle " id="cat-row-{{$prod->id}}">
                                    <td>
                                        <div>{{$key+1}}</div>
                                    </td>

                                    <td>
                                        <a target="_blank" href="{{url('shop/view/'.$prod->id.'/'.str_replace(' ','-',$prod->title))}}">
                                            <img class="table-image"
                                                src="{{ $prod->featured_image()}}">
                                        </a>
                                    </td>
                                    <td class="text-capitalize">
                                        <div>{{ Str::limit($prod->title, 30) }}</div>
                                    </td>
                                    <td class="text-capitalize">
                                        <div>{{ $prod->category_id != null ? $prod->Category->title : 'uncategorized' }}  </div>
                                    </td>
                                    <td>
                                        <div class="toggle">
                                            <input type="checkbox" title="{{$prod->title}}"
                                                {{ $prod->is_visible==1 ? 'checked' : '' }} type="checkbox"
                                                id="switch_statusVisibilty" data-prod-id="{{$prod->id}}"
                                                class="toggle switch_statusVisibilty" />
                                            <label></label>
                                        </div>

                                    </td>
                                    <td>
                                        {{$prod->sale_price}} {{trans('global.currency_symbol')}}
                                    </td>

                                    <td>

                                        {{$prod->regular_price}} {{trans('global.currency_symbol')}}

                                    </td>
                                    <td>
                                        <div class=""> {{ $prod->updated_at ? date($prod->updated_at) : date($prod->created_at) }}</div>
                                    </td>
                                    <td>
                                        @if((auth()->user()->can('edit product') || auth()->user()->can('delete prodcut')) || auth()->user()->can('add auction'))
                                        
                                        <div class="dropdown dropup">
                                            <button class="btn btn-transparent p-0" type="button"
                                                data-coreui-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false">
                                                <i class="fa-solid fa-ellipsis-vertical"></i>
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-end">
                                                

                                                @if( auth()->user()->can('edit product'))
                                                <a class="dropdown-item changeSelected"
                                                    href="{{url('admin/product/edit/'.$prod->id)}}">{{trans('global.edit')}}</a>
                                                @endif
                                                @if(auth()->user()->can('delete product'))
                                                <a class="dropdown-item text-danger " data-bs-toggle="modal"
                                                    data-bs-target="#deleteProductModal" data-prod="{{$prod}}"
                                                    href="#">{{trans('global.delete')}}</a>
                                                @endif
                                                @if( auth()->user()->can('add auction'))
                                                <a class="dropdown-item " data-bs-toggle="modal"
                                                    data-bs-target="#createAuctionModal" data-auc="null" data-image="null" data-prod="{{$prod}}"
                                                    href="#">Auction</a>
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
            {{ $products->appends(request()->input())->links() }}
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


    <script src="{{asset('/js/module/product.js')}}" crossorigin="anonymous"></script>


    @endsection