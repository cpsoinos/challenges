class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    # binding.pry
    @review = @restaurant.reviews.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review added!"
    else
      flash[:notice] = "Uhoh! Something went wrong. #{@review.errors}"
    end
    redirect_to restaurant_path(@restaurant)
  end

  protected
  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
