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


	$('.cat').bind('click', itemCat);
	$('.key').bind('click', itemKey);

});