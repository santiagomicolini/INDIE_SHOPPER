class BasketProduct < ApplicationRecord
  belongs_to :product
  belongs_to :basket, dependent: :destroy
end
