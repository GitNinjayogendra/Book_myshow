Rails.application.routes.draw do
  # get 'cinemas/index'
  # get 'movies/index'
  # get 'cities/index'

  # get 'dashboards/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "dashboards#index"
  resources :dashboards
  resources :movies
  resources :cinemas
  resources :cities
  resources :showtimes
  resources :seats
  devise_for :users, controllers: { sessions: 'users/sessions' }
end