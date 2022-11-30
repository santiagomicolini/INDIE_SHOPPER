class Shop < ApplicationRecord
  belongs_to :user
  belongs_to :shop_category
  geocoded_by :address
  after_validation :geocode
  has_many_attached :photos, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :products, dependent: :destroy
end
