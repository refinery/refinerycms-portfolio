require 'refinerycms-core'
require 'friendly_id/globalize'

module Refinery
  autoload :PortfolioGenerator, 'generators/refinery/portfolio/portfolio_generator'

  module Portfolio
    require 'refinery/portfolio/engine'
    require 'refinery/portfolio/configuration'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
