class BasketProductsController < ApplicationController

  def create
    if current_user.basket.nil?
      @basket = Basket.create(user: current_user)
    else
      @basket = Basket.find_by(user: current_user)
    end

    @basket_product = BasketProduct.create(basket: @basket, product_id: params[:product_id])
    authorize @basket_product
    redirect_to shop_path(@basket_product.product.shop)
    flash[:notice] = "Product added"
  end

  def destroy
    @product = BasketProduct.find_by(product_id: params[:id])
    authorize @product
    @product.destroy
    flash[:notice] = "Item deleted"
    @basket = Basket.find_by(user: current_user)
    redirect_to basket_path(@basket)
  end
end
