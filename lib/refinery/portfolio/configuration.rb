module Refinery
  module Portfolio
    include ActiveSupport::Configurable

    config_accessor :approximate_ascii, :strip_non_ascii, :cache_galleries_backend,
                    :items_per_page

    self.approximate_ascii = false
    self.strip_non_ascii = false
    self.cache_galleries_backend = false

    self.items_per_page = 20

  end
end
