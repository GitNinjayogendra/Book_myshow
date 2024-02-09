class CinemaMovieController < ApplicationController
  before_action :admin_access

  def index
    @cinema_movies = CinemaMovie.all
  end

  def new
    @cinema_movie = CinemaMovie.new()
  end

  def create
    @cinema_movie = CinemaMovie.new(cinema_movie_params)
    if @cinema_movie.save
      redirect_to cinema_movie_index_path
    else
      render :new
    end
  end

  def edit
    @cinema_movie = CinemaMovie.find(params[:id])
  end

  def update
    if @cinema_movie.update(cinema_movie_params)
      redirect_to cinema_movie_index_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
     @cinema_movie = CinemaMovie.find(params[:id])
     if @cinema_movie.destroy
       redirect_to cinema_movie_index_path
     end
  end

  private
    def cinema_movie_params
      params.permit(:cinema_id, :movie_id)
    end

    def admin_access
      current_user.role == "admin"
    end
end
