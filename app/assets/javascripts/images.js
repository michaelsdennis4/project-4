$('document').ready(function() {

	if (document.body.id != 'image') { return };

	console.log('images.js linked!');

	var updateCaption = function(event) {
		event.preventDefault();
		var item_id = event.target.getAttribute('id').split('_')[1];
		var image_id = event.target.getAttribute('id').split('_')[3];
		var params = $(event.target.parentNode).serializeArray();
		console.log(params);
		$.ajax({
			url: '/items/'+item_id+'/images/'+image_id,
			type: 'PATCH',
			data: params,
			dataType: 'json',
			success: function() {
				console.log("caption updated successfully!");
			},
			error: function() {
				console.log("there was a problem updating the caption.");
			}
		});
	};

	var deleteImage = function(event) {
		event.preventDefault();
		var item_id = event.target.getAttribute('id').split('_')[1];
		var image_id = event.target.getAttribute('id').split('_')[3];
		var image_div = event.target.parentNode.parentNode.parentNode;
		$.ajax({
			url: '/items/'+item_id+'/images/'+image_id,
			type: 'DELETE',
			dataType: 'json',
			success: function() {
				$(image_div).remove();
				console.log("image deleted successfully!");
			},
			error: function() {
				console.log("there was a problem deleting the image.");
			}
		});
	};

	$('.update-caption').bind('click', updateCaption);
	$('.delete').bind('click', deleteImage);

});