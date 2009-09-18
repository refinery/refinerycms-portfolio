class Admin::PortfolioEntriesController < Admin::BaseController
 
  crudify :portfolio_entry, :order => 'position ASC', :conditions => "parent_id IS NULL"
  before_filter :find_all_images
  before_filter :collect_selected_images, :only => :edit
  
  def find_all_images
    @images = Image.find_all_by_parent_id(nil).sort_by { |image| image.title }
  end
 
protected
  
  # This is used to tell the multiple image select which images are currently selected
  # This is duplication. Must find a better solution
  def collect_selected_images
    @selected = @portfolio_entry.images.collect do |image|
      image.image_id.to_i
    end
  end

end