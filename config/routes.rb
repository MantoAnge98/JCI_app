Rails.application.routes.draw do
 
  devise_for :users

  root to: "home#index"
  
  resources :users,     only: [:show, :index]
  resources :payments,  only: [:show, :index]
  resources :groups,    only: [:show, :index]
  resources :settings,  only: [:show, :index]

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
