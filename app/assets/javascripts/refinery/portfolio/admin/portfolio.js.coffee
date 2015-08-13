# Use local alias
$ = jQuery

window.portfolio =
  append_image: (images) ->
    $.each images, (index, image) ->
      image_id = $(image).attr('id').replace 'image_', ''
      image_src = $(image).attr('data-medium')
      new_image = $('li.image_field.blank:first').clone() # Clone li

      new_image.find('.attributes input.image_id').val image_id # Set input image_id value = image_id

      # Create thumbnail
      $('<img/>', {src: image_src}).appendTo(new_image.find('.thumb'))

      new_image
        .attr('id', "image_#{image_id}") # Update id
        .appendTo('#page_images') # Append to list
        .removeClass('blank')


$ ->
  page_options.init(false, '', '')
  $('#page_images').sortable()

  # Edit image association?

  # Remove image association
  $(document).on 'click', '#page_images li .remove_icon', ->
    if confirm("Are you sure you want to remove this image?")
      $(this).parents('li').remove()
    else
      false


