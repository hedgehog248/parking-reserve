class Admin::UsersController < ApplicationController
  def index
    @reservations = Reservation.order("created_at DESC")
  end
end
