class ShopsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  def index
    @categories = ShopCategory.all
    if params[:query].present?
      @shops = Shop.global_search(params[:query])
    else
      @shops = Shop.all
    end

    if params[:category].present?
      @shops = @shops.where(shop_category_id: params[:category])
    end
    @markers = @shops.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def my_shop
    @shop = Shop.where(user_id: current_user).first
    @reservations = Reservation.where(shop_id: @shop)
    authorize @shop
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
    params.require(:shop).permit(:name, :address, :phone_number, photos: [])
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
