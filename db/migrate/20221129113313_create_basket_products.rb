class CreateBasketProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :basket_products do |t|
      t.references :product, null: false, foreign_key: true
      t.references :basket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
