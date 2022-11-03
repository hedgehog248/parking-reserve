class Admin::UsersController < ApplicationController

  def index
    @users = User.order(:building_num, :room_num)
  end

end
