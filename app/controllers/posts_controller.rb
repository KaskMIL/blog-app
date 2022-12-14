class PostsController < ApplicationController
  load_and_authorize_resource param_method: :post_parameters

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @comments = Comment.includes(:author)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = Comment.includes(:author).where(posts_id: params[:id])
  end

  def new
    @user = current_user
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @user = current_user
    @post = Post.new(post_parameters)
    @post.author = @user

    if @post.save
      flash[:success] = 'Post saved successfully!'
      redirect_to user_path(@user.id)
    else
      flash.now[:error] = 'Please, fill all the fields.'
      render :new, status: 422
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to user_path(params[:user_id])
  end

  private

  def post_parameters
    params.require(:post).permit(:title, :text)
  end
end
