Rails.application.routes.draw do
  get 'sessions/new'
  resources :likes
  resources :comments
  resources :subjects
  resources :videos
  resources :users

  root 'static_pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/home', to: 'static_pages#home'
  get '/explore', to: 'static_pages#explore'
  get '/about', to: 'static_pages#about'
  get '/behind_the_scene', to: 'static_pages#behind_the_scene'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/profile', to: 'users#show'
  
  post '/follow', to: 'users#follow'
end
