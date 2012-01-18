var portfolio_entry_url = null;

$(document).ready(function() {
  $('h1#body_content_page_title').addClass('clearfix');
  
  $("ul#portfolio_images li.other a img").fadeTo(0, 0.3);

  $('#portfolio_entry_to_param').change(function() {
    window.location = portfolio_entry_url + this.value;
  });

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