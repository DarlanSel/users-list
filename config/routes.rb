Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: [:index] do
    get :download_users, on: :collection
  end
end
