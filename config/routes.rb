SystemAtlas::Application.routes.draw do
  match "login", :to => "user_sessions#new", :as => "login"
  match "logout", :to => "user_sessions#destroy", :as => "logout"

  resource :user_session
  root :controller => "dashboards", :action => "home"
  
  resources :entities
  resource :account, :controller => "users"
  resources :users
  resources :database_servers
  resources :application_servers
  resources :business_units
  resources :servers
  resources :people
  resources :teams
  resources :applications
  
  resource :registrations do
     get :step_two
     post :search_organizations, :register_organization
   end
   
  resources :dashboards do
    collection do
      get :home
    end
  end
    
  resources :relationships do
    collection do
      delete :delete_relationship
      get :manage_relationship
    end
  end

  resources :organizations do
    resources :users
  end
  
  resources :users
end
