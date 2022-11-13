Rails.application.routes.draw do
  devise_for :logins

  devise_scope  :login do
    get 'logins/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'users#index'
  resources :users do
    resources :posts
  end
  resources :posts do
    resources :comments
    resources :likes
  end
end
