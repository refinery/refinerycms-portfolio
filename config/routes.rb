Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :portfolio, :path => Refinery::Portfolio.page_url do
    root :to => "galleries#index"
    resources :galleries, :only => [:index, :show]
  end

  # Admin routes
  namespace :portfolio, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      scope :path => 'portfolio' do
        resources :galleries, :except => :show do
          get :children, :on => :member
          post :update_positions, :on => :collection
          resources :items, :except => [:show] do
            post :update_positions, :on => :collection
          end
        end
        resources :items do
          post :update_positions, :on => :collection
        end
      end
    end
  end
end
