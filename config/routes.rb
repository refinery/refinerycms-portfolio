require File.expand_path("../../lib/portfolio.rb", __FILE__)

Refinery::Application.routes.draw do
  match '/portfolio', :as => 'portfolio', :to => 'portfolio#index'

  # Make sure you restart your web server after changing the multi level setting.
  if ::Refinery::Portfolio.multi_level?
    match "/portfolio/:id/projects/:portfolio_id/:image_id",
          :as => :portfolio_image,
          :to => "portfolio#show"

    match "/portfolio/:id/projects/:portfolio_id",
          :as => :portfolio_project,
          :to => "portfolio#show"
  else
    match "/portfolio/:id/:image_id",
          :as => :portfolio_image,
          :to => "portfolio#show"

    match "/portfolio/:id",
          :as => :portfolio_project,
          :to => "portfolio#show"
  end

  match '/portfolio/:id', :as => 'portfolio', :to => 'portfolio#show'

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :portfolio, :as => :portfolio_entries do
      collection do
        post :update_positions
      end
    end
  end

end
