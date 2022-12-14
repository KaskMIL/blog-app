class Api::V1::CommentsController < ApplicationController
  include JsonWebToken
  skip_before_action :verify_authenticity_token
  before_action :authenticate_request

  def index
    @post = Post.find(params[:post_id])

    render json: @post.comments
  end

  def create
    comment = Comment.new(text: params[:text], author: @current_user, posts: Post.find(params[:post_id]))

    if comment.save
      render json: comment, status: :created
    else
      render json :comment.errors, status: :unproccessable_entity
    end
  end
end
