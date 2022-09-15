class Like < ApplicationRecord
  belongs_to :posts, class_name: 'Post'
  belongs_to :author, class_name: 'User'

  after_save :update_counter

  private

  def update_counter
    posts.increment!(:likesCounter)
  end
end
