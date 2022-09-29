class ReservationsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_reserv, only: [:confirm, :create]

  def index
  end

  def show
  end

  def new
    redirect_to root_path if valid_reserv.length >= 3
    @reservation = Reservation.new
  end

  def confirm
    if @reservation.invalid?
      render :new
    end
  end

  def create
    if params[:back] || !@reservation.save
      render :new
    end
  end

  private

  def reserv_params
    params.require(:reservation).permit(:start_datetime, :end_datetime, :park_num).merge(user_id: current_user.id)
  end

  def set_reserv
    @reservation = Reservation.new(reserv_params)
  end

  def valid_reserv
    valid_reserv = Reservation.where("end_datetime > ?", DateTime.current).where("user_id = ?", current_user.id)
  end
end
