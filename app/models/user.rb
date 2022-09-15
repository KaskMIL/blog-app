class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', inverse_of: 'author'
  has_many :comments, foreign_key: 'author_id', inverse_of: 'author'
  has_many :likes, foreign_key: 'author_id', inverse_of: 'author'

  validates :name, presence: true
  validates :postCounter, comparison: { greater_than_or_equal_to: 0}

  after_initialize do |user|
    user.postCounter = 0
  end

  def recent_post
    Post.where(author: self).order(created_at: :desc).first(3)
  end
end
