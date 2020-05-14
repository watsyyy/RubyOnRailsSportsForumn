Soblog::Application.routes.draw do
  root :to => "discussions#index"
  resources :discussions do
    resources :comments
  end
  resources :users
  resource :session
  get '/login' => "sessions#new", :as => "login"
  get '/logout' => "sessions#destroy", :as => "logout"
end
