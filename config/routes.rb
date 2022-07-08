Rails.application.routes.draw do
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
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
    end
    
    resources :users, only: [:show, :edit, :update]
    
    resources :records, only: [:index, :create, :show, :new, :edit]
end
end
