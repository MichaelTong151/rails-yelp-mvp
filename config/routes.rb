Rails.application.routes.draw do
  resources :restaurant
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'restaurants', to: 'restaurants#index'
  get 'resturants_show', to: 'restaurants#show'
  get 'restaurants_new', to: 'restaurants#new'
  get 'restaurant_reviews', to: 'restaurant_reviews#index'
  post 'restaurant_create', to: 'restaurant#create'
  resources :restaurant do
    resources :reviews, only: [ :new, :create ]
  end


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
