class Shop < ApplicationRecord
  belongs_to :user
  belongs_to :shop_category
  # geocoded_by :address
  # after_validation :geocode
  has_many_attached :photos
end
