class MoviesController < ApplicationController
  before_action :current_movie, only: [:show, :edit, :update, :destroy]

  def index
    @cinema = Cinema.find_by(id: params[:id])
    @movies = @cinema.movies
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to @movie
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
    redirect_to root_path, status: :see_others
  end

  private
  def movie_params
    params.require(:movie).permit(:name, :description , :duration, :avatar)
  end

  def current_movie
    @movie = Movie.find(params[:id])
  end
end
