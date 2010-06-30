class Admin::PortfolioEntriesController < Admin::BaseController

  crudify :portfolio_entry, :order => 'position ASC', :conditions => "parent_id IS NULL"
  before_filter :find_portfolio_entries_for_parents_list, :only => [:new, :create, :edit, :update]

  def emancipate
    if (entry = PortfolioEntry.find(params[:id])).present?
      entry.update_attribute(:parent_id, (entry.parent.present? ? entry.parent.parent_id : nil))
    end

    redirect_to :action => "index"
  end

protected

  # This finds all of the entries that could possibly be assigned as the current entry's parent.
  def find_portfolio_entries_for_parents_list
    if ::Refinery::Portfolio.multi_level?
      @portfolio_entries_for_parents_list = PortfolioEntry.find(:all, :order => "parent_id, position ASC")

      # We need to remove all references to the current entry or any of its decendants or we get a nightmare.
      unless @portfolio_entry.nil? or @portfolio_entry.new_record?
        @portfolio_entries_for_parents_list.reject! do |entry|
          entry.id == @portfolio_entry.id or @portfolio_entry.descendants.include?(entry)
        end
      end
    else
      @portfolio_entries_for_parents_list = []
    end
  end

end
