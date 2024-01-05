class Cinema < ApplicationRecord
	belongs_to :city
	has_many :cinema_movies
	has_many :movies , through: :cinema_movies, dependent: :destroy
  has_many :seats
  has_many :showtimes
end



