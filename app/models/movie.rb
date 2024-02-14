class Movie < ApplicationRecord
  has_many :cinema_movies
  has_many :cinemas, through: :cinema_movies, dependent: :destroy
  has_many :showtimes
  has_one_attached :avatar
  validates :name, presence: true, uniqueness: {case_sensitive: false }
  validates :description, :duration, presence: true

  before_save :movie_name

  def movie_name
    self.name = name.capitalize
  end
end