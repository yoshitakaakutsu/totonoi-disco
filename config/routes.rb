Rails.application.routes.draw do
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  devise_for :admin, skip: [:passwords] ,controllers: {
  registrations: "admin/registrations",
  sessions: "admin/sessions"
  }
  
  get 'homes/top',as:'routes'
  root to:"homes#top"
  
  get "/about" => "homes#about", as: "about"

  
  namespace :public do
    resources :posts, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
      resource :goods, only: [:create, :destroy]
      
      resources :comments, only: [:create, :destroy]
      
      collection do
        get 'search'
      end
      
      member do
        get 'confirm'
      end
      
    end
    
      get "/search" => "searchs#search", as: "search"
    
    resources :users, only: [:show, :edit, :update, :destroy] do
      resources :notifications, only: :index
      

      member do
        get 'good'
      end
    end
    
    resources :records, only: [:index, :create, :show, :new, :edit, :update, :destroy]
  end
  
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    
    resources :posts, only: [:index, :show, :destroy]
    
    resources :comments, only: [:destroy]
  end
end
