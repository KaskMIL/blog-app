class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true
  validates :postCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_post
    Post.where(author: self).order(created_at: :desc).first(3)
  end

  def admin?
    role == 'admin'
  end
end
