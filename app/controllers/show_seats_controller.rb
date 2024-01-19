class ShowSeatsController < ApplicationController
  include Devise::Controllers::Helpers

  def create
    @seats = params[:seats];
    params[:seats].each do |i|
      @seat = ShowSeat.create(seat_id: i, showtime_id: params[:showtime], cinema_id: params[:cinema], movie_id: params[:movie], price: params[:price])
      if @seat.present?
        flash[:notice] = "seat are sucessfully select"
      end
    end
  end
end
