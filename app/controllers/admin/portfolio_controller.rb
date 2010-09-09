class Admin::PortfolioController < Admin::BaseController

  crudify :portfolio_entry, :order => 'lft ASC', :conditions => "parent_id IS NULL", :sortable => true

  def emancipate
    if (entry = PortfolioEntry.find(params[:id])).present?
      entry.update_attribute(:parent_id, (entry.parent.present? ? entry.parent.parent_id : nil))
    end

    redirect_to :action => "index"
  end

end
