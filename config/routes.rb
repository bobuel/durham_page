Durhampage::Application.routes.draw do
  root "sessions#new" 

  # new users 
  get "sign_up" => "users#new", :as => "sign_up"
  
  # sessions are logins 
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"

  # user request options 
  get "users/:user_id/requests/:id/toggle_submitted" => "requests#toggle_submitted", :as => "request_toggle_submitted"
  get "users/:user_id/requests/:id/estimate_price" => "requests#estimate_price", :as => "request_estimate_price"

  # user request paths 
  get "users/:user_id/request/:request_id/suggested_designs" => "designs#request_suggested_designs", :as => "request_suggested_designs"
  get "users/:user_id/request_assignments/new/:plant_id" => "request_assignments#plant_request_assignment", :as => "plant_request_assignment"
  get "users/:user_id/requests/new/request_from_tag/:tag_id" => "requests#new_request_from_tag", :as => "new_request_from_tag"

  # user design paths 
  get "designs/suggested_designs/:space_id" => "designs#space_suggested_designs", :as => "space_suggested_designs"

  # designer request paths 
  get "requests/all_requests" => "requests#all_requests", :as => "all_requests"
  get "requests/all_submitted_requests" => "requests#all_submitted_requests", :as => "all_submitted_requests"
  get "requests/:id/toggle_viewed" => "requests#toggle_viewed", :as => "request_toggle_viewed"
  get "requests/:id/toggle_designed" => "requests#toggle_designed", :as => "request_toggle_designed"

  # designer design paths 
  get "designs/all_designs" => "designs#all_designs", :as => "all_designs"
  get "designs/:id/toggle_reviewed" => "designs#toggle_reviewed", :as => "design_toggle_reviewed"
  get "designs/:id/toggle_accepted" => "designs#toggle_accepted", :as => "design_toggle_accepted"
  get "designs/:id/toggle_active" => "designs#toggle_active", :as => "design_toggle_active"
  

  resources :sessions
  resources :plants
  resources :planters 
  resources :tags
  resources :tag_assignments
  
  resources :users do 
  	resources :addresses
    resources :spaces 
    resources :requests
    resources :designs
  end

  resources :requests do 
    resources :request_assignments 
  end

  resources :designs do
    resources :design_assignments 
  end
  
end
