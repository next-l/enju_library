Rails.application.routes.draw do
  resources :withdraws
  resources :libraries
  resources :shelves

  resources :baskets
  resources :accepts, :except => [:edit, :update]

  resources :bookstores
  resources :library_groups, :except => [:new, :create, :destroy]
  resources :subscriptions
  resources :subscribes
  resources :search_engines
  resources :request_status_types
  resources :request_types
  resources :budget_types
end
