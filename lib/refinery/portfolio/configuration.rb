module Refinery
  module Portfolio
    include ActiveSupport::Configurable

    config_accessor :items_per_page, :cover_image_thumb_size

    self.items_per_page = 20
    self.cover_image_thumb_size = '300x200'
  end
end
