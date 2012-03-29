# Use local alias
$ = jQuery

window.portfolio =
  append_image: (image) ->
    image_id = $(image).attr('id').replace 'image', ''
    new_image = $('#page_images li.image_field:first-child').clone() # Clone li

    # new_item.find('input').next().val image_id # Set input image_id value = image_id

    # Update thumbnail
    new_image.find('.thumb img').attr('src', $(image).attr('data-grid'))
    # Update id
    new_image.attr('id', "image_#{image_id}")

    # Append to list
    new_image.appendTo '#page_images'

$ ->
  page_options.init(false, '', '')
  $('#page_images').sortable()

  # Edit image association?

  # Remove image association
  $('.delete_image').on 'click', -> 
    if confirm("Are you sure you want to delete this image?")
      $(this).parents('li').remove()
    else
      false


