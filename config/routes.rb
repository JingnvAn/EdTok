Rails.application.routes.draw do
  get 'static_pages/hello'
  get '/hello', to: 'static_pages#hello'
  get '/home', to: 'static_pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#hello'
end
