ActiveAdmin.register Newsletter do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end



permit_params :title, :date, :mainimage, :introduction, :article_1, :writeup_1, :image_1, :link_1,
 :article_2, :writeup_2, :image_2, :link_2,
 :article_3, :writeup_3, :image_3, :link_3,
 :article_4, :writeup_4, :image_4, :link_4,
 :article_5, :writeup_5, :image_5, :link_5,
 :article_6, :writeup_6, :image_6, :link_6,
 :article_7, :writeup_7, :image_7, :link_7,
 :article_8, :writeup_8, :image_8, :link_8,
 :article_9, :writeup_9, :image_9, :link_9,
 :article_10, :writeup_10, :image_10, :link_10,
:bonus_article_1, :bonus_writeup_1, :bonus_image_1, :bonus_link_1,
:bonus_article_2, :bonus_writeup_2, :bonus_image_2, :bonus_link_2,
:bonus_article_3, :bonus_writeup_3, :bonus_image_3, :bonus_link_3,
:bonus_article_4, :bonus_writeup_4, :bonus_image_4, :bonus_link_4,
:bonus_article_5, :bonus_writeup_5, :bonus_image_5, :bonus_link_5, :newslettergif, :gifwriteup


index do
selectable_column
index_column
column "Main image" do |newsletter|
  image_tag newsletter.mainimage.medium.url, width: "150"
end
column :title
column :date
actions
end


form do |f|
  #this is to group things together
  f.inputs "Main Info" do
    f.input :title,  label: "Title"
    f.input :date,  label: "Date"
    f.input :mainimage,  label: "Main Image"
    f.input :introduction,  label: "Intro Writeup"
    f.input :newslettergif,  label: "Gif"
    f.input :gifwriteup,  label: "Gif Writeup"
  end

f.inputs "Article 1" do
  f.input :article_1, label: "Article Title"
  f.input :writeup_1, label: "Brief Writeup"
  f.input :image_1, label: "Image for Article"
  f.input :link_1, label: "Actual Link"
end

f.inputs "Article 2" do
  f.input :article_2, label: "Article Title"
  f.input :writeup_2, label: "Brief Writeup"
  f.input :image_2, label: "Image for Article"
  f.input :link_2, label: "Actual Link"
end

f.inputs "Article 3" do
  f.input :article_3, label: "Article Title"
  f.input :writeup_3, label: "Brief Writeup"
  f.input :image_3, label: "Image for Article"
  f.input :link_3, label: "Actual Link"
end

f.inputs "Article 4" do
  f.input :article_4, label: "Article Title"
  f.input :writeup_4, label: "Brief Writeup"
  f.input :image_4, label: "Image for Article"
  f.input :link_4, label: "Actual Link"
end

f.inputs "Article 5" do
  f.input :article_5, label: "Article Title"
  f.input :writeup_5, label: "Brief Writeup"
  f.input :image_5, label: "Image for Article"
  f.input :link_5, label: "Actual Link"
end

f.inputs "Article 6" do
  f.input :article_6, label: "Article Title"
  f.input :writeup_6, label: "Brief Writeup"
  f.input :image_6, label: "Image for Article"
  f.input :link_6, label: "Actual Link"
end

f.inputs "Article 7" do
  f.input :article_7, label: "Article Title"
  f.input :writeup_7, label: "Brief Writeup"
  f.input :image_7, label: "Image for Article"
  f.input :link_7, label: "Actual Link"
end

f.inputs "Article 8" do
  f.input :article_8, label: "Article Title"
  f.input :writeup_8, label: "Brief Writeup"
  f.input :image_8, label: "Image for Article"
  f.input :link_8, label: "Actual Link"
end

f.inputs "Article 9" do
  f.input :article_9, label: "Article Title"
  f.input :writeup_9, label: "Brief Writeup"
  f.input :image_9, label: "Image for Article"
  f.input :link_9, label: "Actual Link"
end

f.inputs "Article 10" do
  f.input :article_10, label: "Article Title"
  f.input :writeup_10, label: "Brief Writeup"
  f.input :image_10, label: "Image for Article"
  f.input :link_10, label: "Actual Link"
end

f.inputs "BONUS Article 1" do
  f.input :bonus_article_1, label: "Article Title"
  f.input :bonus_writeup_1, label: "Brief Writeup"
  f.input :bonus_image_1, label: "Image for Article"
  f.input :bonus_link_1, label: "Actual Link"
end

f.inputs "BONUS Article 2" do
  f.input :bonus_article_2, label: "Article Title"
  f.input :bonus_writeup_2, label: "Brief Writeup"
  f.input :bonus_image_2, label: "Image for Article"
  f.input :bonus_link_2, label: "Actual Link"
end

f.inputs "BONUS Article 3" do
  f.input :bonus_article_3, label: "Article Title"
  f.input :bonus_writeup_3, label: "Brief Writeup"
  f.input :bonus_image_3, label: "Image for Article"
  f.input :bonus_link_3, label: "Actual Link"
end


f.inputs "BONUS Article 4" do
  f.input :bonus_article_4, label: "Article Title"
  f.input :bonus_writeup_4, label: "Brief Writeup"
  f.input :bonus_image_4, label: "Image for Article"
  f.input :bonus_link_4, label: "Actual Link"
end

f.inputs "BONUS Article 5" do
  f.input :bonus_article_5, label: "Article Title"
  f.input :bonus_writeup_5, label: "Brief Writeup"
  f.input :bonus_image_5, label: "Image for Article"
  f.input :bonus_link_5, label: "Actual Link"
end

f.actions

end
end
