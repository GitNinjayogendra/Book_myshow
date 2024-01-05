class CinemasController < ApplicationController
  before_action :current_cinema, only: [:show, :edit, :update, :destroy]

  def index
     @cinemas = Cinema.all
  end

  def show_cinema
    @movie = Movie.find_by(id: params[:movie_id])
    @city  = City.find_by(id: params[:city_id])
    cinema = @city.cinemas
    @cinemas = cinema.joins(:cinema_movies).where(cinema_movies: {movie_id: params[:movie_id]})
    @showtimes = @cinemas.map{|i| i.showtimes}.flatten
    cinema_id = params[:cinema_id]
  end

  def show
  end

  def new
    @cinema = Cinema.new
  end

  def create
    @cinema = Cinema.new(cinema_params)
      if @cinema.save
        redirect_to cinemas_path
      else
        render :new, status: :unprocessable_entity
      end
  end

  def edit
  end

  def update
    if @cinema.update(cinema_params)
      redirect_to cinemas_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cinema.destroy
    redirect_to root_path, status: :see_other
  end

  private
  def cinema_params
    params.require(:cinema).permit(:name,:city_id)
  end

  def current_cinema
    @cinema = Cinema.find(params[:id])
  end
end