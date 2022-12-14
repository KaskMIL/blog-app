class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, foreign_key: 'posts_id', dependent: :destroy
  has_many :likes, foreign_key: 'posts_id', dependent: :destroy

  after_save :update_counter
  after_destroy :update_counter

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :commentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comment
    comments.order(created_at: :desc).first(5)
  end

  private

  def update_counter
    author.update(postCounter: author.posts.count)
  end
end
