class ProductsController < ApplicationController
  before_action :set_shop, :only[:show, :new, :create]
  before_action :set_product, :only[:show]

  def new
    Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to #ver ruta
    else
      render :new, status: :unprocessable_entity
  end

  def show
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :info)
  end
end
