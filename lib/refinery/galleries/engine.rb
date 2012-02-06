module Refinery
  module Portfolio
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Portfolio

      engine_name :refinery_portfolio

      initializer "register refinerycms_galleries plugin" do |app|
        Refinery::Plugin.register do |plugin|
          plugin.name = "galleries"
          plugin.url = {
            :controller => 'refinery/portfolio/admin/galleries',
            :action => 'index'
          }
          plugin.pathname = root

          plugin.activity = {
            :class_name => :'refinery/portfolio/gallery'
          }
          plugin.menu_match = %r{refinery/portfolio/galleries(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::Galleries)
      end
    end
  end
end
