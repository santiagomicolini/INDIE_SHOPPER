class BasketProductsController < ApplicationController
  def index
    @basket_user = @basket.find(params[:user_id])
    @basket_product = basket.find(params[:product_id]) #i have to find a particular product that I click and add it to the index of the basket
  end

  def new
  end

  def create
  end

  def destroy
  end
end
