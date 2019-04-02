ActiveAdmin.register Meditation do
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
permit_params :title, :date, :tags, :embed_code, :begin_time

index do
selectable_column
index_column
column :title
column :date
column :tags
actions
end


form do |f|
  #this is to group things together
  f.inputs "Main Info" do
    f.input :title,  label: "Title"
    f.input :date,  label: "Date"
    f.input :tags,  label: "Tags"
    f.input :embed_code,  label: "Video Code"
    f.input :begin_time,  label: "Begin Time"
  end

  f.actions

  end


end
