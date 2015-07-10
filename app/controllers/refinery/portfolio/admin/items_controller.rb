module Refinery
  module Portfolio
    module Admin
      class ItemsController < ::Refinery::AdminController
        include Refinery::Portfolio

        crudify :'refinery/portfolio/item', :order => 'position ASC'

        before_filter :find_gallery, :only => [:index]

        def index
          if params[:orphaned]
            @items = Item.orphaned.order('position ASC')
          elsif @gallery.present?
            @items = @gallery.items.order('position ASC')
          else
            redirect_to refinery.portfolio_admin_galleries_path and return
          end

          @items = @items.page(params[:page])
        end

        def new
          @item = Item.new(gallery: find_gallery)
        end

        protected
          def find_gallery
            @gallery = Gallery.friendly.find(params[:gallery_id]) if params[:gallery_id]
          end

        private
          def item_params
            params.require(:item).permit(:title, :caption, :image_id, :gallery_id)
          end

      end
    end
  end
end
