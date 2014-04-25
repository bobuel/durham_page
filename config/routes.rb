Durhampage::Application.routes.draw do
  root "sessions#new" 

  # users 
  get "sign_up" => "users#new", :as => "sign_up"
  
  # sessions 
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"

  get "users/:user_id/requests/:id/toggle_submit" => "requests#toggle_submit", :as => "request_toggle_submit"
  get "users/:user_id/requests/:id/estimate_price" => "requests#estimate_price", :as => "request_estimate_price"

  resources :sessions
  resources :plants
  resources :planters 
  resources :tags
  resources :tag_assignments
  
  resources :users do 
  	resources :addresses
    resources :spaces 
    resources :requests
  end

  resources :requests do 
    resources :request_assignments 
  end

  
end
