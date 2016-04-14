class Post < ActiveRecord::Base
  validates :title, length: { maximum: 65, minimum: 5 }
  validates :content, length: { minimum: 20 }
end
