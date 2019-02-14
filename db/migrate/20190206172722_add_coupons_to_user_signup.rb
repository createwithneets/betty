class AddCouponsToUserSignup < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :coupon, :string
  end
end
