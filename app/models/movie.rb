class Movie < ApplicationRecord
  has_many :cinema_movies
  has_many :cinemas ,through: :cinema_movies, dependent: :destroy
  has_many :showtimes
  has_one_attached :avatar
end