class ShowtimesController < ApplicationController
  before_action :current_show, only: [:show, :edit, :update, :destroy]
  before_action :admin_access

  def index
    @showtimes = Showtime.all
  end

  def new
    @showtime = Showtime.new
  end

  def create
    @showtime = Showtime.create(show_params)
    if @showtime.save
      redirect_to showtimes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @showtime.update(show_params)
      redirect_to showtimes_path
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
    params.require(:showtime).permit(:startime, :movie_id)
  end

  def current_show
    @showtime = Showtime.find(params[:id])
  end

  def admin_access
    current_user.role == "admin"
  end
end
