class ShowtimesController < ApplicationController

  def index
	  movie = Movie.find_by(id: params[:id])
    @showtimes = movie.showtimes
  end

  def new 
  end
end
