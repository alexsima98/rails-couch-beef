Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'lobbies#index'
  resources :lobbies, only: [:show] do
    resources :sessions, only: [:index, :show, :new, :create] do
      resources :user_invites, only: [:create, :update]
    end
  end

  resources :sessions, only: [] do
    resources :messages, only: :create
  end

  resources :messages, only: :destroy


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/components", to: "pages#components"
end
