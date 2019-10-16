# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1, defaults: { format: :json } do
    # API Resources here
    resources :countries do
      resources :cities
    end

    resources :levels
    resources :subjects
    resources :users, only: %i[show index] do
      get :avatar, on: :member
    end

    post 'signup', to: 'users#create'
  end
  post 'auth/login', to: 'authentication#authenticate'
end
