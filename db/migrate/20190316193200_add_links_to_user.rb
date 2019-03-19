class AddLinksToUser < ActiveRecord::Migration[5.2]
  def change

    add_column :users, :personalIG_link, :string
    add_column :users, :IG_link1, :string
    add_column :users, :IG_link2, :string
    add_column :users, :IG_link3, :string
    add_column :users, :IG_link4, :string
    add_column :users, :IG_link5, :string
    add_column :users, :video_links1, :string
    add_column :users, :vide_links2, :string
    add_column :users, :vide_links3, :string
    add_column :users, :vide_links4, :string
    add_column :users, :product_1, :string
    add_column :users, :product_2, :string
    add_column :users, :product_3, :string
    add_column :users, :product_4, :string
    add_column :users, :product_5, :string
    add_column :users, :spotify_profile, :string


  end
end
