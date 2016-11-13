Rails.application.routes.draw do
  resources :user_groups
  resources :withdraws, except: [:edit, :update]
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
