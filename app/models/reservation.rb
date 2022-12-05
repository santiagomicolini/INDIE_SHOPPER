class Reservation < ApplicationRecord
  enum :status, { Pending: 0, Confirmed: 1, Rejected: 2, Collected: 3 }
  belongs_to :shop
  belongs_to :user
  has_many :reservation_products, dependent: :destroy
end
