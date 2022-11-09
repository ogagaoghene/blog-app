Rails.application.routes.draw do
  devise_for :logins
  resources :users do
    resources :posts
  end
  resources :posts do
    resources :comments
    resources :likes
  end
  root to: 'users#index'
end
