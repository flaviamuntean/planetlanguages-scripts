Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root to: "macros#index"
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :macros do
    resources :comments
  end

  get '/favorite/:id', to: "macros#favorite", as: :favorite
  get '/unfavorite/:id', to: "macros#unfavorite", as: :unfavorite

  resources :users, only: [:show]
end
