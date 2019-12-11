Rails.application.routes.draw do
  devise_for :users
  root to: 'lobbies#index'
  resources :lobbies, only: [:show] do
    resources :sessions, only: [:index, :show, :new, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/components", to: "pages#components"
end
