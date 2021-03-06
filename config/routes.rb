Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1, defaults: { format: :json } do
    # API Resources here
    resources :countries do
      resources :cities
    end
    
    resources :password_resets, only: [:create] do
      collection do
        get :token, action: :edit, as: :edit
        patch :token, action: :update
      end
    end

    resources :levels
    resources :subjects
    resources :notifications, only: %i[create show index destroy]
    resources :users, only: %i[show update index] do
      get :avatar, on: :member
    end
    get 'genders', to: 'constants#gender_list'
    get 'roles_list', to: 'constants#roles_list'
    
    post 'signup', to: 'users#create'
  end
  post 'auth/login', to: 'authentication#authenticate'
end
