class Product < ApplicationRecord
  belongs_to :shop
  belongs_to :product_category
  has_many_attached :photos, dependent: :destroy
  has_many :reservation_products, dependent: :destroy
  has_many :basket_products, dependent: :destroy
end
