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
  
  get '/post' => "public/posts#index", as: "post_index"
  get '/post/:id' => "public/posts#show", as: "post_show"
  get '/posts/new' => "public/posts#new", as: "post_new"
  post '/posts/new' => "public/posts#create", as: "post_create"
  delete '/post/:id' => "public/posts#destroy", as: "post_destroy"
  
  post '/post/:post_id/comments' => "public/comment#create", as: "post_comment"
end
