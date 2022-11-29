class ProductsController < ApplicationController
  before_action :set_shop, :only[:show, :new, :create]
  before_action :set_product, :only[:show]

  def new
    Product.new
  end

  def create
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
end
