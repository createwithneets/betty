ActiveAdmin.register Product do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :description, :images, :images_2, :images_3, :collection_date, :is_sold_out, :price, :price_with_tax, :inventory, :size
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
selectable_column
index_column
column "Main image" do |product|
  image_tag product.images.thumb.url, width: "60"
end
column :title
column :price
column :inventory
column :is_sold_out
actions
end






form do |f|
  #this is to group things together
  f.inputs "Product Info" do
    f.input :title
    f.input :price
    f.input :price_with_tax
    f.input :description
    f.input :collection_date
    f.input :inventory
  end

f.inputs "Filters" do
  f.input :is_sold_out, label: "Sold out?"
end


f.inputs "Images" do
f.input :images
f.input :images_2
f.input :images_3

end


f.actions


end
end
