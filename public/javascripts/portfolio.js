var portfolio_entry_url = null;

reset_functionality = function() {
  $("#portfolio_images").sortable({
    'tolerance': 'pointer'
    , 'placeholder': 'placeholder'
    , 'cursor': 'drag'
    , 'items': 'li'
    , stop: reindex_images
  });

  $('#content #portfolio_images li:not(.empty)').each(function(index, li) {
    $(this).hover(function(e){
      if ((image_actions = $(this).find('.image_actions')).length == 0) {
        image_actions = $("<div class='image_actions'></div>");
        img_delete = $("<img src='/images/refinery/icons/delete.png' width='16' height='16' />");
        img_delete.appendTo(image_actions);
        img_delete.click(function() {
          $(this).parents('li[id*=image_]').remove();
          reindex_images();
        });

        image_actions.appendTo($(li));
      }

      image_actions.show();
    }, function(e) {
      $(this).find('.image_actions').hide();
    });
  });

  reindex_images();
}

reindex_images = function() {
  $('#portfolio_images li input:hidden').each(function(i, input){
    // make the image's name consistent with its position.
    parts = $(input).attr('name').split(']');
    parts[1] = ('[' + i)
    $(input).attr('name', parts.join(']'));

    // make the image's id consistent with its position.
    $(input).attr('id', $(input).attr('id').replace(/_\d_/, '_'+i+'_').replace(/_\d/, '_'+i));
  });
}

image_added = function(image) {
  last_portfolio_entry_image_id = "";
  new_list_item = (current_list_item = $('li.empty')).clone();
  image_id = $(image).attr('id').replace('image_', '');
  current_list_item.find('input:hidden').val(image_id);
  if($('meta[refinerycms]').attr('refinerycms') >= '0.9.9') {
    $("<img />").attr({
      title: $(image).attr('title')
      , alt: $(image).attr('alt')
      , src: $(image).attr('data-grid') // use 'grid' size that is built into Refinery CMS (135x135#c).
    }).appendTo(current_list_item);
  } else {
    $.ajax({
      async: false,
      url: '/refinery/images/'+image_id+'/url',
      data: {size: '135x135#c'},
      success: function (result, status, xhr) {
        (img = $("<img />")).attr({
         title: $(image).attr('title')
         , alt: $(image).attr('alt')
         , src: result.url
        }).appendTo(current_list_item);
      }
    });
  }

  current_list_item.attr('id', 'image_' + image_id).removeClass('empty');

  new_list_item.appendTo($('#portfolio_images'));
  reset_functionality();
}

$(document).ready(function() {
  $('h1#body_content_page_title').addClass('clearfix');
  reset_functionality();

  $("ul#portfolio_images li.other a img").fadeTo(0, 0.3);

  $('#portfolio_entry_to_param').change(function() {
    window.location = portfolio_entry_url + this.value;
  });

  if ((tabs = $('.edit_portfolio_entry #page-tabs, .new_portfolio_entry #page-tabs')).length > 0) {
    page_options.init(false, '', '');
    $('a[href*=portfolio_image_picker]').click(function(){
      if (!(picker = $('#portfolio_image_picker')).data('size-applied')){
        wym_box = $('.page_part:first .wym_box');
        iframe = $('.page_part:first iframe');
        picker.css({
          height: wym_box.height()
          , width: wym_box.width()
        }).data('size-applied', true).corner('tr 5px').corner('bottom 5px').find('.wym_box').css({
          backgroundColor: 'white'
          , height: iframe.height() + $('.page_part:first .wym_area_top').height() - parseInt($('.wym_area_top .label_inline_with_link a').css('lineHeight'))
          , width: iframe.width() - 20
          , 'border-color': iframe.css('border-top-color')
          , 'border-style': iframe.css('border-top-style')
          , 'border-width': iframe.css('border-top-width')
          , padding: '0px 10px 0px 10px'
        });
      }
    });
  }

  var clicked_on = null;
  $("ul#portfolio_images li a").click(function(e) {
    if (!$(this).hasClass('selected')) {
      clicked_on = $(this);
      $.get($(this).attr('href'), function(data, textStatus) {
        if (textStatus == "success") {
          $('#portfolio_main_image').before(data).remove();

          $('ul#portfolio_images li.selected').removeClass('selected').addClass('other');

          clicked_on.parent().removeClass('other').addClass('selected');
          clicked_on.find('img').fadeTo(0, 1);

          $("ul#portfolio_images li.other a img").fadeTo(0, 0.3);
        }
      });
    }

    e.preventDefault();
  });
});