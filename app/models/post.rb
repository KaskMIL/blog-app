class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: 'posts_id', inverse_of: 'post'
  has_many :likes, foreign_key: 'posts_id', inverse_of: 'post'
end
