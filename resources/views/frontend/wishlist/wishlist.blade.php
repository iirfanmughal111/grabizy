@extends('frontend/common/dashboard')

@section("dashboardContent")
<div class="body flex-grow-1 px-3" id="dashboard-content">
    <div class="row">
        <div class="col-md-12">
        <div class="card mb-4">
                <div class="card-header">Saved Items</div>
               
                <div class="row">
                    <div class="table-responsive p-4" style="min-height:60vh;">
                    
                        @if ($wishlist->count())

            <table class="table border mb-0">
                <thead class="table-light fw-semibold">
                    <tr class="align-middle">
                        <th>#</th>
                        <th>Image</th>
                        <th>Title</th>
                        <th>Price</th>
                        <th>Date</th>

                    </tr>
                </thead>
                <tbody>
                    @foreach($wishlist as $key=>$wish)
                    <tr class="align-middle table-row" id="user-row-{{$wish->id}}">
                        <td>
                            <div>{{$key+1}}</div>
                        </td>

                        <td>
                            <a
                                href="{{url('/shop/view/'.$wish->product_id.'/'.str_replace(' ','-', $wish->Product->title))}}">
                                <img class="table-image image-fluid"
                                    src="{{ file_exists(public_path('/uploads/products/featured_images/'.$wish->Product->featured_image)) ?   asset('/uploads/products/featured_images/'.$wish->Product->featured_image) : asset('no-image.png')}}" />
                            </a>


                        </td>
                        <td>{{$wish->Product->title}}</td>
                        <td class="text-capitalize">
                        <span
                                        class="{{$wish->Product->sale_price!=null ? 'text-decoration-line-through text-muted' : ''}}">{{$wish->Product->regular_price}}</span>
                                    <span class="">{{$wish->Product->sale_price!=null ? $wish->Product->sale_price : ''}}</span>

                        </td>
                        <td>
                            {{$wish->created_at}}

                        </td>

                    </tr>
                    @endforeach
                </tbody>
            </table>
            <div class="row">
                <div class="col-12 d-flex justify-content-center">
                    {{ $wishlist->links() }}
                </div>
            </div>

            @else
            <div class="row d-flex justify-content-center">
                <div class="col-12">
                    <p class="text-center"> No Data Found</p>
                </div>
            </div>
            @endif
                    </div>
                </div>
            </div>
            
            
        </div>
        </div>

        </div>



            @endsection


            @section('additionolJs')


            @endsection