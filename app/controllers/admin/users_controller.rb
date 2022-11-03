class Admin::UsersController < ApplicationController

  def index
    @users = User.where.not(admin: true).order(:building_num, :room_num)
  end

end
