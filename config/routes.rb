ActionController::Routing::Routes.draw do |map|
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"

  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"
  
  map.resource :account, :controller => "users"
  map.resources :users
  
  map.resource :registrations, :member => { :step_one => :get, :step_two => :post, :search_organizations => :post, :register_organization => :post }
end
