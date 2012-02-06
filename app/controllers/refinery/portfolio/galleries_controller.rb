module Refinery
  module Portfolio
    class GalleriesController < ::ApplicationController

      before_filter :find_page

      def index
        @galleries = Gallery.roots.order('position ASC')
        present(@page)
      end

      def show
        @galleries = Gallery.find(params[:id]).children
        present(@page)

        render :action => "index"
      end

    protected

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/galleries").first
      end

    end
  end
end
