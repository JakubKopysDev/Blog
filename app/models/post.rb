class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, length: { maximum: 65, minimum: 5 }
  validates :content, length: { minimum: 20 }
end
