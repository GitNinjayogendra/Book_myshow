class Cinema < ApplicationRecord
	belongs_to :city
	has_many :cinema_movies
	has_many :movies, through: :cinema_movies, dependent: :destroy
  has_many :seats
  validates :name, :city_id, presence: true, uniqueness: true
end



