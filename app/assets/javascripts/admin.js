$('document').ready(function() {

	if (document.body.id != 'admin') { return };

	console.log('admin.js linked!');

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
		if (window.confirm('Are you sure you want to delete this category?\r\nDeleting will remove this category from all items and cannot be undone.') != true) { return };
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
		event.preventDefault();
		if ($("#cat-name").val().length > 0) {
			var form = event.target.parentNode;
			var params = $(form).serializeArray();
			$.ajax({
				url: '/categories',
				type: 'POST',
				data: params,
				dataType: 'json',
				success: function(result) {
					var output = Mustache.render($('#cat-template').html(), result);
	        $('#cat-list').append(output);
	        $(".update-cat").bind('click', updateCat);
					$(".delete-cat").bind('click', deleteCat);
					$("#cat-name").val("");			
					console.log("category successfully added");
				},
				error: function() {
					console.log("error adding category");
				}
			});
		};
	};

		var updateKey = function(event) {
		event.preventDefault();
		id = event.target.getAttribute("id").split("_")[1];
		var params = $(event.target.parentElement).serializeArray();
		$.ajax({
			url: '/keywords/'+id,
			type: 'PATCH',
			data: params,
			dataType: 'json',
			success: function(result) {
				console.log("keyword successfully updated");
			},
			error: function() {
				console.log("error updating keyword");
			}
		});
	};

	var deleteKey = function(event) {
		event.preventDefault();
		if (window.confirm('Are you sure you want to delete this keyword?\r\nDeleting will remove this keyword from all items and cannot be undone.') != true) { return };
		var id = event.target.getAttribute("id").split("_")[1];
		var form = event.target.parentNode;
		var params = $(form).serializeArray();
		$.ajax({
			url: '/keywords/'+id,
			type: 'DELETE',
			data: params,
			dataType: 'json',
			success: function(result) {
				$(form.parentNode).remove();
				console.log("keyword successfully deleted");
			},
			error: function() {
				console.log("error deleting keyword");
			}
		});
	};

	var newKey = function(event) {
		event.preventDefault();
		if ($("#key-phrase").val().length > 0) {
			var form = event.target.parentNode;
			var params = $(form).serializeArray();
			$.ajax({
				url: '/keywords',
				type: 'POST',
				data: params,
				dataType: 'json',
				success: function(result) {
					var output = Mustache.render($('#key-template').html(), result);
	        $('#key-list').append(output);
	        $(".update-key").bind('click', updateKey);
					$(".delete-key").bind('click', deleteKey);
					$("#key-phrase").val("");			
					console.log("keyword successfully added");
				},
				error: function() {
					console.log("error adding keyword");
				}
			});
		};
	};

	$(".update-cat").on('click', updateCat);
	$(".delete-cat").on('click', deleteCat);
	$(".new-cat").on('click', newCat);

	$(".update-key").on('click', updateKey);
	$(".delete-key").on('click', deleteKey);
	$(".new-key").on('click', newKey);

	//UI

	$(function() {
		$('#cat-list').sortable();
		$('#cat-list').disableSelection();
	});

	$('#cat-list').on('sortstop', function(event) {
		console.log('list sorted');
		//ajax call to re-sort list on server

	});

});



