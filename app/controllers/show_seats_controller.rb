class ShowSeatsController < ApplicationController

  def create
    binding.pry
    @show_seats = ShowSeat.new(show_seat)
      if @show_seats.save
      end
  end
 private
  def show_seat
    params.permit(:showtime,:seats,:movie, :cinema)
  end

end
