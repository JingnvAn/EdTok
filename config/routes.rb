Rails.application.routes.draw do
  resources :likes
  resources :comments
  resources :subjects
  resources :videos
  resources :users

  root 'static_pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/home', to: 'static_pages#home'
  get  '/signup',  to: 'users#new'
end
