class RemoveCoverImageIdFromGalleries < ActiveRecord::Migration

  def up
    remove_column :refinery_portfolio_galleries, :cover_image_id
  end

  def down
    add_column :refinery_portfolio_galleries, :cover_image_id, :integer
  end

end
