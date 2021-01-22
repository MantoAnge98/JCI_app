Rails.application.routes.draw do
 
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  #Devise user
  devise_for :users

  #Routes acces
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

  #All ressources pages
  resources :users,       only: [:show]
  resources :payments,    only: [:index]
  resources :groups,      only: [:index]
  resources :settings,    only: [:index]
  resources :promotions,  only: [:index]

  #All ressources admin pages
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
