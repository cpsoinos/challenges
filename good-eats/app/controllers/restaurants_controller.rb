class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
    @reviews = Review.where(restaurant_id: params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "Restaurant added!"
    else
      flash[:notice] = "Uhoh! Something went wrong. #{@restaurant.errors}"
    end
    redirect_to restaurant_path(@restaurant)
  end

  protected
  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :address, :city, :state, :zip_code)
  end

end
