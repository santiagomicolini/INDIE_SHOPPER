class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.text :info
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
