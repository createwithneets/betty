class EditMeditationDate < ActiveRecord::Migration[5.2]
  def change

    remove_column :meditations, :date
    add_column :meditations, :date, :date
  end

end
