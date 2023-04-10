Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'create/destroy'
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
  get 'search' => 'searches#search_result', as: 'search'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  devise_for :users
  get "home/about"=>"homes#about"
  root to: "homes#top"
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update,:new] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:index,:show,:edit,:update] do
    member do
      get :followings, :followers
    end
    resource :relationships, only: [:create, :destroy, :followings,:followers]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end