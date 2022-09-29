Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts do
      resources :comments, only: [:create, :delete]
      resources :likes, only: [:create, :delete]
    end
  end
  
  root 'users#index'
end
