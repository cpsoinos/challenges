class DrinksController < ApplicationController
  def new
    @drink = Drink.new
  end

  def create
    @drink = Drink.new(drink_params)
    if @drink.save
      flash[:notice] = 'Drink added.'
      redirect_to '/drinks'
    else
      render :new
    end
  end

  def index
    @drinks = Drink.page(params[:page])
  end

  def destroy
    Drink.destroy(params[:id])
    flash[:notice] = "Drink deleted."
    redirect_to drinks_path
  end

  def alcohol_level
    "Rocket Fuel"
  end

  def alcohol_level_string=(value)
    case value
    when "Rocket Fuel"
      self.alcohol_level = 4
    when "Strong"
      self.alcohol_level = 3
    when "Medium"
      self.alcohol_level = 2
    when "Weak"
      self.alcohol_level = 1
    when "Non-Alcoholic"
      self.alcohol_level = 0
    else
      self.alcohol_level = nil
    end
  end

  protected
  def drink_params
    params.require(:drink).permit(:title, :description, :category_id, :alcohol_level)
  end
end
