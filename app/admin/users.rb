require 'csv'

ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :first_name, :last_name, :email, :password, :photo, :photogif, :password_confirmation, :ig_username, :address_1, :address_2, :city, :country, :points, :postal_code, :meme_1,
 :meme_2, :meme_3, :meme_4, :meme_5, :meme_6, :meme_7, :meme_8, :admin, :referral_code
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

  index do
  selectable_column
  index_column
  column "Main image" do |user|
    image_tag user.photo.thumb.url, width: "60"
  end
  column :ig_username
  column :first_name
  column :last_name
  column :email
  column :address_1
  column :address_2
  column :city
  column :country
  column :postal_code
  column :tune_in
  column :points
  column :referral_code
  actions
  end


  form do |f|
    #this is to group things together
    f.inputs "User Info" do
      f.input :ig_username
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :address_1
      f.input :address_2
      f.input :city
      f.input :country
      f.input :postal_code
      f.input :tune_in
      f.input :points
      f.input :password
      f.input :password_digest
      f.input :about
      f.input :admin
      f.input :referral_code
    end

  f.inputs "Stripe Info" do
    f.input :stripe_customer, label: "Stripe Customer"
    f.input :stripe_token, label: "Stripe Token"
    f.input :stripe_subscription, label: "Stripe Subscription"
    f.input :is_subscription_active, label: "Is Subcription Active"
  end


  f.inputs "Photos" do
  f.input :photo
  f.input :photogif, label: "Gif"
  f.input :meme_1, label: "Meme 1"
  f.input :meme_2, label: "Meme 2"
  f.input :meme_3, label: "Meme 3"
  f.input :meme_4, label: "Meme 4"
  f.input :meme_5, label: "Meme 5"
  f.input :meme_6, label: "Meme 6"
  f.input :meme_7, label: "Meme 7"
  f.input :meme_8, label: "Meme 8"
  end

  f.inputs "Mental Health Shelf Quotes" do
  f.input :MHSquote_1, label: "Quote 1"
  f.input :MHSquote_2, label: "Quote 2"
  f.input :MHSquote_3, label: "Quote 3"
  end

  f.inputs "Mental Health Shelf Books" do
  f.input :MHSbook_1, label: "Book 1"
  f.input :MHSbook_2, label: "Book 2"
  f.input :MHSbook_3, label: "Book 3"
  f.input :MHSbook_4, label: "Book 4"
  f.input :MHSbook_5, label: "Book 5"
  end

  f.inputs "Mental Health Shelf IG Accounts" do
  f.input :MHSIG_1, label: "Instagram Account 1"
  f.input :MHSIG_2, label: "Instagram Account 2"
  f.input :MHSIG_3, label: "Instagram Account 3"
  f.input :MHSIG_4, label: "Instagram Account 4"
  f.input :MHSIG_5, label: "Instagram Account 5"
  end

  f.inputs "Mental Health Shelf Products" do
  f.input :MHSproduct_1, label: "Product 1"
  f.input :MHSroduct_2, label: "Product 2"
  f.input :MHSproduct_3, label: "Product 3"
  f.input :MHSproduct_4, label: "Product 4"
  f.input :MHSproduct_5, label: "Product 5"
  end

  f.inputs "Mental Health Shelf Routine" do
  f.input :MHSroutine_1, label: "Routine Tip 1"
  f.input :MHSroutine_2, label: "Routine Tip 2"
  f.input :MHSroutine_3, label: "Routine Tip 3"
  end

  f.inputs "Mental Health Shelf General" do
  f.input :MHSgeneral_1, label: "General Tip 1"
  f.input :MHSgeneral_3, label: "General Tip 2"
  f.input :MHSgeneral_4, label: "General Tip  3"
  f.input :MHSgeneral_5, label: "General Tip  4"
  end

  f.actions


  end

end
