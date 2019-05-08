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

      scope :between, -> (sender_id,receiver_id) do
        where("(conversations.sender_id = ? AND conversations.receiver_id = ?) OR (conversations.receiver_id = ? AND conversations.sender_id = ?)", sender_id, receiver_id, sender_id, receiver_id)
    end

    def recipient(current_user)
    self.sender_id == current_user.id ? self.receiver : self.sender
    end


end
