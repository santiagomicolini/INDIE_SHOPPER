class Product < ApplicationRecord
  belongs_to :shop
  belongs_to :product_category
  has_many_attached :photos
end
