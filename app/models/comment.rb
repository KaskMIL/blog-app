class Comment < ApplicationRecord
  belongs_to :posts, class_name: 'Post'
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  after_save :update_counter

  validates :text, presence: true

  private

  def update_counter
    posts.increment!(:commentsCounter)
  end
end
