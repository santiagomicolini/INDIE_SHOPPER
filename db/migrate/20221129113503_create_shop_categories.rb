class CreateShopCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :shop_categories do |t|
      t.string :shop_category_name

      t.timestamps
    end
  end
end
