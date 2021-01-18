Rails.application.routes.draw do
 
  get 'promotion/index'
  devise_for :users 
  
  root to: "home#index"
  
  #Json fromat routes
  namespace :api do
    namespace :v1 do
      resources :users,       only: [:show]
      resources :payments,    only: [:index]
      resources :groups,      only: [:index]
      resources :settings,    only: [:index]
      resources :promotions,  only: [:index]
    end
   end

  resources :users,       only: [:show], to: 'users#show', as: 'user'
  resources :payments,    only: [:index]
  resources :groups,      only: [:index]
  resources :settings,    only: [:index]
  resources :promotions,  only: [:index]

  namespace :admin do
    resources :users do
      collection do
        post :confirm
      end
    end

    resources :groups do
      collection do
        post :confirm
      end
    end

    resources :promotions do
      collection do
        post :confirm
      end
    end

    resources :payments do
      collection do
        post :confirm
      end
    end

    resources :settings do
      collection do
        post :confirm
      end
    end
  end

end
