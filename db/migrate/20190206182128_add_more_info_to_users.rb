class AddMoreInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :MHSquote_1, :string
    add_column :users, :MHSquote_2, :string
    add_column :users, :MHSquote_3, :string
    add_column :users, :MHSbook_1, :string
    add_column :users, :MHSbook_2, :string
    add_column :users, :MHSbook_3, :string
    add_column :users, :MHSbook_4, :string
    add_column :users, :MHSbook_5, :string
  end
end
