class <%= migration_name %> < ActiveRecord::Migration

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
      t.integer  :position
      t.integer  :parent_id
      t.timestamps
    end

    add_index :portfolio_entries, :id
    add_index :portfolio_entries, :parent_id

    User.find(:all).each do |user|
      user.plugins.create(:title => "Portfolio", :position => (user.plugins.maximum(:position) || -1) +1)
    end

    page = Page.create(:title => "Portfolio", :link_url => "/portfolio", :menu_match => "\/portfolio(|\/.+?)", :deletable => false, :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1))
    RefinerySetting.find_or_set(:default_page_parts, ["Body", "Side Body"]).each do |default_page_part|
      page.parts.create(:title => default_page_part, :body => nil)
    end

    # we need to retrieve the value, merge it in and then save it back because it's a frozen hash.
    image_thumbnails = RefinerySetting.find_or_set(:image_thumbnails, {})
    RefinerySetting[:image_thumbnails] = image_thumbnails.merge({:portfolio_thumb => 'c96x96', :portfolio => '600x512'})
  end

  def self.down
    UserPlugin.destroy_all({:title => "Portfolio"})

    Page.find_all_by_link_url("/portfolio").each do |page|
      page.destroy!
    end

    image_thumbnails = RefinerySetting.find_or_set(:image_thumbnails, {}).dup
    RefinerySetting[:image_thumbnails] = image_thumbnails.delete_if {|key, value| key == :portfolio_thumb or key == :portfolio }

    drop_table :images_portfolio_entries
    drop_table :portfolio_entries
  end

end
