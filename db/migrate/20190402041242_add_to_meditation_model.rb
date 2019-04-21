class AddToMeditationModel < ActiveRecord::Migration[5.2]
  def change

    add_column :meditations, :begin_time, :string
  end
end
