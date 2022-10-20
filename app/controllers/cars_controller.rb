class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    car = Car.find(params[:id])
    car.destroy
    redirect_to user_path(current_user.id)
  end
  
  private

  def car_params
    params.require(:car).permit(:nickname, :model, :license_num, :drivers_name).merge(user_id: current_user.id)
  end
end
