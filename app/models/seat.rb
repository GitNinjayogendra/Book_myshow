class Seat < ApplicationRecord
  belongs_to :cinema
  validates :seatnumber, presence: true, uniqueness: true
  validates :cinema_id, presence: true
end