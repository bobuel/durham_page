Durhampage::Application.routes.draw do
  root "sessions#new" 

  # new users 
  get "sign_up" => "users#new", :as => "sign_up"
  
  # sessions 
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"

  # user requests options 
  get "requests/:id/toggle_submitted" => "requests#toggle_submitted", :as => "request_toggle_submitted"
  get "requests/:id/estimate_price" => "requests#estimate_price", :as => "request_estimate_price"

  # user create requests paths 
  get "users/:user_id/request_assignments/new/:request_plant_id" => "request_assignments#plant_request_assignment", :as => "plant_request_assignment"
  get "users/:user_id/requests/new/request_from_tag/:tag_id" => "requests#new_request_from_tag", :as => "new_request_from_tag"

  # user view designs paths 
  get "designs/suggested_designs/:space_id" => "designs#suggested_designs", :as => "space_suggested_designs"
  get "suggested_designs/:request_id/" => "designs#suggested_designs", :as => "request_suggested_designs"

  # designer view requests paths 
  get "requests/all_requests" => "requests#all_requests", :as => "all_requests"
  get "requests/all_submitted_requests" => "requests#all_submitted_requests", :as => "all_submitted_requests"
  get "requests/:id/toggle_viewed" => "requests#toggle_viewed", :as => "request_toggle_viewed"
  get "requests/:id/toggle_designed" => "requests#toggle_designed", :as => "request_toggle_designed"

  # designer designs paths 
  get "designs/all_designs" => "designs#all_designs", :as => "all_designs"
  get "designs/:id/gen_assignments" => "designs#gen_assignments", :as => "design_gen_assignments"
  get "designs/:id/toggle_reviewed" => "designs#toggle_reviewed", :as => "design_toggle_reviewed"
  get "designs/:id/toggle_accepted" => "designs#toggle_accepted", :as => "design_toggle_accepted"
  get "designs/:id/toggle_active" => "designs#toggle_active", :as => "design_toggle_active"
  

  resources :sessions
  resources :plants
  resources :planters 
  resources :tags
  resources :tag_assignments
  resources :designs
  
  resources :users do 
  	resources :addresses
    resources :spaces 
    resources :requests
  end

  resources :requests do 
    resources :request_assignments 
  end

  resources :designs do
    resources :design_assignments 
  end
  
end
