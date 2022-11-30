class Shop < ApplicationRecord
  belongs_to :user
  belongs_to :shop_category
  has_many :products
  has_many :reviews
  geocoded_by :address
  # after_validation :geocode
  has_many_attached :photos
end
