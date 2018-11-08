Rails.application.routes.draw do
  get 'shogo_first/create'
  get 'shogo_first/update'
  get 'shogos/update'
  get 'shogos/create'
  get 'shogos/get_likes_total'
  resources :posts

  post   '/like/:post_id' => 'likes#like',   as: 'like'
  delete '/like/:post_id' => 'likes#unlike', as: 'unlike'

  devise_for :users
  get 'users' => "users#index"
  get 'users/:id' => "users#show"
  get "/" => "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end