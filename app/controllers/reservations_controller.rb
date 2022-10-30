class ReservationsController < ApplicationController
  require 'active_support/all'
  include ReservationsHelper
  before_action :set_reserv, only: [:confirm, :create]

  def index
  end

  def show
    @dtime = params[:id].in_time_zone
    @reservation = Reservation.new
    @reservations = get_all_list(@dtime)
  end

  def new
    @reservation = Reservation.new
    @reservation[:park_num] = params[:park_num]
    @reservation[:start_datetime] = params[:start_datetime]
    @reservation[:end_datetime] = @reservation[:start_datetime]
  end

  def confirm
    render :new if @reservation.invalid?
  end

  def create
    render :new if params[:back] || !@reservation.save
  end

  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    redirect_to root_path
  end

  private

  def reserv_params
    params.require(:reservation).permit(:start_datetime, :end_datetime, :park_num).merge(user_id: current_user.id)
  end

  def set_reserv
    @reservation = Reservation.new(reserv_params)
  end
end
