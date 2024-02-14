class MoviesController < ApplicationController
  before_action :current_movie, only: [:show, :edit, :update, :destroy]
  before_action :admin_access

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private
  def movie_params
    params.require(:movie).permit(:name, :description, :duration, :avatar)
  end

  def current_movie
    @movie = Movie.find(params[:id])
  end

  def admin_access
    current_user.role == "admin"
  end
end
