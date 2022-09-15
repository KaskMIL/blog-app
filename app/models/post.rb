class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, foreign_key: 'posts_id', inverse_of: 'posts'
  has_many :likes, foreign_key: 'posts_id', inverse_of: 'posts'

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :commentsCounter, comparison: { greater_than_or_equal_to: 0 }

  after_initialize do |post|
    post.commentsCounter = 0
    post.likesCounter = 0
  end

  after_save :update_counter

  def recent_comment
    comments.order(created_at: :desc).first(5)
  end

  private

  def update_counter
    author.increment!(:postCounter)
  end
end
