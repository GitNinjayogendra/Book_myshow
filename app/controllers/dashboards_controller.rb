class DashboardsController < ApplicationController

  def index
   @cinema = Cinema.where(city_id: params[:name])
  end

  def new
    @city = City.order(:name).pluck(:name,:id)
  end

end
