class Showtime < ApplicationRecord
	belongs_to :movie
  validates :startime, presence: true, uniqueness: true
  validates :movie_id, presence: true
end