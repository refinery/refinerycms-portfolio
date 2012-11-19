module Refinery
  module Portfolio
    class GalleriesController < ::ApplicationController

      before_filter :find_page

      def index
        @galleries = Gallery.roots
        @items = Item.root_items
        present(@page)
      end

      def show
        @gallery = Gallery.find(params[:id])
        @galleries = @gallery.children
        @items = @gallery.items
        present(@page)

        render :action => "index"
      end

    protected

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/portfolio").first
      end

    end
  end
end
