Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/new'
  get 'likes/create'
  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show]
  end 
  root to: 'users#index'
end
