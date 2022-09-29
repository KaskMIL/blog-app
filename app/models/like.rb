class Like < ApplicationRecord
  belongs_to :posts, class_name: 'Post'
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  after_save :update_counter
  after_destroy :update_counter

  private

  def update_counter
    posts.update(likesCounter: posts.likes.count)
  end
end
