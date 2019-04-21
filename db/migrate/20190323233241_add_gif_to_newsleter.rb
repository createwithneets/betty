class AddGifToNewsleter < ActiveRecord::Migration[5.2]
  def change

    add_column :newsletters, :newslettergif, :string
  end
end
