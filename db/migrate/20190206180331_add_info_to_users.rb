class AddInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :photo, :string
    add_column :users, :photogif, :string
    add_column :users, :about, :string
    add_column :users, :check_in_q_1, :string
    add_column :users, :check_in_q_2, :string
    add_column :users, :check_in_q_3, :string
    add_column :users, :tune_in, :integer
  end
end
