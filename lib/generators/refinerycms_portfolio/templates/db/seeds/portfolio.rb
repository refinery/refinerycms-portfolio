User.find(:all).each do |user|
  user.plugins.create({
    :name => "portfolio",
    :position => (user.plugins.maximum(:position) || -1) +1
  })
end

page = Page.create({
  :title => "Portfolio",
  :link_url => "/portfolio",
  :menu_match => "\/portfolio(|\/.+?)",
  :deletable => false,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1)
})
Page.default_parts.each do |default_page_part|
  page.parts.create(:title => default_page_part, :body => nil)
end

# we need to retrieve the value, merge it in and then save it back because it's a frozen hash.
image_thumbnails = RefinerySetting.find_or_set(:image_thumbnails, {}).dup
new_thumbnails = image_thumbnails.merge({
  :portfolio_thumb => '96x96#c',
  :portfolio => '600x512'
})
# handles a change in Refinery API
if RefinerySetting.methods.map(&:to_sym).include?(:set)
  RefinerySetting.set(:image_thumbnails, new_thumbnails)
else
  RefinerySetting[:image_thumbnails] = new_thumbnails
end
