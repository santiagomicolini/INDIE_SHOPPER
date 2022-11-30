class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  def index
    # @location = request.location.coordinates
    # @shops = Shop.all.within 2km of location
  end

  def new
    @shop = Shop.new
    authorize @shop
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user = current_user
    @shop.save
    authorize @shop
  end

  def show
    authorize @shop
    @products = @shop.products
    @review = Review.new
  end

  def edit
    authorize @shop
  end

  def update
    authorize @shop
    if @shop.update(shop_params)
      redirect_to shop_path(@shop)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    authorize @shop
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :address, :phone_number)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
