class ShowtimesController < ApplicationController
  before_action :current_show, only: [:show, :edit, :update, :destroy]

  def index
    #@movie = Movie.find_by_id(params[:movie_id])
    #@cinema_id = Cinema.find(params[:cinema_id])
    #@showtimes = @movie.showtimes
  end

  def show
  end

  def new
    @showtime = Showtime.new
  end

  def create
    @showtime = Showtime.create(show_params)

    if @showtime.save
      redirect_to @showtime
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @showtime.update(show_params)
      redirect_to @showtime
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
    redirect_to root_path, status: :see_others
  end

  private
  def show_params
    params.require(:showtime).permit(:startime)
  end

  def current_show
    @showtime = Showtime.find(params[:id])
  end
end
