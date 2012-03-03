class CreatePortfolioGalleries < ActiveRecord::Migration

  def up
    create_table :refinery_portfolio_galleries do |t|
      t.string :title
      t.text :body
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth
      t.string :slug

      t.timestamps
    end
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-portfolio"})
    end


    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/portfolio/galleries"})
    end

    drop_table :refinery_portfolio_galleries
  end

end
