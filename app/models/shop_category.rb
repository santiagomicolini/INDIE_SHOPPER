class ShopCategory < ApplicationRecord
  has_many :shops, dependent: :destroy
end
