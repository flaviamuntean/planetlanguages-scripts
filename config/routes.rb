Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root to: "macros#index", as: :authenticated_root
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :macros do
    resources :comments, except: [:index, :show]
  end

  get '/favorite/:id', to: "macros#favorite", as: :favorite
  get '/unfavorite/:id', to: "macros#unfavorite", as: :unfavorite

  resources :users, only: [:show]

  resources :comments, only: [:index, :show]
  get '/help', to: "pages#help", as: :help

  get 'download_xlsb', to: "pages#download_xlsb"
  get 'download_dotm', to: "pages#download_dotm"
  get 'download_ppam', to: "pages#download_ppam"
end
