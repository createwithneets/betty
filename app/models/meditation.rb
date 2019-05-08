class Meditation < ApplicationRecord


  self.per_page = 10



  def self.search(search)
  where("title LIKE ? OR tags LIKE ?", "%#{search}%", "%#{search}%")
  end

  scope :between, -> (sender_id,receiver_id) do
    where("(conversations.sender_id = ? AND conversations.receiver_id = ?) OR (conversations.receiver_id = ? AND conversations.sender_id = ?)", sender_id, receiver_id, sender_id, receiver_id)
  end

  def recipient(current_user)
  self.sender_id == current_user.id ? self.receiver : self.sender
  end


end
