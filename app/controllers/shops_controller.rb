class ShopsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @shops = Shop.global_search(params[:query])
    else
      @shops = Shop.all
    end
    @markers = @shops.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
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
    @message = Message.new
    if @chat = current_user.chats.find { |chat| chat.users.include?(@shop.user) }
      @chat
    end
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
