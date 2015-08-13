module Refinery
  module Portfolio
    module Admin
      class GalleriesController < ::Refinery::AdminController

        crudify :'refinery/portfolio/gallery',
                :order => 'lft ASC',
                :include => [:children, :translations],
                :paging => false

        def new
          @gallery = ::Refinery::Portfolio::Gallery.new(:parent_id => find_parent_gallery)
        end

        def children
          @gallery = find_gallery
          render :layout => false
        end

        protected

        def find_parent_gallery
          if params[:parent_id].present?
            ::Refinery::Portfolio::Gallery.find(params[:parent_id])
          end
        end

        def find_gallery
          if params[:id].present?
            @gallery = ::Refinery::Portfolio::Gallery.friendly.find(params[:id])
          end
        end

        private

        def gallery_params
          params.require(:gallery).permit(:title, :body, :parent_id, images: [])
        end

      end
    end
  end
end
