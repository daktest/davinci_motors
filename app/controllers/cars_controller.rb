class CarsController < ApplicationController

  def index
  end

  def new
    @car = Car.new
  end

  def create
    car = Car.new(car_params)
    message = "#{car.year} #{car.make} #{car.model} created"
    redirect_to root_path, notice: message
  end

  private
  def car_params
    params.require(:car).permit(:year, :make, :model, :price)
  end
end
