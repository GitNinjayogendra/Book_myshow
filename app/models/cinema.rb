class Cinema < ApplicationRecord
	belongs_to :city
	has_many :cinema_movies
	has_many :movies, through: :cinema_movies, dependent: :destroy
  has_many :seats
  validates :name, presence: true, uniqueness:{case_sensitive: false }
  validates :city_id, presence: true

  before_save :cinema_name

  def cinema_name
    self.name = name.capitalize
  end
end



