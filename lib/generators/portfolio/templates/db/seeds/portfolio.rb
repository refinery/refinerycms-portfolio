User.find(:all).each do |user|
  user.plugins.create(:name => "Portfolio", :position => (user.plugins.maximum(:position) || -1) +1)
end

page = Page.create(:title => "Portfolio", :link_url => "/portfolio", :menu_match => "\/portfolio(|\/.+?)", :deletable => false, :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1))
RefinerySetting.find_or_set(:default_page_parts, ["Body", "Side Body"]).each do |default_page_part|
  page.parts.create(:title => default_page_part, :body => nil)
end

# we need to retrieve the value, merge it in and then save it back because it's a frozen hash.
image_thumbnails = RefinerySetting.find_or_set(:image_thumbnails, {}).dup
RefinerySetting[:image_thumbnails] = image_thumbnails.merge({:portfolio_thumb => 'c96x96', :portfolio => '600x512'})