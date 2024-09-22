@extends('admin/master')
@section("headTitle")
Order Status
@endsection
@if(Auth::user()->can('delete order status'))
@include('admin.status.statusDeleteModal')
@endif
@section("bodyContent")

<div class="body flex-grow-1 px-3">

    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4 ">
                <div class="card-header">Status Mangement</div>
                <div class="card-body">
                    <div class="row">
                        @if(session('status'))
                        <div class="alert alert-success" role="alert">
                            {{session('status')}}
                        </div>

                        @endif
                        <div class="table-responsive px-4" style="min-height:50vh;">
                            <table class="table border mb-4">
                                <thead class="table-light fw-semibold">
                                    <tr class="align-middle">
                                        <th>#</th>
                                        <th>Value</th>
                                        <th>Message</th>

                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($status as $key=>$st)
                                    <tr class="align-middle text-capitalize" id="status-row-{{$st->id}}">
                                        <td>
                                            <div>{{$key+1}}</div>
                                        </td>

                                        <td>
                                            {{ Str::limit($st->value, 26) }}
                                        </td>
                                        <td>
                                            {{ Str::limit($st->message, 30) }}
                                        </td>

                                        <td>
                                        @if(auth()->user()->can('add order status') || auth()->user()->can('edit
                                        order status') || auth()->user()->can('delete order status'))
                                        <div class="dropdown dropup">
                                            <button class="btn btn-transparent p-0" type="button"
                                                data-coreui-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false">
                                                <i class="fa-solid fa-ellipsis-vertical"></i>
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-end">
                                                @if(auth()->user()->can('add order status') || auth()->user()->can('edit order
                                                status'))
                                                <a class="dropdown-item"
                                                        href="{{url('admin/status/create?status_id='.$st->id)}}"
                                                        >Edit</a>
                                                @endif
                                                @if(auth()->user()->can('delete order status'))
                                                <a class="dropdown-item text-danger " data-bs-toggle="modal"
                                                    data-bs-target="#deleteStatusModal" data-status="{{$st}}"
                                                    href="#">{{trans('global.delete')}}</a>
                                                @endif
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
        <!-- /.row-->


        <div id="notification"></div>


    @endsection


    @section('additionolJs')

    <script>
        	var deleteStatusModal = document.getElementById('deleteStatusModal')
	deleteStatusModal.addEventListener('show.bs.modal', function(event) {
		// Button that triggered the modal
		var button = event.relatedTarget;
		var status = JSON.parse(button.getAttribute('data-status'));
		$('#DeleteOrderStatusFormBtn').html('Delete');
		$('#deleteStatusImage').attr('src', base_url + '/no-image.png');
		if (status) {
			$('#deleteStatusId').attr('value', status.id);
			let imageExist = fileExists(base_url + '/uploads/category/' + status.image_url);
			if (imageExist) {
				$('#deleteStatusImage').attr('alt', status.title);
				$('#deleteStatusImage').attr('src', base_url + '/uploads/category/' + status.image_url);
			}
		}
	});
    
        $(document).on('click', '.DeleteOrderStatusFormBtn', function(e) {
		e.preventDefault();
		$('#DeleteOrderStatusFormBtn').html('Loading...');
		var csrf_token = $('meta[name="csrf-token"]').attr('content');
		var jsStatusId = $('#deleteStatusId').val();
		$.ajax({
			type: "POST",
			dataType: 'json',
			url: base_url + '/admin/status/delete',
			data: {
				_token: csrf_token,
				status_id: jsStatusId
			},
			success: function(data) {

				if (data.success) {
					let statusRow = document.getElementById('status-row-' + jsStatusId);
					statusRow.remove();
				}
				notification(data.success, data.msg, 2800);
				console.log(data.success + ' -> ' + data.msg);

				setTimeout(function() {
					$('#deleteStatusModal').modal('hide');
					$("#deleteStatusModal .btn-close").click();
				}, 1000);


			},

			error: function(xhr, status, error) {
			//	console.log(xhr.responseText);
			}

		});
	});
        </script>

    @endsection

      