$('document').ready(function() {

	if (document.body.id != 'user') { return };

	console.log('users.js linked!');

	var updateUser = function(event) {
		event.preventDefault();  
		var form = event.target.parentNode.parentNode;
		var user_id = form.parentNode.getAttribute("id").split("_")[1];
		var params = $(form).serializeArray();
		console.log(params);
		$.ajax({
			url: '/users/'+user_id,
			type: 'PATCH',
			data: params,
			dataType: 'json',
			success: function() {
				console.log('success');

			},
			error: function() {
				console.log('error');

			}
		});
		


	};



	$('.update-user').bind('click', updateUser);


});