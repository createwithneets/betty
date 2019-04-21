class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :images
      t.text :description
      t.integer :price
      t.string :collection_date
      t.boolean :is_sold_out
      t.timestamps
    end
  end
end
