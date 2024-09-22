@extends('admin/master')
@section("headTitle")
Shipping Zones
@endsection
@section("bodyContent")
@include('admin.shipping.shippingDeleteModal')
<div class="body flex-grow-1 px-3">
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4">
                <div class="card-header">Shipping Zones Mangement</div>
                <div class="card-body">
                    <div class="row ">
                        <div class="col-12 ">
                            @if(session('status'))
                            <div class="alert alert-success" role="alert">
                                {{session('status')}}
                            </div>
                            @endif
                        </div>
                        <div class="col d-flex justify-content-end">
                            <a href="{{url('admin/shop/shipping/create')}}" class="btn-default btn-primary">{{trans('global.create')}}</a>
                        </div>
                    </div>
                </div>
                @if($shippings->count())
                <div class="row">
                    <div class="table-responsive px-4 mb-3" style="min-height:50vh;">
                        <table class="table border mb-0">
                            <thead class="table-light fw-semibold">
                                <tr class="align-middle">
                                    <th>#</th>
                                    <th>Country</th>
                                    <th>Region</th>
                                    <th>Weight From (G)</th>
                                    <th>Weight To (G)</th>
                                    <th>Cost</th>
                                    <th>Created Date</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($shippings as $key=>$ship)
                                <tr class="align-middle " id="shipping-row-{{$ship->id}}">
                                    <td>
                                        <div>{{$key+1}}</div>
                                    </td>

                                  
                                    <td class="text-capitalize">
                                            {{ $ship->country }}
                                    </td>
                                    <td class="text-capitalize">
                                    {{ $ship->region }}

                                    </td>
                                    <td>
                                        {{$ship->weight_from}}
                                    </td>
                                    <td>
                                        {{$ship->weight_to}}
                                    </td>
                                    <td>
                                        {{$ship->cost}}
                                    </td>
                                  
                                    <td>
                                        <div class=""> {{ $ship->created_at }}</div>
                                    </td>
                                    <td class="pe-3">
                                        @if((auth()->user()->can('edit shipping') || auth()->user()->can('delete
                                        shipping')))

                                        <div class="dropdown dropup">
                                            <button class="btn btn-transparent p-0" type="button"
                                                data-coreui-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false">
                                                <i class="fa-solid fa-ellipsis-vertical"></i>
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-end">

                                                @if( auth()->user()->can('edit shipping'))
                                                <a class="dropdown-item " 
                                                    data-prod="null" 
                                                    href="{{url('admin/shop/shipping/create/'.$ship->id)}}">{{trans('global.edit')}}</a>
                                                @endif
                                                @if(auth()->user()->can('delete shipping'))
                                                <a class="dropdown-item text-danger " data-bs-toggle="modal"
                                                    data-bs-target="#deleteShippingModal" data-shipping="{{$ship}}"
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
            {{ $shippings->links() }}
        </div>
    </div>
    @endsection


    @section('additionolJs')
 <script>
$(document).ready(function() {
    var deleteShippingModal = document.getElementById('deleteShippingModal')
	deleteShippingModal.addEventListener('show.bs.modal', function(event) {
		// Button that triggered the modal
		var button = event.relatedTarget;
		var Shipping = JSON.parse(button.getAttribute('data-shipping'));
		$('#deleteShippingFormBtn').html('Delete');
		//$('#deleteAuctionImage').attr('src', base_url + '/no-image.png');
		if (Shipping) {
			$('#deleteShippingId').attr('value', Shipping.id);
			
		}
	});


$(document).on('click', '#deleteShippingFormBtn', function(e) {
     
     e.preventDefault();
     $('#deleteShippingFormBtn').html('Loading...');
     var csrf_token = $('meta[name="csrf-token"]').attr('content');
     var jsShippingId = $('#deleteShippingId').val();
 
     $.ajax({
         type: "POST",
         dataType: 'json',
         url: base_url + '/admin/shop/shipping/delete',
         data: {
             _token: csrf_token,
             deleteShippingId: jsShippingId
         },
         success: function(data) {

             if (data.success) {
                 let shipping_row = document.getElementById('shipping-row-' + jsShippingId);
                 shipping_row.remove();
             }
             notification(data.success, data.msg, 2800);
             setTimeout(function() {
                 $('#deleteShippingModal').modal('hide');
                 $("#deleteShippingModal .btn-close").click();
             }, 1000);


         },

         error: function(xhr, status, error) {
             console.log(xhr.responseText);
         }

     });
 });
});

 </script>
 

    @endsection