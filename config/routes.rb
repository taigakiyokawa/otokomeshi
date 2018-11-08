Rails.application.routes.draw do
  get 'shogo_first/create'
  get 'shogo_first/update'
  get 'shogos/update'
  get 'shogos/create'
  resources :posts

  post   '/like/:post_id' => 'likes#like',   as: 'like'
  delete '/like/:post_id' => 'likes#unlike', as: 'unlike'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
   }

  get "/" => "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "/files", to: "files#create"
end
