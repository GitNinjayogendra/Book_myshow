class City < ApplicationRecord
  has_many :cinemas
  validates :name, :state, presence: true, uniqueness: true
end
