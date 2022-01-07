require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  root 'users#index'

  resources :users, only: [:index] do
    get :download_users, on: :collection
  end
end
