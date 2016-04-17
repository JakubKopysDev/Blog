class Comment < ActiveRecord::Base
  belongs_to :post
  validates :name, length: { maximum: 25, minimum: 4 }
  validates :content, length: { minimum: 5 }
end
