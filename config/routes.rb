Rails.application.routes.draw do
  resources :libraries do
    resources :shelves
  end
  resources :shelves
end
