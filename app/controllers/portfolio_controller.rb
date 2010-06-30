class PortfolioController < ApplicationController

  before_filter :load_page, :only => [:index, :show, :empty]

  def index
    redirect_to portfolio_url(PortfolioEntry.find_by_parent_id(nil, :order => "position ASC")) rescue error_404
  end

  def show
    begin
      if params[:id]
        @master_entry = PortfolioEntry.find(params[:id])
      else
        @master_entry = PortfolioEntry.find_by_parent_id(nil, :order => "position ASC")
      end

      if ::Refinery::Portfolio.multi_level?
        if params[:portfolio_id]
          @portfolio_entry = @master_entry.children.find(params[:portfolio_id])
        else
          @portfolio_entry = @master_entry.children.first
        end
      else
        @portfolio_entry = @master_entry
      end

      begin
        if params[:image_id]
          @image = @portfolio_entry.images[params[:image_id].to_i]
        else
          @image = @portfolio_entry.images.first
        end
      rescue
        render :action => "empty"
      end
    rescue
      error_404
    end

    render :partial => "main_image", :layout => false if request.xhr?
  end

protected

  def load_page
    @page = Page.find_by_link_url('/portfolio', :include => [:parts])
  end

end
