$('document').ready(function() {

	if (document.body.id != 'uploads') { return };

	console.log('upload.js linked!');

	var checkUpload = function(event) {

		//need to figure out how to check if there is a file selected
		//maybe use other click event on file select?

		// var form = event.target.parentNode;
		// console.log(form);
		// event.preventDefault();
		// console.log('working');

	};


	$('#upload-submit').bind('click', checkUpload);


});