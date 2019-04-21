class AddTaxToPrice < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :price_with_tax, :integer
  end
end
