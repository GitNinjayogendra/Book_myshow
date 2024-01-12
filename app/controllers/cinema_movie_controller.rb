class CinemaMovieController < ApplicationController

  def index
    @cinema_movies = CinemaMovie.all
  end

  def new
  end

  def create
    binding.pry
    @cinema_movie = CinemaMovie.new(cinema_movie_params)
    if @cinema_movie.save
      redirect_to :cinema_movie_index_path
    else
      render :new
    end
  end

  # def show
  #   #@cinema_movie = CinemaMovie.find(params[:cinema_id, :movie_id])
  # end

  def edit
    @cinema_movie = CinemaMovie.find(params[:cinema_id, :movie_id])
  end

  def update
    if @cinema_movie.update(cinema_movie_params)
      redirect_to :cinema_movie_index_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
     @cinema_movie = CinemaMovie.find(params[:cinema_id, :movie_id])
     if @cinema_movie.destroy
       redirect_to "root_path"
     end
  end

  private
    def cinema_movie_params
      params.require(:CinemaMovie).permit(:cinema_id, :movie_id)
    end
end
