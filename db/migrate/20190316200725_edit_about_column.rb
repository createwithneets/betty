class EditAboutColumn < ActiveRecord::Migration[5.2]
  def change

    remove_column :users, :about
    add_column :users, :about, :string

  end
end
