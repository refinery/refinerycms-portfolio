module Refinery
  module Portfolio
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery::Portfolio

      engine_name :refinery_portfolio

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "portfolio"
          plugin.url = { :controller => 'refinery/portfolio/admin/galleries' }
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
