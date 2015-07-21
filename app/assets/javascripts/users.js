$('document').ready(function() {

	if (document.body.id != 'user') { return };

	console.log('users.js linked!');

	var updateUser = function(event) {
		event.preventDefault();  
		var form = event.target.parentNode.parentNode;
		var user_id = form.parentNode.getAttribute("id").split("_")[1];
		var params = $(form).serializeArray();
		$.ajax({
			url: '/users/'+user_id,
			type: 'PATCH',
			data: params,
			dataType: 'json',
			success: function(result) {
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
				console.log('password successfully changed');
				$('#message').text(result);
				$('.pass').val("");
				$('.newpass').val("");
			},
			error: function() {
				$('#message').text('ERROR: Password NOT changed.');
				$('.pass').val("");
				$('.newpass').val("");
			}
		});
	};


	$('.update-user').bind('click', updateUser);
	$('.new-password').bind('click', changePassword);



});