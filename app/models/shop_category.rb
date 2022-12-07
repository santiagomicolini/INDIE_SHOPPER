class ShopCategory < ApplicationRecord
  has_many :shops, dependent: :destroy

  ICONS = {
    "Clothing" => '<i class="fa-sharp fa-solid fa-shirt"></i>',
    "Furniture" => '<i class="fa-sharp fa-solid fa-couch"></i>',
    "Home" => '<i class="fa-sharp fa-solid fa-house"></i>',
    "Plants" => '<i class="fa-sharp fa-solid fa-leaf"></i>',
    "Footwear" => '<i class="fa-solid fa-shoe-prints"></i>',
    "Decoration" => '<i class="fa-solid fa-rug"></i>',
    "Jewelry" => '<i class="fa-sharp fa-solid fa-gem"></i>',
    "Wineries" => '<i class="fa-sharp fa-solid fa-wine-glass"></i>',
    "Kitchen" => '<i class="fa-solid fa-kitchen-set"></i>'
  }
end
