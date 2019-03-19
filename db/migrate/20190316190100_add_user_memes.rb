class AddUserMemes < ActiveRecord::Migration[5.2]
  def change

    add_column :users, :meme_1, :string
    add_column :users, :meme_2, :string
    add_column :users, :meme_3, :string
    add_column :users, :meme_4, :string
    add_column :users, :meme_5, :string
    add_column :users, :meme_6, :string
    add_column :users, :meme_7, :string
    add_column :users, :meme_8, :string
  end
end
