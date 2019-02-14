class AddMhsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :MHSIG_1, :string
    add_column :users, :MHSIG_2, :string
    add_column :users, :MHSIG_3, :string
    add_column :users, :MHSIG_4, :string
    add_column :users, :MHSIG_5, :string
    add_column :users, :MHSproduct_1, :string
    add_column :users, :MHSroduct_2, :string
    add_column :users, :MHSproduct_3, :string
    add_column :users, :MHSproduct_4, :string
    add_column :users, :MHSproduct_5, :string
  end
end
