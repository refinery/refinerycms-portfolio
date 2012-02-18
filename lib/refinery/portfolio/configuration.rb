module Refinery
  module Portfolio
    include ActiveSupport::Configurable

    config_accessor :approximate_ascii, :strip_non_ascii

    self.approximate_ascii = false
    self.strip_non_ascii = false

  end
end
