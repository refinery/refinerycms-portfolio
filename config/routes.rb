require File.expand_path("../../lib/portfolio.rb", __FILE__)

ActionController::Routing::Routes.draw do |map|

  # Make sure you restart your web server after changing the multi level setting.
  if ::Refinery::Portfolio.multi_level?
    map.portfolio_project "/portfolio/:id/projects/:portfolio_id", :controller => "portfolio", :action => "show"
    map.portfolio_image "/portfolio/:id/projects/:portfolio_id/:image_id", :controller => "portfolio", :action => "show"
  else
    map.portfolio_project "/portfolio/:id", :controller => "portfolio", :action => "show"
    map.portfolio_image "/portfolio/:id/:image_id", :controller => "portfolio", :action => "show"
  end

  map.portfolio "/portfolio/:id/", :controller => 'portfolio', :action => 'show'

  map.resources :portfolio do |portfolio|
    portfolio.resources :portfolio, :as => :portfolio
  end

  map.namespace(:admin, :path_prefix => (defined?(REFINERY_GEM_VERSION) ? 'admin' : 'refinery')) do |admin|
    admin.resources :portfolio_entries, :as => :portfolio, :member => {:emancipate => :get}, :collection => {:update_positions => :post}
  end

end
