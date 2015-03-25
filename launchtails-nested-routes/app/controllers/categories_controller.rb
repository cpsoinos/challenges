class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:category_id])
  end

  def self.drink
    @drink = Drink.where(category_id: params[:id])
  end
end
