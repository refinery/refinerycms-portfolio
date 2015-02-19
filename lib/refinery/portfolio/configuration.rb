module Refinery
  module Portfolio
    include ActiveSupport::Configurable

    config_accessor :items_per_page, :cover_image_thumb_size,
                    :display_item_text, :display_gallery_text,
                    :page_url

    self.items_per_page = 20
    self.cover_image_thumb_size = '300x200'

    self.display_item_text = true
    self.display_gallery_text = true

    self.page_url = '/portfolio'
  end
end
