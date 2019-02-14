class AddMhsFinalToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :MHSroutine_1, :string
    add_column :users, :MHSroutine_2, :string
    add_column :users, :MHSroutine_3, :string
    add_column :users, :MHSgeneral_1, :string
    add_column :users, :MHSgeneral_3, :string
    add_column :users, :MHSgeneral_4, :string
    add_column :users, :MHSgeneral_5, :string
  end
end
