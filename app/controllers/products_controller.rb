require "csv"
require 'open-uri'

class ProductsController < ApplicationController
  before_action :set_shop, only: [:show, :new]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def new
    @product = Product.new
    authorize @product
  end

  def create
    if params[:product][:csv_file]
      CSV.foreach(params[:product][:csv_file].path, headers: :first_row) do |row|
        @name = row['name']
        @price = row['price'].to_f
        @info = row['info']
        @product_category = ProductCategory.find_by(product_category_name: row['product_category'])
        @shop = Shop.find(params[:shop_id])
        @photo = URI.open(row['photos'])
        @product = Product.new(name: @name, price: @price, info: @info, product_category: @product_category, shop: @shop)
        @product.photos.attach(io: @photo, filename: "#{@name}.png", content_type: "image/png")
        authorize @product
        @product.save!
      end
      redirect_to shop_path(@product.shop)
    else
      @product = Product.new(product_params)
      @product.shop = Shop.find(params[:shop_id])
      authorize @product
      if @product.save!
        redirect_to shop_path(@product.shop)
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def show
    authorize @product
  end

  def edit
    authorize @product
  end

  def update
    authorize @product
    @product.update(product_params)
    if @product.save
      redirect_to shop_path(@product.shop)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @product
    @product.destroy
    redirect_to shop_path(@product.shop), status: :see_other
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :info, :product_category_id, photos: [])
  end

end
