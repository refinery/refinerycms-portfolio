module Refinery
  module Portfolio
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery::Portfolio

      engine_name :refinery_portfolio

      initializer "register refinerycms_portfolio plugin" do |app|
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "portfolio"
          plugin.url = { :controller => 'refinery/portfolio/admin/galleries' }

          plugin.activity = {
            :class_name => :'refinery/portfolio/gallery'
          }
          plugin.menu_match = %r{refinery/portfolio(/galleries(/.*)?)?(/items(/.*)?)?$}
        end
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::Portfolio)
      end
    end
  end
end
