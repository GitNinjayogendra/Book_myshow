class ShowSeat < ApplicationRecord
  belongs_to :seat
  belongs_to :showtime
  belongs_to :cinema
  belongs_to :movie

end
