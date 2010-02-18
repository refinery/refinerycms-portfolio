reset_functionality = function() {
  $("#portfolio_images").sortable({
    'tolerance': 'pointer'
    , 'placeholder': 'placeholder'
    , 'cursor': 'drag'
    , 'items': 'li'
  });

  $('#portfolio_images li:not(.empty)').each(function(index, li) {
    $(li).mouseover(function(e){
      if ((image_actions = $(this).find('.image_actions')).length == 0) {
        image_actions = $("<div class='image_actions'></div>");
        img_delete = $("<img src='/images/refinery/icons/delete.png' width='16' height='16' />");
        img_delete.appendTo(image_actions);
        img_delete.click(function() {
          $(this).parent().remove();
        });

        image_actions.appendTo($(li));
      }

      image_actions.show();
    });

    $(li).mouseout(function(e) {
      $(this).find('.image_actions').hide();
    });
  });
}

image_added = function(image) {
  last_portfolio_entry_image_id = "";
  image_id = $(image).attr('id').replace('image_', '');
  hidden_identifier = $('li.empty').find('input:hidden');
  hidden_identifier.attr('id', '').val(image_id);
  $('li.empty').find('img').css('display', '').attr({'id': '', 'src': $(image).attr('src').replace('_dialog_thumb', '_grid'), 'title': $(image).attr('title'), 'alt': $(image).attr('alt')});
  $('li.empty').attr('id', 'image_' + image_id).removeClass('empty');

  new_list_item = $("<li class='empty'></li>");
  $("<img id='current_portfolio_entry_image' src='' alt='' style='display:none;' />").appendTo(new_list_item);
  $("<input type='hidden' id='portfolio_entry_image_id' name='portfolio_entry[image_ids][]' />").appendTo(new_list_item);

  new_list_item.appendTo($('#portfolio_images'));
  reset_functionality();
}

$(document).ready(reset_functionality);