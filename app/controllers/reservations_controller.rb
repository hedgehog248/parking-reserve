class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reserv_params)
    if @reservation.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def reserv_params
    params.require(:reservation).permit(:start_datetime, :end_datetime, :park_num).merge(user_id: current_user.id)
  end
end
