class Shop < ApplicationRecord
  belongs_to :user
  belongs_to :shop_category
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many_attached :photos, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :product_categories, through: :products

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :address ],
    associated_against: {
      shop_category: :shop_category_name,
      products: :name,
      product_categories: :product_category_name
    },
    using: {
      tsearch: { prefix: true }
    }
end
