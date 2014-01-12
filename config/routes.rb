QcmTracker::Application.routes.draw do
 resources :clients
 resources :sessions, only: [:new, :create, :destroy]
 root "static_pages#home"
 match '/signin',  to: 'sessions#new',         via: 'get'
 match '/signout', to: 'sessions#destroy',     via: 'delete'
end
