class Comment < ActiveRecord::Base
  belongs_to :post
  validates :name, presence: true, length: { maximum: 25, minimum: 4 }
  validates :content, presence: true, length: { minimum: 5 }
end
