Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :apartments, only: [:new, :create, :show]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :apartments do
    resources :reservations, only: [:new, :create]
  end

  resources :reservations do
    resources :reviews, only: [:new, :create]
  end

end
