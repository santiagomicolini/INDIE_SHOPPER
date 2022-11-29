class AddShopCategoryToShops < ActiveRecord::Migration[7.0]
  def change
    add_reference :shops, :shop_category, null: false, foreign_key: true
  end
end
