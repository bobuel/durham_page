Durhampage::Application.routes.draw do
  root "sessions#new" 

  # users 
  get "sign_up" => "users#new", :as => "sign_up"
  
  # sessions 
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"

  resources :sessions
  resources :plants
  resources :planters 
  resources :tags 
  resources :tag_assignments
  
  resources :users do 
  	resources :addresses
    resources :spaces 
  end
end
