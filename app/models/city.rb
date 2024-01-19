class City < ApplicationRecord
  has_many :cinemas
  validates :name, :state ,presence: true
  validates :name, :state, uniqueness: true
end
