class CreateReservationProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :reservation_products do |t|
      t.references :product, null: false, foreign_key: true
      t.references :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
