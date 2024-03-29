class CitiesController < ApplicationController
  before_action :current_city, only: [:show, :edit, :update, :destroy]
  before_action :admin_access

  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to cities_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @city.update(city_params)
      redirect_to  cities_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @city.destroy
    redirect_to cities_path, status: :see_other
  end

  private
  def city_params
    params.require(:city).permit(:name, :state)
  end

  def current_city
    @city = City.find(params[:id])
  end

  def admin_access
    if current_user.role != "admin"
      flash[:notice] = "colud not found"
      render partial: "shared/flash"
    end
  end
end
