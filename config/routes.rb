QcmTracker::Application.routes.draw do
 
 resources :clients
 root "static_pages#home"
end
