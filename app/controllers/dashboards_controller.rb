class DashboardsController < ApplicationController
  def index
    @city = City.find_by_name(params[:city] || "indore" )
    if @city.present?
      @cinemas = @city.cinemas
      @movies = @cinemas.map { |cinema| cinema.movies }.flatten
    end
  end

  def search_movie
    @movies = Movie.where('name Like?' , "%#{params[:movie]}%")
    @city = City.find_by_id(params[:city])
    unless @movies.present?
      redirect_to :search_movie_dashboards_path, notice: "colud not found here"
    end
  end
end

