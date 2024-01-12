Rails.application.routes.draw do
  # get 'cinemas/index'
  # get 'movies/index'
  # get 'cities/index'

  # get 'dashboards/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "dashboards#index"
  resources :dashboards do
    get 'search_movie', on: :collection
  end
  resources :movies
  resources :cities
  resources :cinemas do
    get 'show_cinema', on: :collection
  end
  resources :showtimes
  resources :seats do
    get 'show_seat', on: :collection
  end
  devise_for :users, controllers: { sessions: 'users/sessions' ,:registrations => "users/registrations"}
  post '/show_seat', to: 'show_seats#create'
  resources :cinema_movie
end