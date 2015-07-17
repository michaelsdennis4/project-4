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
				console.log('profile updated successfully!');
			},
			error: function() {
				console.log('error updating password');
			}
		});
	};

	var changePassword = function(event) {
		event.preventDefault();  
		var form = event.target.parentNode.parentNode;
		var user_id = form.parentNode.getAttribute("id").split("_")[1];
		var params = $(form).serializeArray();
		$.ajax({
			url: '/change_password',
			type: 'PATCH',
			data: params,
			dataType: 'json',
			success: function(result) {
				console.log('success');
				console.log(result);
				$('#message').text(result);
				//need to clear form
			},
			error: function() {
				console.log('error');
				$('#message').text('ERROR: Password NOT changed.');
				//need to clear form
			}
		});
	};



	$('.update-user').bind('click', updateUser);
	$('.new-password').bind('click', changePassword);


});