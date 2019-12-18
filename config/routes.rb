Rails.application.routes.draw do

  get 'dashboards/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'lobbies#index'
  resources :lobbies, only: [:show] do
    resources :sessions, only: [:index, :show, :new, :create, :destroy] do
      resources :user_invites, only: [:create, :update]
    end
  end



  resources :sessions, only: [:show] do
    resources :messages, only: :create
  end

  resources :messages, only: :destroy

  get "/dashboard" , to: "dashboards#show"  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/components", to: "pages#components"

  patch '/join', to: "sessions#joining_session"
  patch "/accept", to: "user_invites#accept"
  patch "/cancel", to: "user_invites#cancel"
  patch "/decline", to: "user_invites#decline"

  delete "/delete", to: "user_invite#destroy"
end


