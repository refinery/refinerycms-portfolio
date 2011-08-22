User.find(:all).each do |user|
  user.plugins.create({
    :name => "portfolio",
    :position => (user.plugins.maximum(:position) || -1) +1
  }) unless user.plugins.find_by_name('portfolio').present?
end

unless Page.find_by_link_url('/portfolio').present?
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
end