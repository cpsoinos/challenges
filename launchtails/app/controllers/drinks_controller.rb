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

  def destroy
    Drink.find(params[:id]).destroy
    flash[:notice] = 'Drink deleted.'
    redirect_to '/drinks'
  end

  def index
    @drinks = Drink.page(params[:page])
  end

  protected
  def drink_params
    params.require(:drink).permit(:title, :description)
  end
end
