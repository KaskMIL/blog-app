class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @post = Post.find(params[:post_id])

    render json: @post.comments
  end
end
