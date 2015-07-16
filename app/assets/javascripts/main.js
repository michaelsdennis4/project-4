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
		event.preventDefault();
		var form = event.target.parentNode;
		var params = $(form).serializeArray();
		$.ajax({
			url: '/categories',
			type: 'POST',
			data: params,
			dataType: 'json',
			success: function(result) {
				console.log(result);
				var output = Mustache.render($('#cat-template').html(), result);
				console.log(output);
        $('#cat-list').append(output);
        $(".update-cat").bind('click', updateCat);
				$(".delete-cat").bind('click', deleteCat);
				$(".cat-name").val("");			
				console.log("category successfully added");
			},
			error: function() {
				console.log("error adding category");
			}
		});
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
		var form = event.target.parentNode;
		var params = $(form).serializeArray();
		$.ajax({
			url: '/keywords',
			type: 'POST',
			data: params,
			dataType: 'json',
			success: function(result) {
				console.log(result);
				var output = Mustache.render($('#key-template').html(), result);
				console.log(output);
        $('#key-list').append(output);
        $(".update-key").bind('click', updateKey);
				$(".delete-key").bind('click', deleteKey);
				$(".key-name").val("");			
				console.log("keyword successfully added");
			},
			error: function() {
				console.log("error adding keyword");
			}
		});
	};

	$(".update-cat").bind('click', updateCat);
	$(".delete-cat").bind('click', deleteCat);
	$(".new-cat").bind('click', newCat);

	$(".update-key").bind('click', updateKey);
	$(".delete-key").bind('click', deleteKey);
	$(".new-key").bind('click', newKey);

});



