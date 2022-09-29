class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_parameters)
    @comment.author = current_user
    @comment.posts = @post

    if @comment.save
      flash[:success] = 'Comment created!'
    else
      flash[:error] = 'You need to write a comment before send it!'
    end
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to user_path(params[:user_id])
  end

  private

  def comment_parameters
    params.require(:comment).permit(:text, :author, :post)
  end
end
