class Admin::UsersController < ApplicationController

  def index
    @users = User.where.not(admin: true).order(:building_num, :room_num)
  end

  def destroy
    binding.pry
    user = User.find(params[:id])
    if user.destroy
      redirect_to admin_user_path
    else
      render :index
    end
  end
end
