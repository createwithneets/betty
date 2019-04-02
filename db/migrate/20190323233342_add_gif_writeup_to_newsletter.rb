class AddGifWriteupToNewsletter < ActiveRecord::Migration[5.2]
  def change

    add_column :newsletters, :gifwriteup, :string
  end
end
