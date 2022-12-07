class ChangeStatusToStringInReservations < ActiveRecord::Migration[7.0]
  def change
    change_column :reservations, :status, :string
  end
end
