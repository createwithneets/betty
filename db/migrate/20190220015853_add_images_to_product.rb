class AddImagesToProduct < ActiveRecord::Migration[5.2]
  def change

    add_column :products, :images_2, :string
    add_column :products, :images_3, :string

  end
end
