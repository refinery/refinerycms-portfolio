ActionController::Routing::Routes.draw do |map|

	map.portfolio_project "/portfolio/:id/projects/:portfolio_id", :controller => "portfolio", :action => "show"
	map.portfolio_image "/portfolio/:id/projects/:portfolio_id/:image_id", :controller => "portfolio", :action => "show"
  map.portfolio "/portfolio/:id/", :controller => 'portfolio', :action => 'show'

  map.resources :portfolio do |portfolio|
		portfolio.resources :portfolio, :as => :portfolio
	end

  map.namespace(:admin) do |admin|
    admin.resources :portfolio_entries, :as => :portfolio, :collection => {:emancipate => :get}
  end

end