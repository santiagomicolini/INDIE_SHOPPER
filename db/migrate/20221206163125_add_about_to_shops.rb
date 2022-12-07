class AddAboutToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :about, :text
  end
end
