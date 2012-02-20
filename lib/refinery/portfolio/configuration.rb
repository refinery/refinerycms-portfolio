module Refinery
  module Portfolio
    include ActiveSupport::Configurable

    config_accessor :approximate_ascii, :strip_non_ascii, :cache_galleries_backend

    self.approximate_ascii = false
    self.strip_non_ascii = false
    self.cache_galleries_backend = false

  end
end
