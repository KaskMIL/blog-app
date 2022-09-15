class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', inverse_of: 'author'
  has_many :comments, foreign_key: 'author_id', inverse_of: 'author'
  has_many :likes, foreign_key: 'author_id', inverse_of: 'author'

  validates :name, presence: true

  def recent_post
    Post.where(author: self).order(created_at: :desc).first(3)
  end
end
