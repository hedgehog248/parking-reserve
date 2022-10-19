class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to user_path(@car.user.id)
    else
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:nickname, :model, :license_num).merge(user_id: current_user.id)
  end
end
