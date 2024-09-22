$(document).ready(function() {

	const base_url = window.location.origin;

	var creatCategoryModal = document.getElementById('creatCategoryModal')
	creatCategoryModal.addEventListener('show.bs.modal', function(event) {
		// Button that triggered the modal
		var button = event.relatedTarget;
		var cat = JSON.parse(button.getAttribute('data-cat'));
		var imageUrl = button.getAttribute('data-image-id');
		$('#creatCategoryModalBtn').html('Save');
		$('#title').val('');
		$('#description').val('');
		$('#catId').val('null');
		$('#imageId').val('null');
		$('#categoryImage').attr('src', base_url + '/no-image.png');
		$('#featured').prop("checked", false);
		$('#trending').prop("checked", false);
		$('#active').prop("checked", false);
		$('#addEditCatImage').attr('src', base_url + '/no-image.png');

		if (cat) {
			$('#title').val(cat.title);
			$('#description').val(cat.description);
			$('#catId').val(cat.id);
			$('#imageId').val(cat.image_url);
			$('#categoryImage').attr('src', base_url + '/uploads/category/' + cat.image_url);

			if (cat.is_featured == 1) {
				$('#featured').prop("checked", true);
			}
			if (cat.is_trending == 1) {
				$('#trending').prop("checked", true);
			}

			if (cat.is_active == 1) {
				$('#active').prop("checked", true);
			}
			let imageExist = fileExists(base_url + '/uploads/category/' + cat.image_url);
			if (imageExist) {
				$('#addEditCatImage').attr('alt', cat.title);
				$('#addEditCatImage').attr('src', base_url + '/uploads/category/' + cat.image_url);
			}
		}

	});

	function fileExists(url) {
		if (url) {
			var req = new XMLHttpRequest();
			req.open('GET', url, false);
			req.send();
			return req.status == 200;
		} else {
			return false;
		}
	}
	var deleteCategoryModal = document.getElementById('deleteCategoryModal')
	deleteCategoryModal.addEventListener('show.bs.modal', function(event) {
		// Button that triggered the modal
		var button = event.relatedTarget;
		var cat = JSON.parse(button.getAttribute('data-cat'));
		$('#deleteCategoryFormBtn').html('Delete');
		$('#deleteCatImage').attr('src', base_url + '/no-image.png');
		if (cat) {
			$('#deleteCatId').attr('value', cat.id);
			let imageExist = fileExists(base_url + '/uploads/category/' + cat.image_url);
			if (imageExist) {
				$('#deleteCatImage').attr('alt', cat.title);
				$('#deleteCatImage').attr('src', base_url + '/uploads/category/' + cat.image_url);
			}
		}
	});
	// #ajax setup#
	$(function() {
		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			}
		});
	});

	$(document).on('click', '#addEditCategoryFormBtn', function(e) {
		e.preventDefault();
		$('#addEditCategoryFormBtn').html('Loading...');
		var csrf_token = $('meta[name="csrf-token"]').attr('content');

		var jsTrending = $('#trending').is(":checked");
		var jsFeatured = $('#featured').is(":checked");
		var jsActive = $('#active').is(":checked");
		if (jsActive == true) {
			jsActive = 1;
		} else {
			jsActive = 0;

		}
		if (jsFeatured == true) {
			jsFeatured = 1;
		} else {
			jsFeatured = 0;

		}
		if (jsTrending == true) {
			jsTrending = 1;
		} else {
			jsTrending = 0;

		}
		let catForm = document.getElementById('addEditCategoryForm');
		let myformData = new FormData(catForm);
		myformData.append('is_featured', jsFeatured);
		myformData.append('is_active', jsActive);
		myformData.append('is_trending', jsTrending);

		// console.log(csrf_token+" -> "+jsTitle + ' -> ' + jsCatId + ' -> ' + jsDescription + ' -> ' + jsImgae + ' -> ' + jsActive  + ' -> ' +  jsFeatured + ' -> ' + jsTrending);
		$.ajax({
			type: "POST",
			dataType: 'json',
			data: myformData,
			contentType: false,
			cache: false,
			processData: false,

			url: base_url + '/admin/category/save',

			success: function(data) {

				notification(data.success, data.msg, 2800);
				setTimeout(function() {
					$('#creatCategoryModal').modal('hide');
					$("#creatCategoryModal .btn-close").click();
				}, 1000);
				if (data.success) {
					setTimeout(function() {
						window.location.href = base_url + '/admin/category';
					}, 3000);

				}


			},

			error: function(xhr, status, error) {
				//	alert(xhr.responseText);

				$('#addEditCategoryFormBtn').html('Save');

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


	$(document).on('click','.switch_statusCategory', function(e) {

		if($(this).is(":checked")){
			var category_status = 1;
		}
		else if($(this).is(":not(:checked)")){
			var category_status = 0;
		}
		var category_id = $(this).attr('data-cat-id');

		var csrf_token = $('meta[name="csrf-token"]').attr('content');
			$.ajax({
				type: "POST",
				dataType: 'json',
				url: base_url+'/admin/category/enable-disable',

				data: {status:category_status,category_id:category_id,_token:csrf_token},
				success: function(data) {
					// IF TRUE THEN SHOW SUCCESS MESSAGE  
				
						notification(data.success, data.msg, 2800);
				
				},
				error: function(xhr, status, error) {
				//	console.log(xhr.responseText);
				}
			});

	});

	$(document).on('click', '.deleteCategoryFormBtn', function(e) {
		e.preventDefault();
		$('#deleteCategoryFormBtn').html('Loading...');
		var csrf_token = $('meta[name="csrf-token"]').attr('content');
		var jsCatId = $('#deleteCatId').val();
		// console.log(jsCatId);
		$.ajax({
			type: "POST",
			dataType: 'json',
			url: base_url + '/admin/category/delete',
			data: {
				_token: csrf_token,
				catId: jsCatId
			},
			success: function(data) {

				if (data.success) {
					let catRow = document.getElementById('cat-row-' + jsCatId);
					catRow.remove();
				}
				notification(data.success, data.msg, 2800);
				setTimeout(function() {
					$('#deleteCategoryModal').modal('hide');
					$("#deleteCategoryModal .btn-close").click();
				}, 1000);


			},

			error: function(xhr, status, error) {
				// console.log(xhr.responseText);
			}

		});
	});


	var restoreCategoryModal = document.getElementById('restoreCategoryModal')
	restoreCategoryModal.addEventListener('show.bs.modal', function(event) {
		// Button that triggered the modal
		var button = event.relatedTarget;
		var cat = JSON.parse(button.getAttribute('data-restore-cat'));
		
		$('#restoreCategoryFormBtn').html('Restore');
		$('#restoreCatImage').attr('src', base_url + '/no-image.png');
		if (cat) {
			$('#restoreCatId').attr('value', cat.id);
			let imageExist = fileExists(base_url + '/uploads/category/' + cat.image_url);
			if (imageExist) {
				$('#restoreCatImage').attr('alt', cat.title);
				$('#restoreCatImage').attr('src', base_url + '/uploads/category/' + cat.image_url);
			}
		}
	});


	$(document).on('click', '#restoreCategoryFormBtn', function(e) {
		e.preventDefault();
		$('#restoreCategoryFormBtn').html('Loading...');

		var csrf_token = $('meta[name="csrf-token"]').attr('content');
		var jsCatId = $('#restoreCatId').val();
		$.ajax({
			type: "POST",
			dataType: 'json',
			url: base_url + '/admin/category/restore',
			data: {
				_token: csrf_token,
				restoreCatId: jsCatId
			},
			success: function(data) {

				if (data.success) {
					let catRow = document.getElementById('cat-row-' + jsCatId);
					catRow.remove();
				}
				notification(data.success, data.msg, 2800);

				setTimeout(function() {
					$('#restoreCategoryModal').modal('hide');
					$("#restoreCategoryModal .btn-close").click();
				}, 1000);


			},

			error: function(xhr, status, error) {
				// console.log(xhr.responseText);
			}

		});
	});



	$(document).on('click', '.permDeleteCategoryFormBtn', function(e) {
		e.preventDefault();
		$('#deleteCategoryFormBtn').html('Loading...');
		var csrf_token = $('meta[name="csrf-token"]').attr('content');
		var jsCatId = $('#deleteCatId').val();
		$.ajax({
			type: "POST",
			dataType: 'json',
			url: base_url + '/admin/category/delete-permanent',
			data: {
				_token: csrf_token,
				catId: jsCatId
			},
			success: function(data) {

				if (data.success) {
					let catRow = document.getElementById('cat-row-' + jsCatId);
					catRow.remove();
				}
				notification(data.success, data.msg, 2800);
				// console.log(data.success + ' -> ' + data.msg);

				setTimeout(function() {
					$('#deleteCategoryModal').modal('hide');
					$("#deleteCategoryModal .btn-close").click();
				}, 1000);


			},

			error: function(xhr, status, error) {
				// console.log(xhr.responseText);
			}

		});
	});


});