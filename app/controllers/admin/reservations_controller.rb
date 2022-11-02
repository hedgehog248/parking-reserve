class Admin::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.order("created_at DESC")
  end

  def show
    @reservation = Reservation.find(params[:id])
  end
end
