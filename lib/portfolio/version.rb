module Refinery
  module Portfolio
    def self.version
      ::Refinery::Portfolio::Version.to_s
    end

    class Version
      def self.to_s
        %q{0.9.8}
      end
    end
  end
end