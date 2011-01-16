SystemAtlas::Application.routes.draw do
  resources :applications

  match "login", :to => "user_sessions#new", :as => "login"
  match "logout", :to => "user_sessions#destroy", :as => "logout"

  resource :user_session
  root :controller => "dashboards", :action => "home"
  
  resources :entities
  resource :account, :controller => "users"
  resources :users
  
  resource :registrations do
     get :step_two
     post :search_organizations, :register_organization
   end
   
  resources :dashboard do
    get :home
  end
  
  resources :database_servers
  resources :application_servers
  resources :business_units
  resources :servers
  resources :relationships

  resources :organizations do
    resources :users
  end
  
  resources :users
end
