Rails.application.routes.draw do
  root  'home#index',               as: 'root'
  get   '/auth/google',             as: 'login'
  get   'auth/:provider/callback',  to: 'sessions#create'
  get   'logout',                   to: 'sessions#destroy'

  resources :photos, only: [:new, :index, :create]

  namespace :api do
    namespace :v1 do
      resources :photos, only: [:index]
      get 'photos/first-photo-of-the-month', to: 'months#index'
    end
  end
end
