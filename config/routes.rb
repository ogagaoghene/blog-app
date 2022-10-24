Rails.application.routes.draw do
  resources :users do 
    resources :posts
  end 
  
  
  root 'users#index'

  # get 'posts/index'
  # get 'posts/show'
  # get 'users/index'
  # get 'users/show'
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
