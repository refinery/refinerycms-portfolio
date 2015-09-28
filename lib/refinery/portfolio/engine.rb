module Refinery
  module Portfolio
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery::Portfolio

      engine_name :refinery_portfolio

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinerycms_portfolio"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.portfolio_admin_galleries_path }
          plugin.menu_match = %r{refinery/portfolio(/galleries(/.*)?)?(/items(/.*)?)?$}
        end

        Rails.application.config.assets.precompile += %w(
          refinery/portfolio/admin/galleries.css
        )
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::Portfolio)
      end
    end
  end
end
