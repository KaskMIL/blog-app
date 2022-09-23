class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(author: current_user, posts: @post)

    respond_to do |format|
      format.html do
        if @post.likes.find_by_author_id(current_user.id)
          flash.now[:error] = 'You already like the post'
        else
          @like.save
          redirect_to user_post_path(current_user, @post)
        end
      end
    end
  end
end
