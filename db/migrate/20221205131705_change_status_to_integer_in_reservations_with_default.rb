class ChangeStatusToIntegerInReservationsWithDefault < ActiveRecord::Migration[7.0]
  def change
    change_column :reservations, :status, :integer, using: 'status::integer'
  end
end
