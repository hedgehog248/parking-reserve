class UsersController < ApplicationController
  def index
    @reservations = Reservation.where("end_datetime > ?", DateTime.current).where("user_id = ?", current_user.id)
  end
  
  def show
    @user = User.find(params[:id])
  end
end
