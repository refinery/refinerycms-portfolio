module Refinery
  module Portfolio
    module Admin
      class ItemsController < ::Refinery::AdminController
        include Refinery::Portfolio

        crudify :'refinery/portfolio/item',
                :order => 'position ASC',
                :xhr_paging => true

        before_filter :find_gallery, :only => [:index]

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
          @item = Item.new(:gallery_id => find_gallery)
        end

        private
        def find_gallery
          @gallery = Gallery.find(params[:gallery_id]) if params[:gallery_id]
          defined?(@gallery) && !@gallery.nil? ? @gallery.id : nil
        end

      end
    end
  end
end
