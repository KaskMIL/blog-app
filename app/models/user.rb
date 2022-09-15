class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', inverse_of: 'author'
  has_many :comments, foreign_key: 'author_id', inverse_of: 'author'
  has_many :likes, foreign_key: 'author_id', inverse_of: 'author'

  def three_recent_post
    Post.where(author: self).order(:created_at).first(3)
  end
end
