module Refinery
  module Portfolio
    module Admin
      class ItemsController < ::Refinery::AdminController
        crudify :'refinery/portfolio/item',
                :order => 'lft ASC',
                :xhr_paging => true

        def index
          if params[:orphaned]
            @items = Item.orphaned
          elsif params[:gallery_id]
            @items = Item.child_of(params[:gallery_id])
          else
            @items = Item
          end

          @items = @items.paginate(:page => params[:page], :per_page => ::Refinery::Portfolio.items_per_page)
        end

        def new
          @item = ::Refinery::Portfolio::Item.new(params.except(:controller, :action, :switch_locale))
        end

      end
    end
  end
end
