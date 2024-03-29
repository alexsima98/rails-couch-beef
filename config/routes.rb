Rails.application.routes.draw do

  get 'dashboards/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'lobbies#index'

  mount StripeEvent::Engine, at: '/stripe-webhooks'

  resources :topups, only: [:index, :show, :new, :create]

  resources :orders, only: [:show, :new, :create] do
    resources :payments, only: :new
  end

  resources :lobbies, only: [:show] do
    resources :sessions, only: [:index, :show, :new, :create, :destroy] do
      resources :messages, only: [:create, :destroy]
      resources :user_invites, only: [:create, :update]
    end
  end

  get "/dashboard" , to: "dashboards#show"  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/components", to: "pages#components"

  patch '/join', to: "sessions#joining_session"
  patch "/accept", to: "user_invites#accept"
  patch "/cancel", to: "user_invites#cancel"
  patch "/decline", to: "user_invites#decline"

  delete "/delete", to: "user_invite#destroy"

  patch '/score', to: "sessions#submit_score"

  patch '/agreed', to: "sessions#agreed"


end

