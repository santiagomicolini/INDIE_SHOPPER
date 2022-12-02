class BasketController < ApplicationController
  def show
    @basket = Basket.find_by(user: current_user)
    authorize @basket
    @products = @basket.products
  end
end
