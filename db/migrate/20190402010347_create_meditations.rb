class CreateMeditations < ActiveRecord::Migration[5.2]
  def change
    create_table :meditations do |t|
        t.string :title
        t.string :date
        t.string :tags
        t.string :embed_code
      t.timestamps
    end
  end
end
