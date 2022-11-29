class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  def index
    @shops = Shop.all
  end

  def new
    @country = request.location.country_code
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user = current_user
    @shop.save
  end

  def show
    @products = @shop.products
  end

  def edit
  end

  def update
    if @shop.update(shop_params)
      redirect_to shop_path(@shop)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :address, :phone_number)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
