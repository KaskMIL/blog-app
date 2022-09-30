class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @post = Post.find(params[:post_id])

    render json: @post.comments
  end

  def create
    comment = Comment.new(text: params[:text], author: User.find(1), posts: Post.find(5))

    if comment.save
      render json: comment, status: :created
    else
      render json :comment.errors, status: :unproccessable_entity
    end
  end
end
