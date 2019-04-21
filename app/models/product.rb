class Product < ApplicationRecord

  has_many :order_items

  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true

  mount_uploader :images, PhotoUploader
  mount_uploader :images_2, PhotoUploader
  mount_uploader :images_3, PhotoUploader


  def price_in_dollars
        price/100
      end

end
