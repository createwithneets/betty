class EditNewsletterColumns < ActiveRecord::Migration[5.2]
  def change

    remove_column :newsletters, :introduction
    add_column :newsletters, :introduction, :text
    remove_column :newsletters, :date
    add_column :newsletters, :date, :date



  end
end
