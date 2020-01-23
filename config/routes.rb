Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get '/taco' => "taco#show"
  resources :tags
  resources :images
  root to: 'static#home'
  resources :users do
    resources :images
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
