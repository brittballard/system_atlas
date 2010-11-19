SystemAtlas::Application.routes.draw do |map|
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"

  map.resource :user_session
  map.root :controller => "dashboards", :action => "home"
  
  map.resources :entities
  map.resource :account, :controller => "users"
  map.resources :users
  # map.resource :registrations, :member => { :step_one => :get, :step_two => :post, :search_organizations => :post, :register_organization => :post }
  map.resource :registrations, :member => { :step_two => :get }
  map.resources :dashboard, :member => { :home => :get }, :only => [:get]
  map.resources :database_servers
  map.resources :application_servers
  map.resources :business_units
  map.resources :servers
  map.resources :relationships

  map.resources :organizations do |organization|
    organization.resources :users
  end
end
