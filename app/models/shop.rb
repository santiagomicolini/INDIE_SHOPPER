class Shop < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode
  has_many_attached :photos
end
