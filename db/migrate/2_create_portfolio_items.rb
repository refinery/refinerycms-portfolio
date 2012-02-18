class CreatePortfolioItems < ActiveRecord::Migration

  def change
    create_table :refinery_portfolio_items do |t|
      t.string :title
      t.string :caption

      t.integer :image_id, :null => false
      t.integer :gallery_id

      t.timestamps
    end
  end

end
