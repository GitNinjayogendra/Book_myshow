class DashboardsController < ApplicationController

  def index
    if user_signed_in?
      @cinema = Cinema.where(city_id:params[:id]).order(:name).pluck(:name,:id)
    else
      redirect_to new_user_session_path
    end
  end

  def new
     @city = City.order(:name).pluck(:name,:id)
     #@city = City.find_by(id: params[:id])
  end
end