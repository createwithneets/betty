require 'csv'

ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :first_name, :last_name, :email, :password, :password_confirmation, :ig_username, :address_1, :address_2, :city, :country, :points, :postal_code
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  action_item :import_csv, only: :index do
    link_to 'Import CSV', import_csv_admin_users_path, method: :get
  end

  collection_action :import_csv do
    render "admin/users/import_csv"
  end

  collection_action :importing_csv, method: :post do
    csv_data = params[:csv][:csv]

    headers = true
    CSV.parse(csv_data.read) do |row|
      if headers
        headers = false
      else
        first_name = row[0]
        last_name = row[1]
        email = row[2]
        insta = row[3]
        points = row[4]
        discount = row[5]

        @user = User.find_by(email: email)
        if @user.present?
        @user.update_attributes(points: points)
        end 
      end
    end

    redirect_to collection_path, notice: "CSV imported successfully!"
  end
end
