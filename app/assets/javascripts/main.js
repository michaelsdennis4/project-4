console.log('main.js linked!');

$('document').ready(function() {

	var updateCat = function(event) {
		event.preventDefault();
		id = event.target.getAttribute("id").split("_")[1];
		var params = $(event.target.parentElement).serializeArray();
		console.log('ajaxing');
		$.ajax({
			url: '/categories/'+id,
			type: 'PATCH',
			data: params,
			dataType: 'json',
			success: function(result) {
				console.log("success");


			},
			error: function() {
				console.log("error");


			}
		});

	};

	$(".update_cat").bind('click', updateCat);

});



