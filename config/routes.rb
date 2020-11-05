Rails.application.routes.draw do
  root 'homes#top'

  get 'home/about' => 'homes#about'
  get 'homes/search'=>'homes#search'
  post 'homes/search'=>'homes#search'

  # post '/posts/:post_id/favorites' => "favorites#create"
  # delete '/posts/:post_id/favorites' => "favorites#destroy"
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :relationships, only: [:create, :destroy]
  resources :posts do
    resource :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users do
    member do
      get 'my'
      get :following, :followers
    end
  end

end
