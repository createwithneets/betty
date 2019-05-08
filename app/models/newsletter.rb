class Newsletter < ApplicationRecord

self.per_page = 9



def self.search(search)
where("title LIKE ? OR introduction LIKE ? OR article_1 LIKE ? OR writeup_1 LIKE ?
  OR article_2 LIKE ? OR writeup_2 LIKE ?
  OR article_3 LIKE ? OR writeup_3 LIKE ?
  OR article_4 LIKE ? OR writeup_4 LIKE ?
  OR article_5 LIKE ? OR writeup_5 LIKE ?
  OR article_6 LIKE ? OR writeup_6 LIKE ?
  OR article_7 LIKE ? OR writeup_7 LIKE ?
  OR article_8 LIKE ? OR writeup_8 LIKE ?
  OR article_9 LIKE ? OR writeup_9 LIKE ?
  OR article_10 LIKE ? OR writeup_10 LIKE ?
  OR bonus_article_1 LIKE ? OR bonus_writeup_1 LIKE ?
  OR bonus_article_2 LIKE ? OR bonus_writeup_2 LIKE ?
  OR bonus_article_3 LIKE ? OR bonus_writeup_3 LIKE ?
  OR bonus_article_4 LIKE ? OR bonus_writeup_4 LIKE ?
  OR bonus_article_5 LIKE ? OR bonus_writeup_5 LIKE ?", "%#{search}%", "%#{search}%",
  "%#{search}%", "%#{search}%",
"%#{search}%", "%#{search}%",
"%#{search}%", "%#{search}%",
"%#{search}%", "%#{search}%",
"%#{search}%", "%#{search}%",
"%#{search}%", "%#{search}%",
"%#{search}%", "%#{search}%",
"%#{search}%", "%#{search}%",
"%#{search}%", "%#{search}%",
"%#{search}%", "%#{search}%",
"%#{search}%", "%#{search}%",
"%#{search}%", "%#{search}%",
"%#{search}%", "%#{search}%",
"%#{search}%", "%#{search}%",
"%#{search}%", "%#{search}%")
end

scope :between, -> (sender_id,receiver_id) do
  where("(conversations.sender_id = ? AND conversations.receiver_id = ?) OR (conversations.receiver_id = ? AND conversations.sender_id = ?)", sender_id, receiver_id, sender_id, receiver_id)
end

def recipient(current_user)
self.sender_id == current_user.id ? self.receiver : self.sender
end


mount_uploader :mainimage, NewsletterImageUploader
mount_uploader :image_1, NewsletterImageUploader
mount_uploader :image_2, NewsletterImageUploader
mount_uploader :image_3, NewsletterImageUploader
mount_uploader :image_4, NewsletterImageUploader
mount_uploader :image_5, NewsletterImageUploader
mount_uploader :image_6, NewsletterImageUploader
mount_uploader :image_7, NewsletterImageUploader
mount_uploader :image_8, NewsletterImageUploader
mount_uploader :image_9, NewsletterImageUploader
mount_uploader :image_10, NewsletterImageUploader
mount_uploader :bonus_image_1, NewsletterImageUploader
mount_uploader :bonus_image_2, NewsletterImageUploader
mount_uploader :bonus_image_3, NewsletterImageUploader
mount_uploader :bonus_image_4, NewsletterImageUploader
mount_uploader :bonus_image_5, NewsletterImageUploader
mount_uploader :newslettergif, NewsletterImageUploader

end
