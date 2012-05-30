Rails.application.routes.draw do
  resources :libraries do
    resources :shelves
  end
  resources :shelves
  resources :bookstores
  resources :library_groups
  resources :subscriptions
  resources :subscribes
end
