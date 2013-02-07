module Refinery
  module Portfolio
    module Admin
      class ItemsController < ::Refinery::AdminController
        include Refinery::Portfolio

        crudify :'refinery/portfolio/item',
                :order => 'position ASC',
                :xhr_paging => true

        before_filter :find_gallery, :only => [:index, :new]
        before_filter :get_galleries, :only => [:edit, :new]

        def index
          if params[:orphaned]
            @items = Item.orphaned.order('position ASC')
          elsif params[:gallery_id]
            @items = @gallery.items.order('position ASC')
          else
            redirect_to refinery.portfolio_admin_galleries_path and return
          end

          @items = @items.page(params[:page])
        end

        def new
          @item = Item.new
          if params[:gallery_id]
            @item.gallery_id = @gallery.id
          end
        end

        private
        def find_gallery
          @gallery = Gallery.where(slug: params[:gallery_id]).first if params[:gallery_id]
        end

        def get_galleries
          @galleries = Gallery.all
        end

      end
    end
  end
end
