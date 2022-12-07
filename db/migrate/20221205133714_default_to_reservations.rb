class DefaultToReservations < ActiveRecord::Migration[7.0]
  def change
    change_column :reservations, :status, :integer, default: 0
  end
end
