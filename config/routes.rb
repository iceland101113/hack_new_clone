Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'
  mount Sidekiq::Web => '/sidekiq'


  root "posts#index"
  resources :posts do
    resources :comments
    member do
      post :upvote
    end
  end
end
