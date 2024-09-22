
$(document).ready(function() {
   
        $(document).on('change', '.order_status', function(e) {
         
            e.preventDefault();
            var csrf_token = $('meta[name="csrf-token"]').attr('content');
		    var jsOrder_id =$(this).attr('data-status-id');
            var jsOrder_status = $('#order_status-'+jsOrder_id).val();          

            $.ajax({
                type: "POST",
                dataType: 'json',
                url: base_url + '/admin/orders/status/',
                data: {
                    _token: csrf_token,
                    order_id: jsOrder_id,
                    order_status:jsOrder_status
                },
                beforeSend: function() {
                    notification(true, 'Working!!! Notifying User', 1900);
                },
                success: function(data) {
                    notification(data.success, data.msg, 3000);
                },
    
                error: function(xhr, status, error) {
              //      console.log(xhr.responseText);
                }
    
            });
        });
    
    
        var deleteOrderModal = document.getElementById('deleteOrderModal')
        deleteOrderModal.addEventListener('show.bs.modal', function(event) {
            // Button that triggered the modal
            var button = event.relatedTarget;
            var order = JSON.parse(button.getAttribute('data-order'));
            var trash = button.getAttribute('data-trash');
            
            $('#DeleteOrderFormBtn').html('Delete');
            $('#deleteOrderImage').attr('src', base_url + '/no-image.png');
            if (order) {
                $('#deleteOrderId').attr('value', order.id);
                $('#orderTrash').attr('value', trash);

                let imageExist = fileExists(base_url + '/uploads/products/featured_images/' + order.order_item[0].product.featured_image);
                if (imageExist) {
                    $('#deleteOrderImage').attr('alt', order.title);
                    $('#deleteOrderImage').attr('src', base_url + '/uploads/products/featured_images/' + order.order_item[0].product.featured_image);
                }
            }
        });


	$(document).on('click', '.DeleteOrderFormBtn', function(e) {
		e.preventDefault();
		$('#DeleteOrderFormBtn').html('Loading...');
		var csrf_token = $('meta[name="csrf-token"]').attr('content');
		var jsOrderId = $('#deleteOrderId').val();
		var jsorderTrash = $('#orderTrash').val();

		
		$.ajax({
			type: "POST",
			dataType: 'json',
			url: base_url + '/admin/orders/delete',
			data: {
				_token: csrf_token,
				orderId: jsOrderId,
                trash: jsorderTrash
			},
            beforeSend: function() {
                notification(true, 'Working!!! Notifying User', 1900);
            },
			success: function(data) {

				if (data.success) {
					let orderRow = document.getElementById('order-row-' + jsOrderId);
					orderRow.remove();
				}
				notification(data.success, data.msg, 2800);
				setTimeout(function() {
					$('#deleteOrderModal').modal('hide');
					$("#deleteOrderModal .btn-close").click();
				}, 1000);


			},

			error: function(xhr, status, error) {
				console.log(xhr.responseText);
			}

		});
	});


	var restoreOrderModal = document.getElementById('restoreOrderModal')
	restoreOrderModal.addEventListener('show.bs.modal', function(event) {
		// Button that triggered the modal
		var button = event.relatedTarget;
		var order = JSON.parse(button.getAttribute('data-restore-order'));
		
		$('#restoreOrderFormBtn').html('Restore');
		$('#restoreOrderImage').attr('src', base_url + '/no-image.png');
		if (order) {
            console.log(order);
			$('#restoreOrderId').attr('value', order.id);
			let imageExist = fileExists(base_url + '/uploads/products/featured_images/' + order.order_item[0].product.featured_image);
                if (imageExist) {
                    $('#restoreOrderImage').attr('alt', order.title);
                    $('#restoreOrderImage').attr('src', base_url + '/uploads/products/featured_images/' + order.order_item[0].product.featured_image);
                }
		}
	});


	$(document).on('click', '#restoreOrderFormBtn', function(e) {
		e.preventDefault();
		$('#restoreOrderFormBtn').html('Loading...');

		var csrf_token = $('meta[name="csrf-token"]').attr('content');
		var jsOrderId = $('#restoreOrderId').val();
		$.ajax({
			type: "POST",
			dataType: 'json',
			url: base_url + '/admin/orders/restore',
			data: {
				_token: csrf_token,
				orderId: jsOrderId
			},
			success: function(data) {

				if (data.success) {
					let orderRow = document.getElementById('order-row-' + jsOrderId);
					orderRow.remove();
				}
				notification(data.success, data.msg, 2800);
				console.log(data.success + ' -> ' + data.msg);

				setTimeout(function() {
					$('#restoreOrderModal').modal('hide');
					$("#restoreOrderModal .btn-close").click();
				}, 1000);


			},

			error: function(xhr, status, error) {
				console.log(xhr.responseText);
			}

		});
	});


    });