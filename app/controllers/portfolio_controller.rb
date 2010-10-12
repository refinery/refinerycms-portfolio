class PortfolioController < ApplicationController

  before_filter :load_page, :only => [:index, :show, :empty]

  def index
    if RefinerySetting.find_or_set(:portfolio_has_no_index, true)
      if (first_entry = PortfolioEntry.where(:parent_id => nil).first).present?
        redirect_to portfolio_url(first_entry)
      end
    else
      @portfolio_entries = PortfolioEntry.all
    end
  end

  def show
    begin
      @master_entry = if params[:id]
        PortfolioEntry.find(params[:id])
      else
        PortfolioEntry.where(:parent_id => nil).first
      end

      if ::Refinery::Portfolio.multi_level?
        multi_level
      else
        single_level
      end

      begin
        image_index = (params[:image_id].presence || '0').to_i
        @image = @portfolio_entry.images[image_index]
      rescue
        render :action => "empty"
      end
    rescue
      error_404
    end

    render :partial => "main_image", :layout => false if request.xhr?
  end

protected

  def multi_level
    @portfolio_entries = @master_entry.children
    @portfolio_entry = if params[:portfolio_id]
      @portfolio_entries.find(params[:portfolio_id])
    else
      @portfolio_entries.first
    end
  end

  def single_level
    @portfolio_entries = PortfolioEntry.all
    @portfolio_entry = @master_entry
  end

  def load_page
    @page = Page.find_by_link_url('/portfolio', :include => [:parts])
  end

end
