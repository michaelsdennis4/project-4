console.log('main.js linked!');

$('document').ready(function() {

	var updateCat = function(event) {
		event.preventDefault();
		id = event.target.getAttribute("id").split("_")[1];
		var params = $(event.target.parentElement).serializeArray();
		$.ajax({
			url: '/categories/'+id,
			type: 'PATCH',
			data: params,
			dataType: 'json',
			success: function(result) {
				console.log("category successfully updated");
			},
			error: function() {
				console.log("error updating category");
			}
		});
	};

	var deleteCat = function(event) {
		event.preventDefault();
		var id = event.target.getAttribute("id").split("_")[1];
		var form = event.target.parentNode;
		var params = $(form).serializeArray();
		$.ajax({
			url: '/categories/'+id,
			type: 'DELETE',
			data: params,
			dataType: 'json',
			success: function(result) {
				$(form.parentNode).remove();
				console.log("category successfully deleted");
			},
			error: function() {
				console.log("error deleting category");
			}
		});
	};

	var newCat = function(event) {
		var form = event.target.parentNode;
		var params = $(form).serializeArray();
		$.ajax({
			url: '/categories',
			type: 'POST',
			data: params,
			dataType: 'json',
			success: function(result) {
				// $('#cat-key-list').
			
				console.log("category successfully added");
			},
			error: function() {
				console.log("error adding category");
			}
		});


	};

	$(".update_cat").bind('click', updateCat);
	$(".delete_cat").bind('click', deleteCat);
	$("#new_cat").bind('click', newCat);

});



