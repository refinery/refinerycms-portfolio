require 'refinery'

module Refinery
  module Portfolio

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
          plugin.version = ::Refinery::Portfolio.version
          plugin.menu_match = /admin\/portfolio(_entries)?/
          plugin.activity = {
            :class => PortfolioEntry
          }
        end unless Refinery::Plugins.registered.names.include?('portfolio')
      end
    end
  end
end

require File.expand_path('../portfolio', __FILE__)
