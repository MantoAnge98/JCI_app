Rails.application.routes.draw do
 
  get 'promotion/index'
  devise_for :users 
  
  root to: "home#index"
  
  resources :users,     only: [:show]
  resources :payments,  only: [:index]
  resources :groups,    only: [:index]
  resources :settings,  only: [:index]

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
