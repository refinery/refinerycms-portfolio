class AddPositionToImagesPortfolioEntries < ActiveRecord::Migration
  def self.up
    add_column :images_portfolio_entries, :position, :integer
  end

  def self.down
    remove_column :images_portfolio_entries, :position
  end
end
