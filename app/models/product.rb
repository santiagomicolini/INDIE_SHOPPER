class Product < ApplicationRecord
  belongs_to :shop
  has_many_attached :photos
end
