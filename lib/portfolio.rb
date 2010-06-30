module Refinery
  module Portfolio
    class Version
      MAJOR = 0
      MINOR = 9
      TINY = 6
      BUILD = nil

      STRING = [MAJOR, MINOR, TINY, BUILD].compact.join('.')
    end

    class << self
      def multi_level?
        RefinerySetting.table_exists? and RefinerySetting.find_or_set(:multi_level_portfolio, true, {
          :callback_proc_as_string => %q{::ActionController::Routing::Routes.reload!},
          :restricted => true
        })
      end
    end
  end
end
