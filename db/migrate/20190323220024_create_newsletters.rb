class CreateNewsletters < ActiveRecord::Migration[5.2]
  def change
    create_table :newsletters do |t|
        t.string :title
        t.string :date
        t.string :mainimage
        t.string :introduction
        t.string :article_1
        t.text :writeup_1
        t.string :image_1
        t.string :link_1
        t.string :article_2
        t.text :writeup_2
        t.string :image_2
        t.string :link_2
        t.string :article_3
        t.text :writeup_3
        t.string :image_3
        t.string :link_3
        t.string :article_4
        t.text :writeup_4
        t.string :image_4
        t.string :link_4
        t.string :article_5
        t.text :writeup_5
        t.string :image_5
        t.string :link_5
        t.string :article_6
        t.text :writeup_6
        t.string :image_6
        t.string :link_6
        t.string :article_7
        t.text :writeup_7
        t.string :image_7
        t.string :link_7
        t.string :article_8
        t.text :writeup_8
        t.string :image_8
        t.string :link_8
        t.string :article_9
        t.text :writeup_9
        t.string :image_9
        t.string :link_9
        t.string :article_10
        t.text :writeup_10
        t.string :image_10
        t.string :link_10
        t.string :bonus_article_1
        t.text :bonus_writeup_1
        t.string :bonus_image_1
        t.string :bonus_link_1
        t.string :bonus_article_2
        t.text :bonus_writeup_2
        t.string :bonus_image_2
        t.string :bonus_link_2
        t.string :bonus_article_3
        t.text :bonus_writeup_3
        t.string :bonus_image_3
        t.string :bonus_link_3
        t.string :bonus_article_4
        t.text :bonus_writeup_4
        t.string :bonus_image_4
        t.string :bonus_link_4
        t.string :bonus_article_5
        t.text :bonus_writeup_5
        t.string :bonus_image_5
        t.string :bonus_link_5



      t.timestamps
    end
  end
end
