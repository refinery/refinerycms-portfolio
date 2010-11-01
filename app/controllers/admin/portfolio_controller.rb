class Admin::PortfolioController < Admin::BaseController

  crudify :portfolio_entry,
          :order => 'lft ASC',
          :conditions => {:parent_id => nil},
          :sortable => true

end
