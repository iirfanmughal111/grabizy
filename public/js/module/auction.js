
$(document).ready(function() {
$(document).on('click','.switch_statusBidding', function(e) {

    if($(this).is(":checked")){
        var auc_status = 1;
    }
    else if($(this).is(":not(:checked)")){
        var auc_status = 0;
    }
    var jsAuc_id = $(this).attr('data-auc-id');
    console.log(jsAuc_id, auc_status);
    var csrf_token = $('meta[name="csrf-token"]').attr('content');
    $.ajax({
        type: "POST",
        dataType: 'json',
         url: base_url+'/admin/auction/bidding',
    
        data: {status:auc_status,auction_id:jsAuc_id,_token:csrf_token},
        success: function(data) {
             // IF TRUE THEN SHOW SUCCESS MESSAGE  
        
                notification(data.success, data.msg, 2800);
        
        },
        error: function(xhr, status, error) {
          //  console.log(xhr.responseText);
          }
    });
    
    });

    var deleteAuctionModal = document.getElementById('deleteAuctionModal')
	deleteAuctionModal.addEventListener('show.bs.modal', function(event) {
		// Button that triggered the modal
		var button = event.relatedTarget;
		var Auction = JSON.parse(button.getAttribute('data-auc'));
		$('#deleteAuctionFormBtn').html('Delete');
		$('#deleteAuctionImage').attr('src', base_url + '/no-image.png');
		if (Auction) {
			$('#deleteAuctionId').attr('value', Auction.id);
			let imageExist = fileExists(base_url + '/uploads/products/featured_images/' + Auction.product.featured_image);
			if (imageExist) {
				$('#deleteAuctionImage').attr('alt', Auction.product.title);
				$('#deleteAuctionImage').attr('src', base_url + '/uploads/products/featured_images/' + Auction.product.featured_image);
			}
		}
	});


    $(document).on('click', '#deleteAuctionFormBtn', function(e) {
     
		e.preventDefault();
		$('#deleteAuctionFormBtn').html('Loading...');
		var csrf_token = $('meta[name="csrf-token"]').attr('content');
		var jsAucId = $('#deleteAuctionId').val();
	
		$.ajax({
			type: "POST",
			dataType: 'json',
			url: base_url + '/admin/auction/delete',
			data: {
				_token: csrf_token,
				deleteAuctionId: jsAucId
			},
			success: function(data) {

				if (data.success) {
					let aucRow = document.getElementById('auc-row-' + jsAucId);
					aucRow.remove();
				}
				notification(data.success, data.msg, 2800);
				setTimeout(function() {
					$('#deleteAuctionModal').modal('hide');
					$("#deleteAuctionModal .btn-close").click();
				}, 1000);


			},

			error: function(xhr, status, error) {
				console.log(xhr.responseText);
			}

		});
	});


});