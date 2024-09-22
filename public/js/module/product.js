$(document).ready(function() {
    $(document).on('click','.remove-image', function(e) {

    var jsProdId = $(this).attr('data-prodId');
    var jsImageId = $(this).attr('data-imageId');
    var jsImageType = $(this).attr('data-imageType');

// console.log('remove-area-'+jsProdId);
    
    var csrf_token = $('meta[name="csrf-token"]').attr('content');
    $.ajax({
        type: "POST",
        dataType: 'json',
         url: base_url+'/admin/product/delete/image',
    
        data: {prodId:jsProdId,imageId:jsImageId,imageType:jsImageType,_token:csrf_token},
        success: function(data) {
             // IF TRUE THEN SHOW SUCCESS MESSAGE  
        
                notification(data.success, data.msg, 2800);
           $('#image-area-'+jsProdId).remove();

        
        },
        error: function(xhr, status, error) {
        //	console.log(xhr.responseText);
          }
    });
    
    });


    $(document).on('click','.switch_statusVisibilty', function(e) {

        if($(this).is(":checked")){
            var prod_status = 1;
        }
        else if($(this).is(":not(:checked)")){
            var prod_status = 0;
        }
        var jsProduct_id = $(this).attr('data-prod-id');
        // console.log(jsProduct_id, prod_status);
        var csrf_token = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
            type: "POST",
            dataType: 'json',
             url: base_url+'/admin/product/visibility',
        
            data: {status:prod_status,product_id:jsProduct_id,_token:csrf_token},
            success: function(data) {
                 // IF TRUE THEN SHOW SUCCESS MESSAGE  
            
                    notification(data.success, data.msg, 2800);
            
            },
            error: function(xhr, status, error) {
            	// console.log(xhr.responseText);
              }
        });
        
        });


        var deleteProductModal = document.getElementById('deleteProductModal');
		if (deleteProductModal){
	deleteProductModal.addEventListener('show.bs.modal', function(event) {
		// Button that triggered the modal
		var button = event.relatedTarget;
		var prod = JSON.parse(button.getAttribute('data-prod'));
		$('#deleteProdFormBtn').html('Delete');
		$('#deleteProdImage').attr('src', base_url + '/no-image.png');
		if (prod) {
			$('#deleteProdId').attr('value', prod.id);
			let imageExist = fileExists(base_url + '/uploads/products/featured_images/' + prod.featured_image);
			if (imageExist) {
				$('#deleteProdImage').attr('alt', prod.title);
				$('#deleteProdImage').attr('src', base_url + '/uploads/products/featured_images/' + prod.featured_image);
			}
		}
	});
}


    var createAuctionModal = document.getElementById('createAuctionModal');
	if (createAuctionModal) {
	createAuctionModal.addEventListener('show.bs.modal', function(event) {
		// Button that triggered the modal
		var button = event.relatedTarget;
		var prod = JSON.parse(button.getAttribute('data-prod'));
		var auc = JSON.parse(button.getAttribute('data-auc'));
		var imgae_url = button.getAttribute('data-image');

		$('#addEditAuctionFormBtn').html('Submit');
		$('#title').val('');
		$('#bid_price').val('');
		$('#startDate').val('');
		$('#endDate').val('');
		$('#addEditAuctionImage').attr('src', base_url + '/no-image.png');
		$('#auc_prodId').val('');
		$('#active').prop("checked", false);
		if (prod) {
			$('#title').val(prod.title);

			$('#auc_prodId').val(prod.id);

			// if (prod.is_active == 1) {
			// 	$('#active').prop("checked", true);
			// }
			let imageExist = fileExists(base_url + '/uploads/products/featured_images/' + prod.featured_image);
			if (imageExist) {
				$('#addEditAuctionImage').attr('alt', prod.title);
                $('#addEditAuctionImage').attr('src', base_url + '/uploads/products/featured_images/' + prod.featured_image);

			}
		}else if(auc){
            if (auc.is_active == 1) {
				$('#active').prop("checked", true);
			}
			$('#title').val(auc.product.title);
  
			document.getElementById("startDate").value = timeConverter(auc.start_dateTime);
			document.getElementById("endDate").value = timeConverter(auc.end_dateTime);
			$('#bid_price').val(auc.bid_price);
			$('#aucId').val(auc.id);
			$('#auc_prodId').val(auc.product_id);
            let imageExist = fileExists(imgae_url);
			if (imageExist) {
				$('#addEditAuctionImage').attr('alt', auc.id);
                $('#addEditAuctionImage').attr('src', imgae_url);
			}
        }

	});
}

    $(document).on('click', '#addEditAuctionFormBtn', function(e) {
		e.preventDefault();
		$('#addEditAuctionFormBtn').html('Loading...');
		var csrf_token = $('meta[name="csrf-token"]').attr('content');

		var jsActive = $('#active').is(":checked");
		if (jsActive == true) {
			jsActive = 1;
		} else {
			jsActive = 0;

		}
		var jsAucProdId = $('#auc_prodId').val();
		var jsStartDate = $('#startDate').val();
		var jsEndDate = $('#endDate').val();
		var jsBid = $('#bid_price').val();
		var jsAucId = $('#aucId').val();

		$.ajax({
			type: "POST",
			dataType: 'json',
			data: {_token: csrf_token,active:jsActive,prodId:jsAucProdId,bid_price:jsBid,startDate:jsStartDate,endDate:jsEndDate,aucId :jsAucId},
			url: base_url + '/admin/auction/store',
			success: function(data) {

				notification(data.success, data.msg, 2800);
				setTimeout(function() {
					$('#createAuctionModal').modal('hide');
					$("#createAuctionModal .btn-close").click();
				}, 1000);
				// if (data.success) {
				// 	setTimeout(function() {
				// 		window.location.href = base_url + '/admin/category';
				// 	}, 3000);

				// }


			},

			error: function(xhr, status, error) {
			//		alert(xhr.responseText);

				$('#addEditAuctionFormBtn').html('Submit');

				var errorsResponse = JSON.parse(xhr.responseText);
				var errors = errorsResponse['errors'];
				const propertyNames = Object.keys(errors);
				const toNumericPairs = input => {
					const entries = Object.entries(errors);
					entries.forEach(entry => entry[0] = +entry[0]);
					return entries;
				}
				var tempError = toNumericPairs(errors);
				let errorList = ' ';

				for (var i = 0; i < propertyNames.length; i++) {

					errorList += '<li>' + tempError[i][1] + '</li>'

				}
				notification(false, errorList, 3000);

			}

		});
	});


	$(document).on('click', '.deleteProdFormBtn ', function(e) {
	
		e.preventDefault();
		$('#deleteProdFormBtn').html('Loading...');
		var csrf_token = $('meta[name="csrf-token"]').attr('content');
		var jsProdId = $('#deleteProdId').val();
		// console.log(jsCatId);
		$.ajax({
			type: "POST",
			dataType: 'json',
			url: base_url + '/admin/product/delete',
			data: {
				_token: csrf_token,
				prodId: jsProdId
			},
			success: function(data) {

				if (data.success) {
					let catRow = document.getElementById('cat-row-' + jsProdId);
					catRow.remove();
				}
				notification(data.success, data.msg, 2800);
				setTimeout(function() {
					$('#deleteProductModal').modal('hide');
					$("#deleteProductModal .btn-close").click();
				}, 1000);


			},

			error: function(xhr, status, error) {
				 console.log(xhr.responseText);
			}

		});
	});



    });
