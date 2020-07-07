Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # homes controller
  root  "homes#top"
  get "home/about" => "homes#about"
  #ルートまだshow edit できない表示されるルートがない
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :create, :show, :edit, :destroy, :update]

end