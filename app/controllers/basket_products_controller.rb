class BasketProductsController < ApplicationController
  def new
  end

  def create
    if current_user.basket.nil?
      @basket = Basket.create(user: current_user)
    else
      @basket = Basket.find_by(user: current_user)
    end

    @basket_product = BasketProduct.create(basket: @basket, product_id: params[:product_id])
    authorize @basket_product
    redirect_to shops_path
  end

  def destroy
  end
end
