class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, class_name: 'PostLike'
end
