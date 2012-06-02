Rails.application.routes.draw do
  resources :libraries do
    resources :shelves
  end
  resources :shelves do
    resources :picture_files
  end

  resources :bookstores
  resources :library_groups, :except => [:new, :create, :destroy]
  resources :subscriptions
  resources :subscribes
  resources :search_engines
  resources :request_status_types
  resources :request_types
  resources :budget_types
end
