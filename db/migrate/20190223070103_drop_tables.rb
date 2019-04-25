class DropTables < ActiveRecord::Migration[5.2]
  def change

  drop_table :charges, if_exists: true
  drop_table :coupons, if_exists: true
  end
end
