class Meditation < ApplicationRecord


  self.per_page = 10



  def self.search(search)
  where("title LIKE ? OR tags LIKE ?", "%#{search}%", "%#{search}%")
  end



end
