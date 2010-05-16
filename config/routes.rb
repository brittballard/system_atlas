ActionController::Routing::Routes.draw do |map|
  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"
  
  map.resource :account, :controller => "users"
  map.resources :users
  
  map.resource :registrations

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
