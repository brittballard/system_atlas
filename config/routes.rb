SystemAtlas::Application.routes.draw do
  devise_for :users

  resource :user_session
  root :to => "dashboards#home"

  resource :account, :controller => "users"
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

  resources :organizations do
    resources :users
  end

  resources :entities do
    resources :relationships do
      collection do
        get 'manage'
      end
    end
  end

  resources :users
end
