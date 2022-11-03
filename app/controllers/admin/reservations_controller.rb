class Admin::ReservationsController < ApplicationController
  before_action :are_you_admin?

  def index
    @reservations = Reservation.order("created_at DESC")
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  private

  def are_you_admin?
    # ログイン中かつadminがtrueでなければrootへ
    redirect_to root_path if authenticate_user! && !current_user.admin
  end

end
