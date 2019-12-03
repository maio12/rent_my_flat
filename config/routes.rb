Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :apartments, only: [:new, :create, :show] do
    resources :reservations, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
