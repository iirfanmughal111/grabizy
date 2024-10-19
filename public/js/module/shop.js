$(document).ready(function() {
	const base_url = window.location.origin;
    // var productView = document.getElementById('productView')
	// productView.addEventListener('show.bs.modal', function(event) {
   
	// 	// Button that triggered the modal
	// 	var button = event.relatedTarget;
	// 	var product = JSON.parse(button.getAttribute('data-product'));
	// 	$('#prod-image').attr('src', base_url + '/no-image.png');
	// 	if (product) {
	// 		$('#prod-title').html(product.title);
	// 		 $('#modal-cart-btn').attr('data-product-id', product.id);
	// 		 $('#modal-cart-btn').attr('data-status', button.getAttribute('data-status'));
	// 			var quantity_box = $('#quantity-box');

	// 		 if (button.getAttribute('data-status')==1){
	// 			$('#modal-cart-btn').html('Remove from cart');
				
	// 				if (quantity_box){
	// 					$('#quantity-box').addClass('d-none');
	// 				}
	// 		 }
	// 		 else{
	// 			$('#modal-cart-btn').html('Add to cart');
	// 			if (quantity_box){
	// 				$('#quantity-box').removeClass('d-none');
	// 			}

	// 		 }
	// 		 $('#modal-wishList-btn').attr('data-product-id', product.id);
			
	// 		var wishListIcon = document.getElementById("modal-wishList-btn").firstChild;
	// 		if (wishListIcon){
	// 			wishListIcon.setAttribute('id', 'icon-'+product.id);
	// 		}
				
	// 		// $('#icon-'+product.id).attr('id', product.id);

	// 		$('#prod-price').html(product.regular_price);
	// 		$('#prod-desc').html(product.short_description);
	// 		let imageExist = fileExists(base_url + '/uploads/products/featured_images/' + product.featured_image);
	// 		if (imageExist) {
	// 			$('#prod-image').attr('alt', product.title);
	// 			$('#prod-image').attr('src', base_url + '/uploads/products/featured_images/' + product.featured_image);
	// 		}
	// 	}
	// });

	///////////////////////////Add to Wish List/////////////////////////////////////

	$(document).on('click','.add-wish-list', function(e) {

		var jsProduct_id = $(this).attr('data-product-id');
		var jsPage = $(this).attr('data-page');
		var product = $(this);
		e.stopImmediatePropagation()
		var csrf_token = $('meta[name="csrf-token"]').attr('content');
		$.ajax({
			type: "POST",
			dataType: 'json',
			 url: base_url+'/shop/add-wish-list',
		
			data: {product_id:jsProduct_id,_token:csrf_token},
			success: function(data) {
				 // IF TRUE THEN SHOW SUCCESS MESSAGE 
				 if (data.success){
					if ((jsPage && jsPage=='view') && (data.type && data.type =='add')){
						product.html('Remove from WishList');
					}else if((jsPage && jsPage=='view') && (data.type && data.type =='remove')){
						product.html('Add to WishList');
					}
					if (data.type && data.type =='add'){
						product.attr('data-original-title','Remove from WishList');
					
					}else if (data.type && data.type =='remove'){
						product.attr('data-original-title','Add to WishList');
					}
					
				 } 
					notification(data.success, data.msg, 2800);
					if (data.login){
						notification(data.success, data.msg, 2800);
						
					}else{
						window.location.replace(base_url+"/login");
					}
					
			
			},
			error: function(xhr, status, error) {
			//	console.log(xhr.responseText);
			  }
		});
		
		});

	///////////////////////////Add to cart /////////////////////////////////////

		$(document).on('click','.add-to-cart', function(e) {

			var jsProduct_id = $(this).attr('data-product-id');
			var jsvid = $('#vid').val();
			var jsvTitle = $('#vTitle').val();
			var jsvImg = $('#vImg').val();
			
			var jsStatus= $(this).attr('data-status');
			if (jsStatus == undefined){
				jsStatus = 0;
			}
			var jsquantity = $('#quantity').val();
		
			if ((!jsquantity) || jsquantity==0){
				jsquantity = 1;
			}
		
			if (jsStatus == 1){
					$(this).html('Add to cart');
					$(this).attr('data-status', 0);
			}else{
				$(this).html('Remove from cart');
				$(this).attr('data-status', 1);
			}
			
			e.stopImmediatePropagation()
			var csrf_token = $('meta[name="csrf-token"]').attr('content');
			$.ajax({
				type: "POST",
				dataType: 'json',
				 url: base_url+'/shop/add-to-cart',
			
				data: {vImg:jsvImg,vTitle:jsvTitle,status:jsStatus,product_id:jsProduct_id,quantity:jsquantity,vid:jsvid,_token:csrf_token},
				success: function(data) {
					
					 // IF TRUE THEN SHOW SUCCESS MESSAGE  
					 if (data.success){
					
						if (data.success) {
							var quantity_box = $('#quantity-box');
							if (quantity_box){
								$('#quantity-box').addClass('d-none');
							}
						}
						$('.cart-count').html(data.cart_count);
		
					 }
					 

						if (data.login){
							notification(data.success, data.msg, 2800);
						}else{
							// window.open("https://www.educative.io/", "_blank");
							window.location.replace(base_url+"/login");
						}
				
				},
				error: function(xhr, status, error) {
					//console.log(xhr.responseText);
				  }
			});
			
			});

	///////////////////////////Update quantity at cart page/////////////////////////////////////


			$(document).on('change','.update_cart_quantity', function(e) {

				var jsCart_id = $(this).attr('data-cart-id');

				var jsCartquantity = $('#quantity-'+jsCart_id).val();
				if ((!jsCartquantity)){
					jsCartquantity = 1;
				}
				console.log(jsCart_id+" "+jsCartquantity);
				 e.stopImmediatePropagation()
				var csrf_token = $('meta[name="csrf-token"]').attr('content');
				$.ajax({
					type: "POST",
					dataType: 'json',
					 url: base_url+'/shop/update-cart-quantity',
				
					data: {cart_id:jsCart_id,quantity:jsCartquantity,_token:csrf_token},
					success: function(data) {
						 // IF TRUE THEN SHOW SUCCESS MESSAGE  
							
						
					notification(data.success, data.msg, 2800);
					if (data.success) {
						$('.cart-count').html(data.cart_count);
					}

				 setTimeout(function() {
							location.reload();
						}, 1500);
					
					
					},
					error: function(xhr, status, error) {
					//	console.log(xhr.responseText);
					  }
				});
				
				});

	///////////////////////////remove from cart/////////////////////////////////////

				$(document).on('click','.delete_from_cart', function(e) {

					var jsProduct_id = $(this).attr('data-product-id');

				//	console.log(jsProduct_id+" "+jsProduct_id);
					 e.stopImmediatePropagation()
					var csrf_token = $('meta[name="csrf-token"]').attr('content');
					$.ajax({
						type: "POST",
						dataType: 'json',
						 url: base_url+'/shop/delete-cart-item',
					
						data: {product_id:jsProduct_id,_token:csrf_token},
						success: function(data) {
							 // IF TRUE THEN SHOW SUCCESS MESSAGE  
								
							if (data.success) {
								$('.cart-count').html(data.cart_count);
							}
						notification(data.success, data.msg, 2800);
	
					 setTimeout(function() {
								location.reload();
							}, 1500);
						
						
						},
						error: function(xhr, status, error) {
							console.log(xhr.responseText);
						  }
					});
					
					});
	
					
					$(document).on('click','.varients', function(e) {
						console.log($(this));
						$('.varients').removeClass('varient-selected');
						$(this).toggleClass('varient-selected');
						$('#product-carousel .active img').attr('src', $(this).attr('src'));
						$('#product_title').text( $(this).attr('title'))

						$('#vid').val( $(this).attr('data-vid'))
						$('#vTitle').val( $(this).attr('title'))
						$('#vImg').val(  $(this).attr('src'))
					});
					// Initialize carousel
						$('#variantCarousel').carousel({
							interval: false, // Disable auto sliding
							wrap: false // Disable wrapping around
						});

						// Next button event listener to move 3 items forward
						$('#variantCarousel .carousel-control-next').click(function () {
							for (var i = 0; i < 5; i++) {
								$('#variantCarousel').carousel('next');
							}
						});

						// Previous button event listener to move 3 items backward
						$('#variantCarousel .carousel-control-prev').click(function () {
							for (var i = 0; i < 5; i++) {
								$('#variantCarousel').carousel('prev');
							}
						});

  
						
});