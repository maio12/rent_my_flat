Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :apartments, only: [:show, :index] do
    resources :reviews, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
