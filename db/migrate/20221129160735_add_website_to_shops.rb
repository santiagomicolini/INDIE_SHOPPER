class AddWebsiteToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :website, :string
  end
end
