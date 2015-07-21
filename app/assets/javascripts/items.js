$('document').ready(function() {

	if (document.body.id != 'item') { return };

	console.log('items.js linked!');

	var itemCat = function(event) {
		var item_id = event.target.parentNode.getAttribute("id").split("_")[1];
		var cat_id = event.target.getAttribute("id").split("_")[1];
		$.ajax({
			url: '/items/'+item_id+'/toggle_category/'+cat_id,
			type: 'PATCH',
			dataType: 'json',
			success: function(result) {
				console.log("category successfully toggled");
			},
			error: function() {
				console.log("error toggling category");
			}
		});
	};

	var itemKey = function(event) {
		var item_id = event.target.parentNode.getAttribute("id").split("_")[1];
		var key_id = event.target.getAttribute("id").split("_")[1];
		$.ajax({
			url: '/items/'+item_id+'/toggle_keyword/'+key_id,
			type: 'PATCH',
			dataType: 'json',
			success: function(result) {
				console.log("keyword successfully toggled");
			},
			error: function() {
				console.log("error toggling keyword");
			}
		});
	};

	var updateItem = function(event) {
		event.preventDefault();
		var form = event.target.parentNode.parentNode;
		var item_id = form.parentNode.getAttribute("id").split("_")[1];
		var params = $(form).serializeArray();
		$.ajax({
			url: '/items/'+item_id,
			type: 'PATCH',
			data: params,
			dataType: 'json',
			success: function() {
				console.log('item updated successfully');

			},
			error: function() {
				console.log('error updating item');
			}

		});
	};

	var deleteItem = function(event) {
		if (window.confirm('Are you sure you want to delete this item?\r\nDeleting will remove this item and all its images and cannot be undone.') == false) { event.preventDefault(); };
	};


	$('.cat').bind('click', itemCat);
	$('.key').bind('click', itemKey);
	$('.update-item').bind('click', updateItem);
	$('.delete').bind('click', deleteItem);

});