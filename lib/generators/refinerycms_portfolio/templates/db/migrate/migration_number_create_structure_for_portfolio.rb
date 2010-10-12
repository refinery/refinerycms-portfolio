class CreateStructureForPortfolio < ActiveRecord::Migration

  def self.up
    create_table :images_portfolio_entries, :id => false, :force => true do |t|
      t.integer :image_id
      t.integer :portfolio_entry_id
      t.integer :position
    end

    # people should be allowed to have the same image twice, if they really want to.
    add_index :images_portfolio_entries, [:image_id, :portfolio_entry_id], :name => 'composite_key_index', :unique => false

    create_table :portfolio_entries, :force => true do |t|
      t.string   :title
      t.text     :body
      t.integer  :parent_id
      t.integer  :lft
      t.integer  :rgt
      t.integer  :depth
      t.integer  :title_image_id
      t.timestamps
    end

    add_index :portfolio_entries, :id
    add_index :portfolio_entries, :parent_id
    add_index :portfolio_entries, :lft
    add_index :portfolio_entries, :rgt

    load(Rails.root.join('db', 'seeds', 'portfolio.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "portfolio"})

    Page.find_all_by_link_url("/portfolio").each do |page|
      page.destroy!
    end

    drop_table :images_portfolio_entries
    drop_table :portfolio_entries
  end

end
