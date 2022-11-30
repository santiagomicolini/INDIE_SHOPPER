class ProductsController < ApplicationController
  before_action :set_shop, only: [:show]
  before_action :set_product, only: [:show]

  # def new
  #   @product = Product.new
  # authorize @product
  # end

  # # def create
  # #   @product = Product.new(product_params)
  # #   @product.shop = Shop.find(params[:shop_id])
  # authorize @product
  # #   if @product.save
  # #     redirect_to shop_path(params[:shop_id])
  # #   else
  # #     render :new, status: :unprocessable_entity
  # #   end
  # # end

  def show
    authorize @product
  end

  def update
    authorize @product
    @product.update(product_params)
    if @product.save
      redirect_to shop_path(params[:shop_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def destroy
  # authorize @product
  #   @product.destroy
  #   redirect_to shop_path(params[:shop_id]), status: :see_other
  # end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  # def product_params
  #   params.require(:product).permit(:name, :price, :info, photos: [])
  # end
end
