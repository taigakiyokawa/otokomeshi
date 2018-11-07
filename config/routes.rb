Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  resources :posts

  post   '/like/:post_id' => 'likes#like',   as: 'like'
  delete '/like/:post_id' => 'likes#unlike', as: 'unlike'

  devise_for :users
  resources :users, :only => [:index, :show]
  get "/" => "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end