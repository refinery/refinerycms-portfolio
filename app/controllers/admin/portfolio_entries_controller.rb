class Admin::PortfolioEntriesController < Admin::BaseController
 
  crudify :portfolio_entry, :order => 'position ASC', :conditions => "parent_id IS NULL"

end