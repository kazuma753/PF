Rails.application.routes.draw do
  root 'homes#top'

  get 'home/about' => 'homes#about'

  # post '/posts/:post_id/favorites' => "favorites#create"
  # delete '/posts/:post_id/favorites' => "favorites#destroy"
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users do
    member do
      get 'my'
    end
  end
end
