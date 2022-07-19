Rails.application.routes.draw do
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  devise_for :admin, skip: [:passwords] ,controllers: {
  registrations: "admin/registrations",
  sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get 'homes/top',as:'routes'
  root to:"homes#top"
  
  get "/about" => "homes#about", as: "about"
  
  namespace :public do
    resources :posts, only: [:new, :create, :index, :show, :destroy] do
      resource :goods, only: [:create, :destroy]
      
      resources :comments, only: [:create, :destroy]
      
      collection do
        get 'confirm'
      end
      
      patch :toggle_status 
    end
    
    resources :users, only: [:show, :edit, :update] do
      resources :notifications, only: :index
      
      collection do
        patch 'withdraw'
      end
      member do
        get 'good'
      end
    end
    
    resources :records, only: [:index, :create, :show, :new, :edit, :update, :destroy]
  end
  
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    
    resources :posts, only: [:index, :show, :destroy]
    
    resources :comments, only: [:destroy]
  end
end
