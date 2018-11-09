Rails.application.routes.draw do
  resources :posts do
    resources :likes, only: [:create,:destroy]
  end
  devise_for :users
  get "/" => "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end