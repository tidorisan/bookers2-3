Rails.application.routes.draw do
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'users/new'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # homes controller
  root  "homes#top"
  get "homes/about" => "homes#about"
  #ルートまだshow edit できない表示されるルートがない
  resources :users, only: [:index]
  resources :books, only: [:index]
end