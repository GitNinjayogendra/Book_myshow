class SeatsController < ApplicationController
  before_action :current_seat, only: [:show, :edit, :update, :destroy]
  before_action :admin_access, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @seats = Seat.all
  end

  def show_seat
    @showtime = params[:showtime_id]
    @cinema = Cinema.find_by(id: params[:cinema_id])
    @seats = @cinema.seats
    @booked_value = ShowSeat.status("booked", params[:showtime_id], params[:cinema_id]).pluck(:seat_id)
  end

  def new
    @seat = Seat.new
  end

  def create
    @seat = Seat.new(seat_params)
    if @seat.save
      redirect_to seats_path
    else
      render :new , status: :unprocessable_entity
    end
  end

  def update
    if @seat.update(seat_params)
      redirect_to seats_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @seat.destroy
    redirect_to root_path , status: :see_others
  end

  private
  def seat_params
    params.require(:seat).permit(:seatnumber, :cinema_id)
  end

  def current_seat
    @seat = Seat.find_by(params[:id])
  end

  def admin_access
    if current_user.role != "admin"
      flash[:notice] = "colud not found"
      render partial: "shared/flash"
    end
  end
end







