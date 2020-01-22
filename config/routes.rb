Rails.application.routes.draw do
  resources :tags
  resources :images
  devise_for :users
  root to: "users#index"
  resources :users do
    resources :images
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
