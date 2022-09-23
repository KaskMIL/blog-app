class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_parameters)
    @comment.author = current_user
    @comment.posts = @post

    respond_to do |format|
      format.html do
        if @comment.save
          flash[:success] = 'Comment created!'
          redirect_to user_post_path(current_user, @post)
        else
          redirect_to user_post_path(current_user, @post)
          flash[:error] = 'You need to write a comment before send it!'
        end
      end
    end
  end

  private

  def comment_parameters
    params.require(:comment).permit(:text, :author, :post)
  end
end
