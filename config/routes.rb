Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'users/new'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # homes controller
  root  "homes#top"
  get "homes/about" => "homes#about"
  resources :users, only: [:index]
end