ActionController::Routing::Routes.draw do |map|

  map.resources :portfolio do |portfolio|
    portfolio.resources :portfolio, :as => :portfolio
  end

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :portfolio_entries, :as => :portfolio, :collection => {:emancipate => :get}
  end

  if RefinerySetting.table_exists? and RefinerySetting.find_or_set(:multi_level_portfolio, true)
    map.portfolio_project "/portfolio/:id/projects/:portfolio_id", :controller => "portfolio", :action => "show"
    map.portfolio_image "/portfolio/:id/projects/:portfolio_id/:image_id", :controller => "portfolio", :action => "show"
  else
    map.portfolio_project "/portfolio/:id", :controller => "portfolio", :action => "show"
    map.portfolio_image "/portfolio/:id/:image_id", :controller => "portfolio", :action => "show"
  end

  map.portfolio "/portfolio/:id/", :controller => 'portfolio', :action => 'show'

end
