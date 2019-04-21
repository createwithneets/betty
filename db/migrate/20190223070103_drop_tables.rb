class DropTables < ActiveRecord::Migration[5.2]
  def change

  drop_table :charges
  drop_table :coupons
  end
end
