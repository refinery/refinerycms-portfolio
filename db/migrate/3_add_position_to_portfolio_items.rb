class AddPositionToPortfolioItems < ActiveRecord::Migration
  def change
    add_column :refinery_portfolio_items, :position, :integer
  end
end 
