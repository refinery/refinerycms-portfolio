module Refinery
  module Portfolio
    include ActiveSupport::Configurable

    config_accessor :items_per_page

    self.items_per_page = 20

  end
end
