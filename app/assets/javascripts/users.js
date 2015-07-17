$('document').ready(function() {

	if (document.body.id != 'user') { return };

	console.log('users.js linked!');

	var updateUser = function(event) {
		event.preventDefault();
		var form = event.target.parentNode.parentNode;
		var params = $(form).serializeArray();
		


	};



	// $('.update-user').bind('click', updateUser);


});