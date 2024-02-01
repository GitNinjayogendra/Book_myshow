class ShowSeat < ApplicationRecord
  belongs_to :seat
  belongs_to :showtime
  belongs_to :cinema
  belongs_to :movie
  scope :status, -> (status, showtime_id, cinema_id) { where("status=? AND showtime_id=? AND cinema_id=?",status, showtime_id, cinema_id)}
end

