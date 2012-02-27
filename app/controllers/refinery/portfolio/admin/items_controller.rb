module Refinery
  module Portfolio
    module Admin
      class ItemsController < ::Refinery::AdminController
        crudify :'refinery/portfolio/item',
                :order => 'lft ASC'

        def index
          if params[:orphaned]
            @items = Item.orphaned
          elsif params[:gallery_id]
            @items = Item.child_of(params[:gallery_id])
          else
            @items = Item.all
          end
        end

        def new
          @item = ::Refinery::Portfolio::Item.new(params.except(:controller, :action, :switch_locale))
        end

      end
    end
  end
end
