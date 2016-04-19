class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { maximum: 65, minimum: 5 }
  validates :content, presence: true, length: { minimum: 20 }
end
