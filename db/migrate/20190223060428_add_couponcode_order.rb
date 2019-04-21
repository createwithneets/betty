class AddCouponcodeOrder < ActiveRecord::Migration[5.2]
  def change

    add_column :orders, :couponCode, :string
    add_column :orders, :couponAmount, :integer
    add_column :orders, :coupon_id, :integer
    add_column :orders, :stripe_id, :integer

  end
end
