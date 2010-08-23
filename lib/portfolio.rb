require 'refinery'

module Refinery
  module Portfolio

    autoload :Version, 'portfolio/version'

    class << self
      def multi_level?
        RefinerySetting.table_exists? and RefinerySetting.find_or_set(:multi_level_portfolio, false, {
          :callback_proc_as_string => %q{::ActionController::Routing::Routes.reload!},
          :restricted => true
        })
      end
    end

    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "portfolio"
          plugin.title = "Portfolio"
          plugin.description = "Manage a portfolio within RefineryCMS"
          plugin.version = ::Refinery::Portfolio::Version.to_s
          plugin.menu_match = /admin\/portfolio(_entries)?/
          plugin.activity = {
            :class => PortfolioEntry
          }
        end

      end
    end
  end
end
