class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, foreign_key: 'posts_id', inverse_of: 'posts'
  has_many :likes, foreign_key: 'posts_id', inverse_of: 'posts'

  validates :title, presence: true

  after_save :update_counter

  def recent_comment
    comments.order(created_at: :desc).first(5)
  end

  private

  def update_counter
    author.increment!(:postCounter)
  end
end
