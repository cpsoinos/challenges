class CarsController < ApplicationController

  def index
    @cars = Car.order("year DESC").page(params[:page])
  end

  def new
    @car = Car.new
    @manufacturers = Manufacturer.all
  end

  def create
    @manufacturers = Manufacturer.all
    @manufacturer = Manufacturer.find(params[:car][:manufacturer_id])
    @car = Car.new(car_params)
    if @car.save
      flash[:notice] = "Car added!"
      redirect_to cars_path
    else
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:model, :color, :year, :mileage, :description, :manufacturer_id)
  end

end
