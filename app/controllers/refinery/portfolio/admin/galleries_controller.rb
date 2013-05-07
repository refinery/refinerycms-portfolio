module Refinery
  module Portfolio
    module Admin
      class GalleriesController < ::Refinery::AdminController

        crudify :'refinery/portfolio/gallery',
                :order => 'lft ASC',
                :include => [:children],
                :paging => false

        before_filter :find_parent_gallery

        def new
          @gallery = ::Refinery::Portfolio::Gallery.new(:parent_id => @parent_gallery && @parent_gallery.id)
        end

        def children
          @gallery = find_gallery
          render :layout => false
        end

        protected

        def find_parent_gallery
          @parent_gallery = ::Refinery::Portfolio::Gallery.find(params[:parent_id]) if params[:parent_id].present?
        end

        def find_gallery
          @gallery = ::Refinery::Portfolio::Gallery.find(params[:id]) if params[:id].present?
        end

      end
    end
  end
end
