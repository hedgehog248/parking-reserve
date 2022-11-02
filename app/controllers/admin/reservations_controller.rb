class Admin::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.order("created_at DESC")
  end
end
