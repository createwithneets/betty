class RemoveCheckinQ < ActiveRecord::Migration[5.2]
  def change

    remove_column :users, :check_in_q_1
    remove_column :users, :check_in_q_2
    remove_column :users, :check_in_q_3
  end
end
