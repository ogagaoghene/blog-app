Rails.application.routes.draw do
  devise_for :users,
  path: '',
  path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'sessions',
    registrations: 'registrations'
  }
  devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  
    
  #Define the root path route ("/")
  root "users#index"

  #Api Definition
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # We are going to list our resources here
      resources :users,only: [:index,:show] do
        resources :posts, only: [:index, :show] do
          resources :comments, only: [:index, :create]
        end
      end 

    end 
  end


  resources :users ,only: [:index, :show, ] do
    resources :posts, only: [:index, :create, :new, :show, :destroy] do
      resources :comments, only: [:index, :create, :destroy]
      resources :likes, only: [:index, :create, :destroy]
    end
  end


end
