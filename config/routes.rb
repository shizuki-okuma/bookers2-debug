Rails.application.routes.draw do
  devise_for :users
  get "home/about"=>"homes#about"
  root to: "homes#top"
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update,:new] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
end
  resources :users, only: [:index,:show,:edit,:update]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end