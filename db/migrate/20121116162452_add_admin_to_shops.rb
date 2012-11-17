class AddAdminToShops < ActiveRecord::Migration
  def change
    add_column :shops, :admin, :boolean
  end
end
