Rails.application.routes.draw do
  get 'shogo_first/create'
  get 'shogo_first/update'
  get 'shogos/update'
  get 'shogos/create'

  get 'posts/news' => 'posts#news'
  get 'posts/rank' => 'posts#rank'
  get 'posts/appare' => 'posts#appare'
  get 'posts/search' => 'posts#search'
  resources :posts

  post   '/like/:post_id' => 'likes#like',   as: 'like'
  delete '/like/:post_id' => 'likes#unlike', as: 'unlike'


  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }

  devise_scope :user do
    get "/" => redirect("users/sign_up")
  end

  get 'users/index' => 'users#index'
  get 'users/:id' => 'users#show'
  get "/top" => "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
