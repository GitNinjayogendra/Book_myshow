class ShowSeatsController < ApplicationController
  def create
    seat_array = []
    @seats = params[:seats]
      params[:seats].each do |i|
      seat = Seat.find_by(seatnumber: "#{i}").id && params[:cinema]
      binding.pry
      @seat = ShowSeat.create(seat_id: Seat.find_by(seatnumber: "#{i}").id,
      showtime_id: params[:showtime], cinema_id: params[:cinema], movie_id: params[:movie], price: params[:price], status: 'booked')
    end
    @seat_array = @seats
    @data = {movie: @seat.movie.name, cinema: @seat.cinema.name, showtime: @seat.showtime.startime.strftime('%I:%M %p'), price: @seat.price}
    if @seat.present?
      flash[:notice] = "seat are sucessfully select"
    end
    TicketWorker.perform_async(@seat_array, @data, current_user.id)
  end
end
