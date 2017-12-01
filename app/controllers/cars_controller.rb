class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    car = Car.new(car_params)
    if car.save
      redirect_to root_path, notice: "#{car.year} #{car.make} #{car.model} created"
    else
      redirect_to root_path, error: 'Failed to create car.'
    end
  end

  def edit
  end

  def update
    @car.update(car_params)
    redirect_to root_path, notice: 'car updated'
  end

  private

  def car_params
    params.require(:car).permit(:year, :make, :model, :price)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
