class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :postalcode

      t.timestamps
    end
  end
end
