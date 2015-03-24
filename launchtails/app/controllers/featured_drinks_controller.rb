class FeaturedDrinksController < ApplicationController
  def index
    @drinks = Drink.featured.page
  end
end
