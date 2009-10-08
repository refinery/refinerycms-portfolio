reset_functionality = function() {
	Sortable.destroy("portfolio_images");
	Sortable.create("portfolio_images", {
		constraint: false
		, hoverclass: 'hover'
		, scroll: window
		, tree: false
	});			
	
	$$('#portfolio_images li:not([class=empty])').each(function(li) {
		li.observe('mouseover', function(){
			image_actions = this.down('.image_actions');
			if (image_actions == null) {
				image_actions = new Element("div").addClassName('image_actions');
				img_delete = new Element("img", {src: '/images/refinery/icons/delete.png', width: 16, height: 16});
				image_actions.insert(img_delete);
				img_delete.observe('click', function() {
					this.up('li').remove();
				});
				
				li.insert(image_actions);
			}
			
			image_actions.show();
		});
		
		li.observe('mouseout', function() {
			this.down('.image_actions').hide();
		});
	});
}

image_added = function() {
	last_portfolio_entry_image_id = "";
	$$('li.empty').each(function(empty) {
		hidden_identifier = empty.down('input[type=hidden]');
		hidden_identifier.id = '';
		image_id = hidden_identifier.value;
		empty.id = 'image_' + image_id;
		empty.removeClassName('empty');
		$(empty.down('img')).setStyle({display: ''}).removeAttribute('id');
	});
	
	new_list_item = new Element("li").addClassName("empty");
	img = new Element("img", {id: 'current_portfolio_entry_image', src: '', alt: '', style: 'display:none'});
	
	hidden_id = new Element("input", {'type': 'hidden', 'id' : "portfolio_entry_image_id", 'name':'portfolio_entry[image_ids][]'});
	
	new_list_item.insert(img);
	new_list_item.insert(hidden_id);
	$('portfolio_images').insert(new_list_item);
	reset_functionality();
}

FastInit.addOnLoad(function(){
	reset_functionality();
});