class CinemasController < ApplicationController
  before_action :current_cinema, only: [:show, :edit, :update, :destroy]

  def index
      @cinema = Cinema.all
  end

  def show
  end

  def new
    @cinema = Cinema.new
  end

  def create
    @cinema = Cinema.new(cinema_params)
      if @cinema.save
        redirect_to @cinema
      else
        render :new, status: :unprocessable_entity
      end
  end

  def edit
  end

  def update
    if @cinema.update(cinema_params)
      redirect_to @cinema
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cinema.destroy
    redirect_to root_path, status: :see_other
  end

  private
  def city_params
    params.require(:cinema).permit(:name)
  end

  def current_cinema
    @cinema = Cinema.find(params[:id])
  end
end
