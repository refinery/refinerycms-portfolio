module Refinery
  module Portfolio

    def self.version
      ::Refinery::Portfolio::Version.to_s
    end

    class Version
      def self.to_s
        %q{0.9.7}
      end
    end

    class << self
      def multi_level?
        RefinerySetting.table_exists? and RefinerySetting.find_or_set(:multi_level_portfolio, false, {
          :callback_proc_as_string => %q{::ActionController::Routing::Routes.reload!},
          :restricted => true
        })
      end
    end
  end
end
